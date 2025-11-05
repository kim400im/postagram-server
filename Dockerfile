FROM alpine:latest

RUN apk add --no-cache ca-certificates unzip wget

ARG PB_VERSION=0.31.0
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pocketbase_${PB_VERSION}_linux_amd64.zip \
    && rm pocketbase_${PB_VERSION}_linux_amd64.zip \
    && chmod +x /pocketbase

WORKDIR /app

# 마이그레이션 파일 복사 (스키마 정의)
COPY pb_data/pb_migrations /app/pb_data/pb_migrations

EXPOSE 8090
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8090"]