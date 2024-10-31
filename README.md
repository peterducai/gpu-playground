# gpu-playground


```
podman run --env DISPLAY -e XDG_RUNTIME_DIR=/tmp -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY --security-opt label=type:container_runtime_t  localhost/gpuplayground
```