build_args=(
  # Reuse host cache
  --volume /var/cache/pacman/pkg:/var/cache/pacman/pkg
  # Config files
  --volume /home:/home
)

run_args=(
  --name='game'

  # Support /sbin/init
  --systemd=always
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro

  # Detect file changes in Containerfile
  --rm='true'
  --replace='true'

  # Bridge network
  --network='host'

  # GPU access
  --privileged='true'
  --ipc='host'
  --device /dev/dri:/dev/dri:rwm
  --device /dev/fb0:/dev/fb0:rwm  #not present, maybe /dev/video?
  --volume /dev/shm:/dev/shm

  # Seats
  --volume /dev/tty0:/dev/tty0
  --volume /dev/tty1:/dev/tty1

  # SELinux
  --security-opt seccomp=unconfined
  --security-opt unmask=/sys/dev

  # Peripherals
  --volume /dev/input:/dev/input
  --volume /run/udev:/run/udev
  --volume /dev/snd:/dev/snd
)

# CTRL+P+Q to quit
clear && \
  sudo podman build \
    "${build_args[@]}" \
    -t local/game:latest \
    -f Containerfile.game \
    "$@" \
    ./ && \
  sudo podman run \
    "${run_args[@]}" \
    "${build_args[@]}" \
    -d \
    local/game:latest && \
  systemctl stop \
    getty@tty1.service && \
  sudo podman exec \
    -it game \
    /bin/login