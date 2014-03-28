#!/bin/sh

# setup the vagrant key
# you can replace this key-pair with your own generated ssh key-pair
echo "Setting the vagrant ssh pub key"
mkdir /export/home/vagrant/.ssh
chmod 700 /export/home/vagrant/.ssh
touch /export/home/vagrant/.ssh/authorized_keys
if [ -f /usr/sfw/bin/wget ] ; then
  /usr/sfw/bin/wget --no-check-certificate http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub -O /export/home/vagrant/.ssh/authorized_keys
else
  /usr/bin/wget --no-check-certificate http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub -O /export/home/vagrant/.ssh/authorized_keys
fi
chmod 600 /export/home/vagrant/.ssh/authorized_keys
chown -R vagrant:staff /export/home/vagrant/.ssh

echo "Disabling sendmail and asr-norify"
# disable the very annoying sendmail
/usr/sbin/svcadm disable sendmail
/usr/sbin/svcadm disable asr-notify

echo "Clearing log files and zeroing disk, this might take a while"
cp /dev/null /var/adm/messages
cp /dev/null /var/log/syslog
cp /dev/null /var/adm/wtmpx
cp /dev/null /var/adm/utmpx
dd if=/dev/zero of=/EMPTY bs=1024
rm -f /EMPTY

echo "Post-install done"
