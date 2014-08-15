#!/bin/sh
if [ ! -f "/external_ip" ]; then
  if [ -z "$EXTERNAL_IP" ]; then
      curl http://icanhazip.com 2>/dev/null > /external_ip
  else
      echo $EXTERNAL_IP > /external_ip
  fi
fi
exec /usr/bin/turnserver -n --log-file stdout --external-ip `cat /external_ip`
