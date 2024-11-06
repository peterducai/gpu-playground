FROM registry.fedoraproject.org/fedora 

ENV DISPLAY=:0
ENV XDG_RUNTIME_DIR=/tmp
ENV WAYLAND_DISPLAY=wayland-0
RUN dnf install xorg-x11-server-Xvfb xfce4-terminal xorg-x11-drv-openchrome vim xscreensaver blender tigervnc -y && dnf clean all -y

WORKDIR / 
COPY gpu_runner.sh /usr/local/bin/
CMD ["gpu_runner.sh"] 
EXPOSE 7878