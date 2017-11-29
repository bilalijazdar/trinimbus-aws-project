##switch user 
sudo su
##install updates
yum update -y
##install packages required
yum install httpd php php-mysql -y

##Download wordpress binaries.
wget https://wordpress.org/latest.tar.gz

##unzip
tar -xzf latest.tar.gz

##Deploy
mkdir /var/www/html/trinimbusblog-wp
chmod 755 /var/www/html/trinimbusblog-wp
cp -r wordpress/* /var/www/html/trinimbusblog-wp

##cleanup
rm -rf wordpress
rm -rf latest.tar.gz

##create Health check file
cd /var/www/html/trinimbusblog-wp
echo "This is a Simple health check for wp Blog" > healthy.html

##chanage permissions
chmod -R 755 wp-content
chown -R apache.apache wp-content

##Wordpress configration
mv wp-config-sample.php wp-config.php


##Using any editor example vi/nano Modify the following file wp-config.php

vi wp-config.php

/** The name of the database for WordPress */
define('DB_NAME', 'trinimbusblog');

/** MySQL database username */
define('DB_USER', 'trinimbusblog');

/** MySQL database password */
define('DB_PASSWORD', 'blog1234');

/** MySQL hostname */
define('DB_HOST', 'trinimbusblog.ccmonfdvzpe4.us-west-2.rds.amazonaws.com');


##start server
service httpd start
service httpd status

chkconfig httpd on