#!/bin/bash

x11vnc -geometry 1200x860 -forever -rfbauth /app/.vnc/passwd -usepw -display :99
blender
