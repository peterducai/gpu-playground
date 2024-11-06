FROM registry.fedoraproject.org/fedora 

ENV DISPLAY=:0
ENV XDG_RUNTIME_DIR=/tmp
ENV WAYLAND_DISPLAY=wayland-0
ENV XAUTHLOCALHOSTNAME=localhost

RUN dnf install git x11vnc xorg-x11-xinit xorg-x11-server-Xvfb xfce4-terminal xorg-x11-drv-openchrome vim xscreensaver blender tigervnc -y && dnf clean all -y

#wayVNC for wayland
# RUN dnf install -y meson gcc ninja-build pkg-config egl-wayland egl-wayland-devel \
# mesa-libEGL-devel mesa-libEGL libwayland-egl libglvnd-devel \
# libglvnd-core-devel libglvnd mesa-libGLES-devel mesa-libGLES \
# libxkbcommon-devel libxkbcommon libwayland-client \
# pam-devel pixman-devel libgbm-devel libdrm-devel scdoc \
# libavcodec-free-devel libavfilter-free-devel libavutil-free-devel \
# turbojpeg-devel	wayland-devel gnutls-devel jansson-devel
# RUN git clone https://github.com/any1/wayvnc.git
# RUN git clone https://github.com/any1/neatvnc.git
# RUN git clone https://github.com/any1/aml.git

# RUN mkdir wayvnc/subprojects
# RUN cd wayvnc/subprojects
# # RUN ln -s ../../neatvnc .
# # RUN ln -s ../../aml .
# RUN cd -

# RUN mkdir neatvnc/subprojects
# RUN cd neatvnc/subprojects
# RUN ln -s ../../aml .
# RUN cd -
# RUN meson build
# RUN ninja -C build

WORKDIR / 
COPY gpu_runner.sh /usr/local/bin/
CMD ["gpu_runner.sh"] 
EXPOSE 5900