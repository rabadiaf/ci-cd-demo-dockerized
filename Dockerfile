FROM python:3.10-slim

RUN apt-get update && apt-get install -y ansible && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY deployment.yaml playbook.yml entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

CMD ["ansible-playbook", "playbook.yml"]
