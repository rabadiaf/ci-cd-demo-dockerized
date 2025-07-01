FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \

    ansible \

    shellcheck \

    bash \

    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app
