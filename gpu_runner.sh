#!/bin/bash

startx
#/usr/lib/xorg/Xorg -core :1
x11vnc -geometry 1200x860 -forever -rfbauth /app/.vnc/passwd -usepw -display :1
blender
