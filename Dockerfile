FROM alpine:latest

RUN apk add --no-cache wget tar bash

RUN wget -q https://github.com/prometheus/mysqld_exporter/releases/download/v0.15.0/mysqld_exporter-0.15.0.linux-amd64.tar.gz && \
    tar -xzf mysqld_exporter-0.15.0.linux-amd64.tar.gz && \
    mv mysqld_exporter-0.15.0.linux-amd64/mysqld_exporter /bin/ && \
    rm -rf mysqld_exporter-0.15.0.linux-amd64.tar.gz mysqld_exporter-0.15.0.linux-amd64

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9104

ENTRYPOINT ["/entrypoint.sh"]