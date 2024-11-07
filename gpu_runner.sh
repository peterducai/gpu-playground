#!/bin/bash

startx
#/usr/lib/xorg/Xorg -core :1
#x11vnc -geometry 1200x860 -forever -rfbauth /app/.vnc/passwd -usepw -display :1
x11vnc -display :1 -geometry 1200x860 -forever -rfbport 5900 -timeout 300 -accept popup -passwd pass12321
blender
