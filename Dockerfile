FROM prom/mysqld-exporter

COPY .my.cnf /.my.cnf

EXPOSE 9104

ENTRYPOINT [ "/bin/mysqld_exporter" ]
CMD [ "--mysqld.address=$HOST:$PORT", \
    "--mysqld.username=$USER"]