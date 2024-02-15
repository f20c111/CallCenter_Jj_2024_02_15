systemctl status
tar -xzpvf
pwd
yum install createrepo

[root@yum-server ~]# vim /etc/yum.conf
[main]
cachedir=/var/cache/yum/$basearch/$releasever    
keepcache=1  #安装不删除                                    
[root@yum-server ~]# yum clean all      
[root@yum-server ~]# yum makecache      
[root@yum-server ~]# yum -y update      所有包进行更新注意

mkdir -p /yum/repo 
createrepo --update /yum/local
dnf install --downloadonly --downloaddir=/home/download/ zabbix-agent
dnf install --downloadonly --downloaddir=/home/download/ createrepo
vim /etc/yum.repos.d/update.repo

yum install -y zabbix-agen

cat /var/log/zabbix/zabbix_server.log 
cat /var/log/zabbix/zabbix_agentd.log 

 journalctl -xe #log

tail -f /var/log/zabbix/zabbix_server.log

 /etc/zabbix/apache.conf, uncomment and set the right timezone for you.

/etc/zabbix/zabbix_server.conf

/etc/zabbix/zabbix_agentd.conf
server=127.0.0.1 
ServerActive=127.0.0.1 
Hostname=ZabbixServer #主动请求


yum install createrepo
mkdir -p /home/dowmload
dnf install zabbix-agent --downloadonly --downloaddir=/home/download

createrepo /home/download
/etc/yum.repo.d/
rename .repo .repo.back *
vim cd /etc/yum.repo.d/rocky.repo
[local]
name=zabbix
baseurl=file:///home/download/
#baseurl=http://
gpgcheck=0
enabled=1
yum clear call
yum makecache
/home/download/yum install  zabbix-agent



rpm -qa | grep zabbix
rpm -remove zabbix-agent
yum install zabbix-agent --downloadonly --downloaddir=/home/download
//home/download
zabbix-agent-6.0.26-release1.el9.x86_64.rpm
cp zabbix-agent-6.0.26-release1.el9.x86_64.rpm#local/home/download#复制到内网自制仓库
dnf install zabbix-agent-6.0.26-release1.el9.x86_64.rpm#yum
vim /etc/zabbix/zabbix_agentd.conf



firewall-cmd --zone=public --add-port=10050/tcp --permanent
firewall-cmd --reload--


agent——server#error
/etc/zabbix/zabbix_agentd.comf
LogFile=/var/log/zabbix/zabbix_agentd.log
PidFile=/run/zabbix/zabbix_agentd.pid
mkdir -p/var/log/zabbix
mkdir -p/run/zabbix
touch  zabbix_agentd.pid 
touch  zabbix_agentd.log
chmod -R 777 zabbix_agentd.pid,zabbix_agentd.log

















                           



