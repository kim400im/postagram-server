FROM alpine:latest

RUN apk add --no-cache ca-certificates unzip wget

ARG PB_VERSION=0.31.0
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pocketbase_${PB_VERSION}_linux_amd64.zip \
    && rm pocketbase_${PB_VERSION}_linux_amd64.zip \
    && chmod +x /pocketbase

WORKDIR /app

EXPOSE 8090
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8090"]