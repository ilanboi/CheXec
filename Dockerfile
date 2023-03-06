FROM ubuntu:latest
ENV container docker

# Install systemd, sudo, ping
RUN apt-get update && apt-get install -y systemd sudo iputils-ping openssh-client
RUN systemctl mask dev-root.device
RUN mkdir /root/.ssh

VOLUME [ "/sys/fs/cgroup", "/run" ]

CMD ["/lib/systemd/systemd"]
