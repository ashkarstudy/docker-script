#!/bin/bash
mkdir wordpress && cd wordpress
docker run -e MYSQL_ROOT_PASSWORD=abc123 -e MYSQL_DATABASE=wordpress --name wordpressdb -v "$PWD/database":/var/lib/mysql -d mariadb:latest

docker run -e WORDPRESS_DB_PASSWORD=abc123 --name wordpress --link wordpressdb:mysql -p 80:80 -v "$PWD/html":/var/www/html -d wordpress

