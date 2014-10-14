#!/bin/bash

#Sintax
#first cd to the directory where you saved the newDomain folder
#Inside the console put ./new.sh mydomain.com

# $1 should be the name for your domain e.g. yourdomain.com

#Copies the template to /etc/nginx/sites-available/
cp template /etc/nginx/sites-available/$1

#Replaces the word template inside the file for the parameter
sed -i -e "s/template/$1/g" /etc/nginx/sites-available/$1

#Creates a symbolic link
ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/$1

# Creates yourdomain.com and yourdomain/public_web folders
mkdir /usr/share/nginx/www/$1
mkdir /usr/share/nginx/www/$1/public_web

# Copies index.html to public_web/index.html
cp index.html /usr/share/nginx/www/$1/public_web/index.html

# Reload Nginx to see the changes
nginx -s reload

# If everything went OK, you should be able to see your website online
# Otherwise, check wheter you have your DNS server pointing correctly to your website




# Possible errors you may come across

# If you are getting -bash: ./new.sh: Permission denied error
# Change the permissions of this file to 755

# If getting -bash: ./new.sh: /bin/bash^M: bad interpreter: No such file or directory
# try using sudo
# e.g. sudo ./new/sh mydomain.com



