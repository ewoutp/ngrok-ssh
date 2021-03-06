#!/bin/sh

CONF=/app/ngrok2.yml

touch $CONF
if [ ! -z "$NGROKTOKEN" ]; then
	echo "authtoken: $NGROKTOKEN" >> $CONF
fi
echo 'inspect_addr: 0.0.0.0:4040' >> $CONF

# Start sshd
/usr/sbin/sshd &

# Start ngrok
ngrok tcp -config=$CONF 22
