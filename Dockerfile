FROM python:3.10-slim

RUN apt-get update && apt-get install -y ansible && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN chmod +x app.sh

CMD ["ansible-playbook", "playbook.yaml"]
