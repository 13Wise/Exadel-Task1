FROM postgres

#COPY compotest/init.sql /docker-entrypoint-initdb.d/

CMD ["postgres", "-c", "log_statement=all"]

