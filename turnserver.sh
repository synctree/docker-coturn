#!/bin/sh
if [ -z "$EXTERNAL_IP" ]; then
  if [ ! -f "/external_ip" ]; then
      curl http://icanhazip.com 2>/dev/null > /external_ip
  fi
  EXTERNAL_IP=`cat /external_ip`
fi
exec /usr/bin/turnserver -n --log-file stdout --external-ip "$EXTERNAL_IP"
