FROM prom/mysqld-exporter

COPY .my.cnf /.my.cnf

EXPOSE 9104

ENV MYSQLD_EXPORTER_PASSWORD=$PASSWORD

ENTRYPOINT [ "/bin/mysqld_exporter" ]
CMD [ "--config.my-cnf=./my.cnf", "--mysqld.address=$HOST:$PORT", \
"--mysqld.username=$USER"]