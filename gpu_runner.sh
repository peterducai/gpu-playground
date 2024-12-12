#!/bin/bash

#startx
#/usr/lib/xorg/Xorg -core :1
#x11vnc -geometry 1200x860 -forever -rfbauth /app/.vnc/passwd -usepw -display :1
#/usr/bin/x11vnc -storepasswd pass12321 /etc/x11vnc.pass
#/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage -rfbport 5900 -display :0 -auth guess -rfbauth /etc/x11vnc.pass
#x11vnc -display :1 -geometry 1200x860 -forever -rfbport 5900 -timeout 300 -accept popup -passwd pass12321

# systemctl enable
# systemctl start

mkdir $HOME/temp
cd $HOME/temp
ssh-keygen -m pem -f rsa_key.pem -t rsa -N ""

rm rsa_key.pem.pub

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout tls_key.pem -out tls_cert.pem -subj /CN=mypi5 -addext subjectAltName=DNS:localhost,DNS:mypi5,IP:$(ip a s  | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

groupadd vnc
chown root:vnc rsa_key.pem tls_key.pem tls_cert.pem
chmod 640 rsa_key.pem tls_cert.pem tls_key.pem

mkdir -p /etc/wayvnc
mv * /etc/wayvnc



# systemctl stop wayvnc.service
# systemctl enable wayvnc.service
# systemctl start wayvnc.service

echo "running wayvnc"
wayvnc 0.0.0.0


echo "running blender..."
blender
