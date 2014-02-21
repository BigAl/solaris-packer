#!/bin/sh

# Since onmiOS dhcp client seems to be a bit incomplete we need to setup DNS
echo "Setting up DNS to work"
mv /tmp/eventhook /etc/dhcp/eventhook
chmod 755 /etc/dhcp/eventhook
dnsserv=`/sbin/dhcpinfo DNSserv`
echo "nameserver $dnsserv" >  /etc/resolv.conf
cp /etc/nsswitch.dns /etc/nsswitch.conf
/usr/sbin/svcadm enable -t svc:/network/dns/client:default
/usr/sbin/svcadm restart svc:/system/name-service-cache:default

# setup the vagrant key
# you can replace this key-pair with your own generated ssh key-pair
echo "Setting the vagrant ssh pub key"
mkdir /export/home/vagrant/.ssh
chmod 700 /export/home/vagrant/.ssh
chown vagrant:root /export/home/vagrant/.ssh
touch /export/home/vagrant/.ssh/authorized_keys
curl -sL http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub > \
    /export/home/vagrant/.ssh/authorized_keys
chmod 600 /export/home/vagrant/.ssh/authorized_keys
chown vagrant:root /export/home/vagrant/.ssh/authorized_keys

# formally add omniti-ms publisher
echo "Adding omniti-ms publisher"
pkg set-publisher -g http://pkg.omniti.com/omniti-ms/ ms.omniti.com

# update grub menu to lower timeout and remove unnecessary second entry
echo "Updating Grub boot menu"
sed -i -e 's/^timeout.*$/timeout 5/' -e "/^title omniosvar/,`wc -l /rpool/boot/grub/menu.lst | awk '{ print $1 }'` d" /rpool/boot/grub/menu.lst

echo "Clearing log files and zeroing disk, this might take a while"
cp /dev/null /var/adm/messages
cp /dev/null /var/log/syslog
cp /dev/null /var/adm/wtmpx
cp /dev/null /var/adm/utmpx
dd if=/dev/zero of=/EMPTY bs=1024
rm -f /EMPTY

echo "Post-install done"
