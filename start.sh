#!/bin/bash

cat > /var/www/html/index.html <<EOF
<html>
  <body bgcolor="${COLOR:-gray}">
    <h1>${TITLE:-Hello}</h1>
    ${BODY:-Please use TITLE/COLOR/BODY env vars}
  </body>
<html>
EOF

exec nginx -g "daemon off;"