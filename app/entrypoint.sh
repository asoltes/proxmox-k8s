#!/bin/sh

POD_NAME=$(cat /etc/podinfo/podname)
NODE_NAME=$(cat /etc/podinfo/nodename)

sed "s/{{POD_NAME}}/$POD_NAME/" /usr/share/nginx/html/template.html | \
sed "s/{{NODE_NAME}}/$NODE_NAME/" > /usr/share/nginx/html/index.html

exec nginx -g 'daemon off;'
