#!/bin/bash

CFG=/etc/mysql/my.cnf

echo "[client]" > "$CFG"

[ -n "$MYSQL_USER" ] && echo "user = $MYSQL_USER" >> "$CFG"
[ -n "$MYSQL_PASSWORD" ] && echo "password = $MYSQL_PASSWORD" >> "$CFG"
[ -n "$MYSQL_HOST" ] && echo "host = $MYSQL_HOST" >> "$CFG"
[ -n "$MYSQL_PORT" ] && echo "port = $MYSQL_PORT" >> "$CFG"
[ -n "$MYSQL_DATABASE" ] && echo "database = $MYSQL_DATABASE" >> "$CFG"
# OPTIONS should be already formatted
echo "$MYSQL_OPTIONS" >> "$CFG"

if [[ $1 == *.sh ]] && [ -f "$1" ]; then
	bash "$@"
else
	mysql "$@"
fi
