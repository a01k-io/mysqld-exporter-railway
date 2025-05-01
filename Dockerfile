FROM prom/mysqld-exporter:latest

RUN mkdir -p /etc/mysqld-exporter

COPY my.cnf /etc/mysqld-exporter/my.cnf

EXPOSE 9104

ENTRYPOINT [ "/bin/mysqld_exporter" ]
CMD [ "--config.my-cnf=/etc/mysqld-exporter/my.cnf" ]