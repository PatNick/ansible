FROM fedora:37 AS base
WORKDIR /usr/local/bin
RUN dnf update -y && dnf install -y git passwd curl util-linux-user which

FROM base AS pat
RUN groupadd --gid 1000 pat
RUN useradd --uid 1000 --gid 1000 pat && echo "pat:pat" | chpasswd
RUN usermod -aG wheel pat
RUN dnf install -y ansible
USER pat
WORKDIR /home/pat

FROM pat
COPY . .
CMD ["sh", "-c", "ansible-playbook local.yml"]
