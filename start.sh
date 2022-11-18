#!/bin/bash

file_env() {
	local var="$1"
	local fileVar="${var}_FILE"
	local def="${2:-}"
	if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
		echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
		exit 1
	fi
	local val="$def"
	if [ "${!var:-}" ]; then
		val="${!var}"
	elif [ "${!fileVar:-}" ]; then
		val="$(< "${!fileVar}")"
	fi
	export "$var"="$val"
	unset "$fileVar"
}

file_env TITLE 'Hello-file-aware'

cat > /var/www/html/index.html <<EOF
<html>
  <body bgcolor="${COLOR:-gray}">
    <h1>${TITLE}</h1>
    ${BODY:-Please use TITLE/COLOR/BODY env vars}
  </body>
  <hr>
  Hostname: ${HOSTNAME}
<html>
EOF

exec nginx -g "daemon off;"