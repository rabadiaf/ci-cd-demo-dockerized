FROM python:3.10-slim

# Instala Ansible y curl para instalar kubectl
RUN apt-get update && \
    apt-get install -y ansible curl && \
    curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY deployment.yaml playbook.yml entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

CMD ["ansible-playbook", "playbook.yml"]
