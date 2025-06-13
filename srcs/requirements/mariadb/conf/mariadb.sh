#!/bin/sh
#must be interpreted by sh

#can have access to these files
echo "Fixing permissions on /var/lib/mysql..."
chown -R mysql:mysql /var/lib/mysql
chmod 750 /var/lib/mysql

#start mariadb
/etc/init.d/mariadb start;

#connect as root with root password, search for sql_database if it exists
DB_ALREADY_EXISTS=$(mysql -uroot -p$SQL_ROOT_PASSWORD -e "SHOW DATABASES" | grep $SQL_DATABASE | wc -l);

if [ $DB_ALREADY_EXISTS -eq 1 ]; then
	echo "Database already exists";
else
	echo "Database does not exist";

#create database
mysql -uroot -p"$SQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;"

#create sql user accessible with any IP address with SQL_PASSWORD
mysql -uroot -p"$SQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"

#give all rights on database to user
mysql -uroot -p"$SQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO '$SQL_USER'@'%';"

#change/confirm mysql root password for localhost
mysql -uroot -p"$SQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

#reload so that changes take effect now
mysql -uroot -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

fi

sleep 5;

mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

#execute command passed as argument in the script
exec "$@";