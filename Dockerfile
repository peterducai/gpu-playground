FROM registry.fedoraproject.org/fedora 
RUN dnf install xorg-x11-server-Xvfb blender tigervnc -y && dnf clean all -y
ENV DISPLAY=:0
ENV XDG_RUNTIME_DIR=/tmp
ENV WAYLAND_DISPLAY=wayland-0
WORKDIR / 
CMD ["blender"] 
EXPOSE 7878