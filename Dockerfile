FROM ubuntu:latest
ENV container docker

# Install systemd
RUN apt-get update && apt-get install -y systemd
RUN systemctl mask dev-root.device

VOLUME [ "/sys/fs/cgroup", "/run" ]

CMD ["/lib/systemd/systemd"]