#!/bin/sh

# setup the vagrant key
# you can replace this key-pair with your own generated ssh key-pair
echo "Setting the vagrant ssh pub key"
mkdir /export/home/vagrant/.ssh
chmod 700 /export/home/vagrant/.ssh
touch /export/home/vagrant/.ssh/authorized_keys
curl -sL http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub > \
    /export/home/vagrant/.ssh/authorized_keys
chmod 600 /export/home/vagrant/.ssh/authorized_keys
chown -R vagrant:staff /export/home/vagrant/.ssh

# disable the very annoying sendmail
/usr/sbin/svcadm disable sendmail
/usr/sbin/svcadm disable asr-notify

cp /dev/null /var/adm/messages
cp /dev/null /var/log/syslog
cp /dev/null /var/adm/wtmpx
cp /dev/null /var/adm/utmpx
dd if=/dev/zero of=/EMPTY bs=1024
rm -f /EMPTY

echo "Post-install done"
