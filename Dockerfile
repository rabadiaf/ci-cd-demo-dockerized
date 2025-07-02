#<<<<<<< HEAD
FROM python:3.10-slim

WORKDIR /app

COPY . .

CMD ["python3", "-m", "http.server", "8080"]
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    ansible \
    bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app
RUN chmod +x app.sh

CMD ["./app.sh"]
#>>>>>>> 8bad041 (Primer commit para activar CI/CD)
