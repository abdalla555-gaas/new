#!/bin/bash




# Pre-configure debconf to avoid any prompts
export DEBIAN_FRONTEND=noninteractive
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
echo "mariadb-server mysql-server/root_password password root_password_here" | debconf-set-selections
echo "mariadb-server mysql-server/root_password_again password root_password_here" | debconf-set-selections
echo "libssl1.1:amd64 libraries/restart-without-asking boolean true" | debconf-set-selections

# Wait for network services to initialize
sleep 20

# Update the system without prompts
apt-get update -y
apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"

# Install required packages without prompts
apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" apache2 mariadb-server libapache2-mod-php php php-common php-cli php-gd php-mysql php-mbstring php-bcmath php-xml php-fpm php-curl php-zip php-pear wget unzip git

# Start and enable Apache and MariaDB
systemctl start apache2
systemctl enable apache2
systemctl start mariadb
systemctl enable mariadb

# Variables for database setup
DB_NAME="ogp_db"
DB_USER="ogp_user"
DB_PASS="your_password_here"
ROOT_PASS="root_password_here"

# Secure MariaDB installation without prompts
mysql -uroot <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

# Create OGP database and user
mysql -uroot -p"${ROOT_PASS}" <<EOF
CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF

# Import the SQL file to OGP database
wget https://github.com/abdalla555-gaas/new/raw/refs/heads/main/t.sql -O /tmp/t.sql
mysql -u${DB_USER} -p${DB_PASS} ${DB_NAME} < /tmp/t.sql

# Download and install OGP
cd /var/www/html
rm -rf index.html
wget https://github.com/OpenGamePanel/OGP-Website/archive/master.zip -O ogp.zip
unzip -o ogp.zip
mv OGP-Website-master/* .
rm -rf OGP-Website-master ogp.zip

# Create the OGP configuration file
cat <<EOF > /var/www/html/includes/config.inc.php
<?php
###############################################
# Site configuration
###############################################
\$db_host="localhost";
\$db_user="${DB_USER}";
\$db_pass="${DB_PASS}";
\$db_name="${DB_NAME}";
\$table_prefix="ogp_";
\$db_type="mysql";
?>
EOF

# Set correct permissions for OGP
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Download and install PHPMyAdmin
cd /usr/share
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O phpmyadmin.zip
unzip -o phpmyadmin.zip
rm phpmyadmin.zip
mv phpMyAdmin-* phpmyadmin

# Create a symbolic link to /var/www/html for PHPMyAdmin
ln -sf /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Configure PHPMyAdmin
cat <<EOF > /usr/share/phpmyadmin/config.inc.php
<?php
\$cfg['blowfish_secret'] = 'somerandomstring';
\$i = 0;
\$i++;
\$cfg['Servers'][\$i]['auth_type'] = 'cookie';
\$cfg['Servers'][\$i]['host'] = 'localhost';
\$cfg['Servers'][\$i]['user'] = 'root';
\$cfg['Servers'][\$i]['password'] = '${ROOT_PASS}';
\$cfg['Servers'][\$i]['AllowNoPassword'] = false;
?>
EOF

# Set correct permissions for PHPMyAdmin
chown -R www-data:www-data /usr/share/phpmyadmin
chmod -R 755 /usr/share/phpmyadmin

# Restart Apache to apply changes
systemctl restart apache2

# Output completion message
echo "OGP and PHPMyAdmin installation is complete."
echo "Access OGP at your server's IP address."
echo "Access PHPMyAdmin at /phpmyadmin"

export DEBIAN_FRONTEND=noninteractive
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
# Update the system without prompts
apt-get update -y
apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"

# Install prerequisites - if a package fails, continue to the next one
packages=(
    "libxml-parser-perl"
    "libpath-class-perl"
    "perl-modules"
    "screen"
    "rsync"
    "sudo"
    "e2fsprogs"
    "unzip"
    "subversion"
    "libarchive-extract-perl"
    "pure-ftpd"
    "libarchive-zip-perl"
    "libc6"
    "libgcc1"
    "git"
    "curl"
    "libc6-i386"
    "libgcc1:i386"
    "lib32gcc1"
    "lib32gcc-s1"
    "libhttp-daemon-perl"
)

for package in "${packages[@]}"; do
    apt-get install -y "$package" || true
done

# Download and install OGP Agent
cd /root
wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-agent-latest.deb" -O "ogp-agent-latest.deb"
dpkg -i "ogp-agent-latest.deb" || true
apt-get install -f -y
sudo sed -i '6s/key => .*/key => '\''mX222fBt'\'',/' /usr/share/ogp_agent/Cfg/Config.pm && sudo systemctl restart ogp_agent

# Display the credentials
echo "=== OGP Agent Installation Complete ==="
echo "Your OGP Agent credentials are Auto Installed"
echo "=== Save these credentials! You'll need them for the panel ==="
