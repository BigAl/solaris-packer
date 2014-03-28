Solaris packer files
==============

Files used to build Solaris Base Box for use with vagrant

See Blogpost http://resilvered.blogspot.com.au/2014/02/solaris-vagrant-packer-and-base-box.html

Requires
-------
- Vargrant (1.4.3)
- Packer (0.5.1)
- Solaris 11_1 text installer
- Solaris 10 Update 11 DVD image

To use these files
=============

    git clone git://github.com/AlanC-au/solaris-packer
    packer build -only=virtualbox-iso solaris11.json
    packer build -only=vmware-iso solaris11.json
