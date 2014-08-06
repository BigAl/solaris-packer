Solaris packer files
==============

Files used to build Solaris Base Box for use with vagrant

See Blogpost http://www.resilvered.com/2014/02/solaris-vagrant-packer-and-base-box.html

Requires
-------
- Vargrant (1.5.1)
- Packer (0.6.0)
- Solaris 11_1 text installer
- Solaris 11_2 text installer
- Solaris 10 Update 11 DVD image

To use these files
=============

    git clone git://github.com/BigAl/solaris-packer
    packer build -only=virtualbox-iso solaris11.json
    packer build -only=vmware-iso solaris11.json

*Tested on Virtualbox 4.3.14*