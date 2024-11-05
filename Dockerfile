FROM registry.fedoraproject.org/fedora 

ARG DISPLAY=:0
ARG XDG_RUNTIME_DIR=/tmp
ARG WAYLAND_DISPLAY=wayland-0
RUN dnf install xorg-x11-server-Xvfb xfce4-terminal vim xscreensaver blender tigervnc -y && dnf clean all -y
WORKDIR / 
CMD ["blender"] 
EXPOSE 7878