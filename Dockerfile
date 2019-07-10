FROM docker.io/centos
MAINTAINER ryanwu
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
COPY ./source/mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum install mariadb mariadb-server -y 
RUN  mkdir -p /data/mariadb/run/mysqld/ && chown -R mysql:mysql /data/mariadb/run/mysqld/
COPY ./source/my.cnf /etc/
COPY ./source/init.sh /usr/local/bin/init.sh && chmod 755 /usr/local/bin/init.sh
EXPOSE 3306
RUN mysql_install_db
ENTRYPOINT ["/usr/sbin/init"]