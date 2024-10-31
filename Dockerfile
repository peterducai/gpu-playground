FROM registry.fedoraproject.org/fedora 
RUN dnf install xorg-x11-server-Xvfb blender tigervnc -y && dnf clean all -y
WORKDIR / 
CMD ["blender"] 
EXPOSE 7878