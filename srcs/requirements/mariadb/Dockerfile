FROM	debian:12

RUN	apt-get update \
	&& apt-get install -y mariadb-server

COPY dbsetup.sh /

CMD ["sh", "dbsetup.sh"]