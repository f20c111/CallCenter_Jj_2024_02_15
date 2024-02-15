
rocky_9.3_csaircc_jj

dnf install epel-release -y
curl -O https://mirrors.aliyun.com/zabbix/zabbix/6.0/rhel/${VERSION_ID}/x86_64/zabbix-release-6.0-4.el${VERSION_ID}.noarch.rpm
rpm -ivh zabbix-release-6.0-4.el${VERSION_ID}.noarch.rpm
sed -i 's/repo\.zabbix\.com/mirrors\.aliyun\.com\/zabbix/' /etc/yum.repos.d/zabbix.repo
sed -i 's/repo\.zabbix\.com/mirrors\.aliyun\.com\/zabbix/' /etc/yum.repos.d/zabbix-agent2-plugins.repo
mv /etc/yum.repos.d/zabbix-agent2-plugins.repo /etc/yum.repos.d/zabbix-agent2-plugins.repo-bak
sed -i '/^\[epel\]/a excludepkgs=zabbix*' /etc/yum.repos.d/epel.repo


for file in /etc/yum.repos.d/rocky-*.repo /etc/yum.repos.d/Rocky-*.repo; do
[ -e "$file" ] && cp "$file" "$file.bak" && sed -i -e 's|^mirrorlist=|#mirrorlist=|g' -e 's|^#baseurl=http://dl.rockylinux.org/\$contentdir|baseurl=https://mirrors.aliyun.com/rockylinux|g' "$file"
done
dnf module reset mariadb -y

firewall-cmd --permanent --add-port={80/tcp,10051/tcp,443/tcp}
firewall-cmd --reload

sed -i 's/SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
setenforce 0

curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash -s -- --mariadb-server-version=11.0

echo "create database csairccjj character set utf8mb4 collate utf8mb4_bin;" | mariadb -uroot
echo "create user sys601@localhost identified by 'justlooking601';" | mariadb -uroot
echo "grant all privileges on csairccjj.* to sys601@localhost;" | mariadb -uroot
echo "set global log_bin_trust_function_creators = 1;" | mariadb -uroot

zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mariadb --default-character-set=utf8mb4 -usys601 -pjustlooking601 csairccjj
sed -i 's/# DBPassword=/DBPassword=justlooking601/g' /etc/zabbix/zabbix_server.conf
echo "set global log_bin_trust_function_creators = 0;" | mariadb -uroot

systemctl restart zabbix-server zabbix-agent httpd php-fpm
systemctl enable zabbix-server zabbix-agent httpd php-fpm
notification

cp simkai.ttf /usr/share/zabbix/assets/fonts
rm -f /usr/share/zabbix/assets/fonts/graphfont.ttf
ln -s /usr/share/zabbix/assets/fonts/simkai.ttf /usr/share/zabbix/assets/fonts/graphfont.ttf

echo database user root/empyt
echo user/passwd:  Admin / zabbix
#alter user 'root'@'localhost' identified by 'new_password;
#flush privileges;


add_wechat_dingtalk_feishu_scripts() 
git clone https://github.com/X-Mars/Zabbix-Alert-WeChat.git /usr/lib/zabbix/alertscripts
ls -la /usr/lib/zabbix/alertscripts

dnf install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-selinux-policy zabbix-agent MariaDB-server MariaDB-client MariaDB-backup MariaDB-devel langpacks-zh_CN git -y

systemctl enable mariadb --now
if systemctl is-active mariadb; then
echo "MariaDB (good)。"
# curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash -s -- --mariadb-server-version=11.0\e[0m"
# dnf install MariaDB-server MariaDB-client MariaDB-backup MariaDB-devel -y\e[0m"
# systemctl enable mariadb --now\e[0m"
        
          
