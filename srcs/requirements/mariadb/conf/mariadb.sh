#!/bin/bash

#start MariaDB service
echo -e "\e[33m🚀 Launching mysqld_safe\e[0m"
/usr/bin/mysqld_safe &

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]
then
    echo "Database already exists"
else
    #create database and user
    echo -e "\e[33m📊 Database is being created\e[0m"
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
    mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"

    #stop the service
    mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
fi

#launch safe mode MariaDB
exec mysqld_safe