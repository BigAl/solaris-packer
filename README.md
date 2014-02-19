Solaris packer files
==============

Files used to build Solaris Base Box for use with vagrant

See Blogpost [http://resilvered.blogspot.com.au/2014/02/solaris-vagrant-packer-and-base-box.html]

Requires
-------
- Vargrant (1.4.3)
- Packer
- Solaris 11_1 text installer

To e these files
=============

    git clone git://github.com/AlanC-au/packer
    packer build -only=virtualbox-iso solaris11.json
