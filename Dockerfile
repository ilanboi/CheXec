FROM ubuntu:latest
ENV container docker

# Install packages
RUN apt-get update && apt-get install -y systemd sudo iputils-ping openssh-client curl gnupg
RUN systemctl mask dev-root.device
RUN mkdir /root/.ssh

# Install Falco tool
RUN curl -s https://falco.org/repo/falcosecurity-packages.asc | apt-key add -
RUN echo "deb https://download.falco.org/packages/deb stable main" | tee -a /etc/apt/sources.list.d/falcosecurity.list
RUN apt-get update -y
RUN apt install -y clang llvm
RUN apt-get install -y falco

VOLUME [ "/sys/fs/cgroup", "/run" ]

CMD ["/lib/systemd/systemd"]
