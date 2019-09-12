FROM centos
MAINTAINER ryanwu
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
COPY ./source/mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum install mariadb mariadb-server -y;
RUN  mkdir -p /data/mariadb/run/mysqld/ && chown -R mysql:mysql /data/mariadb/run/mysqld/
COPY ./source/my.cnf /etc/
RUN mysql_install_db;systemctl enable mariadb.service;
EXPOSE 3306
CMD ["sh","-c","/usr/bin/mysqld_safe"]
