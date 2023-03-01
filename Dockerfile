FROM ubuntu:latest
ENV container docker

# Install systemd, sudo, ping
RUN apt-get update && apt-get install -y systemd sudo iputils-ping
RUN systemctl mask dev-root.device

VOLUME [ "/sys/fs/cgroup", "/run" ]

CMD ["/lib/systemd/systemd"]
