#!/bin/bash

startx
#/usr/lib/xorg/Xorg -core :1
#x11vnc -geometry 1200x860 -forever -rfbauth /app/.vnc/passwd -usepw -display :1
/usr/bin/x11vnc -storepasswd pass12321 /etc/x11vnc.pass
/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage -rfbport 5900 -display :0 -auth guess -rfbauth /etc/x11vnc.pass
#x11vnc -display :1 -geometry 1200x860 -forever -rfbport 5900 -timeout 300 -accept popup -passwd pass12321
echo "running blender..."
blender
