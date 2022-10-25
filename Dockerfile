FROM fedora:36
WORKDIR /usr/local/bin
RUN dnf update -y && dnf install -y ansible git curl util-linux-user which
COPY . .
CMD ["sh", "-c", "ansible-playbook local.yml"]
