#!/usr/bin/env bash
# wa-read.sh — read-only чтение локальной истории WhatsApp (macOS, нативное приложение).
# Метод и инварианты: ./README.md (tech-профиль)
#   + ../../decisions/2026-07-20-whatsapp-local-readonly.md
# НИКОГДА не пишем в базу приложения: работаем со снапшот-копией, оригинал read-only.
set -euo pipefail

SRC="$HOME/Library/Group Containers/group.net.whatsapp.WhatsApp.shared"
DB_NAME="ChatStorage.sqlite"

die() { echo "wa-read: $*" >&2; exit 1; }
[ -f "$SRC/$DB_NAME" ] || die "не нашёл $SRC/$DB_NAME — WhatsApp (App Store) установлен и синхронизирован?"
command -v sqlite3 >/dev/null || die "нет sqlite3"

# снапшот-копия (эфемерна, чистится на выходе); оригинал не трогаем
SNAP="$(mktemp -d "${TMPDIR:-/tmp}/wa-read.XXXXXX")"
trap 'rm -rf "$SNAP"' EXIT
cp "$SRC/$DB_NAME" "$SNAP/"
cp "$SRC/$DB_NAME-wal" "$SNAP/" 2>/dev/null || true
cp "$SRC/$DB_NAME-shm" "$SNAP/" 2>/dev/null || true
DB="$SNAP/$DB_NAME"

# дата Core Data -> локальное время
DT="datetime(m.ZMESSAGEDATE + 978307200,'unixepoch','localtime')"
# экранируем одинарные кавычки в пользовательском вводе
esc() { printf '%s' "${1//\'/\'\'}"; }

cmd="${1:-help}"; shift || true
case "$cmd" in
  chats)
    N="${1:-20}"
    sqlite3 -separator '  |  ' "$DB" "
      SELECT datetime(ZLASTMESSAGEDATE + 978307200,'unixepoch','localtime') AS last,
             ZPARTNERNAME, ZMESSAGECOUNTER
      FROM ZWACHATSESSION
      WHERE ZPARTNERNAME IS NOT NULL
      ORDER BY ZLASTMESSAGEDATE DESC LIMIT $((N));"
    ;;
  recent)
    [ $# -ge 1 ] || die "usage: wa-read.sh recent <часть-имени-чата> [N]"
    q="$(esc "$1")"; N="${2:-20}"
    sqlite3 -separator '  ' "$DB" "
      SELECT $DT AS dt,
             CASE m.ZISFROMME WHEN 1 THEN 'me' ELSE COALESCE(
               NULLIF(TRIM(gm.ZCONTACTNAME),''), NULLIF(TRIM(gm.ZFIRSTNAME),''),
               gm.ZMEMBERJID, '<-') END AS who,
             REPLACE(COALESCE(m.ZTEXT,'[media/no-text]'), char(10),' ')
      FROM ZWAMESSAGE m JOIN ZWACHATSESSION s ON m.ZCHATSESSION=s.Z_PK
           LEFT JOIN ZWAGROUPMEMBER gm ON m.ZGROUPMEMBER=gm.Z_PK
      WHERE s.ZPARTNERNAME LIKE '%$q%'
      ORDER BY m.ZMESSAGEDATE DESC LIMIT $((N));"
    ;;
  search)
    [ $# -ge 1 ] || die "usage: wa-read.sh search <слово> [N]"
    q="$(esc "$1")"; N="${2:-30}"
    sqlite3 -separator '  ' "$DB" "
      SELECT $DT AS dt, substr(COALESCE(s.ZPARTNERNAME,'?'),1,18) AS chat,
             CASE m.ZISFROMME WHEN 1 THEN 'me' ELSE '<-' END AS who,
             REPLACE(m.ZTEXT, char(10),' ')
      FROM ZWAMESSAGE m LEFT JOIN ZWACHATSESSION s ON m.ZCHATSESSION=s.Z_PK
      WHERE m.ZTEXT LIKE '%$q%'
      ORDER BY m.ZMESSAGEDATE DESC LIMIT $((N));"
    ;;
  export)
    [ $# -ge 1 ] || die "usage: wa-read.sh export <часть-имени-чата>  (markdown в stdout)"
    q="$(esc "$1")"
    sqlite3 -separator '  ' "$DB" "
      SELECT $DT || '  ' ||
             (CASE m.ZISFROMME WHEN 1 THEN 'Я' ELSE COALESCE(
               NULLIF(TRIM(gm.ZCONTACTNAME),''), NULLIF(TRIM(gm.ZFIRSTNAME),''),
               gm.ZMEMBERJID, s.ZPARTNERNAME,'<-') END)
             || ': ' || REPLACE(COALESCE(m.ZTEXT,'[media]'), char(10),' ')
      FROM ZWAMESSAGE m JOIN ZWACHATSESSION s ON m.ZCHATSESSION=s.Z_PK
           LEFT JOIN ZWAGROUPMEMBER gm ON m.ZGROUPMEMBER=gm.Z_PK
      WHERE s.ZPARTNERNAME LIKE '%$q%'
      ORDER BY m.ZMESSAGEDATE ASC;"
    ;;
  help|*)
    cat >&2 <<'EOF'
wa-read.sh — read-only чтение локальной истории WhatsApp (снапшот, оригинал не трогаем).
  chats [N]            топ N чатов по последней активности (по умолч. 20)
  recent <чат> [N]     последние N сообщений из чата (поиск по части имени)
  search <слово> [N]   поиск по тексту во всех чатах
  export <чат>         весь диалог в markdown (stdout) -> life/inbox/whatsapp/
EOF
    ;;
esac
