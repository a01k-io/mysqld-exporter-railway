FROM prom/mysqld-exporter:latest

COPY my.cnf /.my.cnf

EXPOSE 9104

ENTRYPOINT [ "/bin/mysqld_exporter" ]
CMD [ "--config.my-cnf=/.my.cnf" ]