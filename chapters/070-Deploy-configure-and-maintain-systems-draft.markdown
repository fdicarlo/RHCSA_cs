# Deploy, configure, and maintain systems

## Configure networking and hostname resolution statically or dynamically.

### Configure networking

Networking is a big part of the RHCSA and RHCE. If you aren't super comfortable with configuring networking via network config files, then its probably a good idea to use the network management tools available.

In Red Hat Enterprise Linux you can type "setup" at the command line. This will open up the Text Mode Setup Utility, which allows you to configure network, firewall, athentication, keyboard, RHN, and System Services.

If you do venture into the networking configuration files, these are the important ones:

* /etc/hosts The static table lookup for hostnames
* /etc/resolv.conf The resolver configuration file
* /etc/sysconfig/network Contains hostname setting
* /etc/sysconfig/network-scripts/ifcfg-eth0 The first network device configuration

These are files that will be essential to know about during the exam if you are altering config files.

There will no doubt be some need to configure networks during the RHCSA and RHCE, so either way be prepared to fix network connections.

### Configuring the hostname

Configuring the hostname can be done in the /etc/sysconfig/network file. Edit this file with the updated hostname and then on reboot, the new hostname will be reflected.

	~] vim /etc/sysconfig/network
	NETWORKING=yes
	HOSTNAME=rhel-01

## Schedule tasks using cron.

Cron is a utility used to schedule tasks to run at a certain time on various intervals. First is to make sure its installed, although it is installed by default on a normal installation.

	~] rpm -qa | grep cron
	cronie-1.4.4-2.el6.x86_64
	cronie-anacron-1.4.4-2.el6.x86_64

The easiest way to get guidance on how to use a utility is to use the man page. In this case the proper documentation is kind of hidden.

	~] man 5 crontab

This page lays out the options for cron, why its not found by simply using "man cron" is beyond me, but its not.

The format for this goes as follows:

	*    *    *    *    *  command to be executed
	-    -    -    -    -
	|    |    |    |    |
	|    |    |    |    |
	|    |    |    |    +----- day of week (0 - 6) (Sunday=0)
	|    |    |    +---------- month (1 - 12)
	|    |    +--------------- day of month (1 - 31)
	|    +-------------------- hour (0 - 23)
	+------------------------- min (0 - 59)

An example of a cron job would be configuring a job to run every day on minute 0 hour 12 daily, or daily at 12:00pm.

	0 12 * * * /bin/echo "some job" >> echo.log

Another example would be to run a job weekly at 3:30pm on Sunday

	30 15 * * 0 /bin/echo "another job" >> echo.log

## Configure systems to boot into a specific runlevel automatically.

Depending on what the system running Red Hat Enterprise Linux 6 is going to be used for, you will want it to boot into the appropriate runlevel.

The file that controls the runlevel that a system boots into is the /etc/inittab.

	# Default runlevel. The runlevels used are:
	#   0 - halt (Do NOT set initdefault to this)
	#   1 - Single user mode
	#   2 - Multiuser, without NFS (The same as 3, if you do not have networking)
	#   3 - Full multiuser mode
	#   4 - unused
	#   5 - X11
	#   6 - reboot (Do NOT set initdefault to this)
	# 
	id:5:initdefault:

In this case the default runlevel that this system will boot into is runlevel 5. Make note of what not to do. As noted above, do not set the default runlevel to 0 or 6, which is shutdown and reboot, for obvious reasons.

## Install Red Hat Enterprise Linux automatically using Kickstart.

Installing a system via Kickstart comes in pretty useful in real life. Whether there is time to do that in the 2.5 hours that they give you on the exam is questionable, but regardless its an objective.

There are a few ways to create a kickstart file, that would be used in the automatic installation of a Redhat Enterprise Linux 6 system. Theres always writing the thing from scratch, which while always an optoin, is not so efficient. Besides that there is:

	system-config-kickstart (requires installing this application)

using the anaconda-ks.cfg that was created during an installation.

On the exam you would probably (hopefully) be provided with a premade kickstart file, so we work from there.

Lets say we have this info:

	kickstart file = http://192.168.111.23/pub/ks/redhat6.kfg
	ip of new install = 192.168.111.222 (same subnet)
	netmask = 255.255.255.0

First we would boot the system with some sort of boot media, most likely the RHEL 6 CD-ROM #1 and at the boot prompt (when it asks you what you want to do) you would type a command like this, substituting your own info:

	linux ks=http://192.168.111.23/pub/ks/redhat6.kfg append ip=192.168.111.222 netmask=255.255.255.0

As long as everying is configured correctly and the installation media is where is should be, then this should install pretty hands off. Of course, anything besides this already configured environment would just take way too much time to be included on the exam. As long as you know how to install via ks file, you are probably good.

## Configure a physical machine to host virtual guests.

A default RHEL 6 system should come prepared to host virtual guests, minus the packages. In RHEL5 you had to make sure that you were running the xen kernel, which would require installing and booting into that kernel. RHEL 6 is simple, if it Virtualization is not installed, install it.

	~] yum groupinstall "Virtualization"

That will install everything needed to run virtual guests on RHEL 6.

## Install Red Hat Enterprise Linux systems as virtual guests.



## Configure systems to launch virtual machines at boot.
## Configure network services to start automatically at boot.
## Configure a system to run a default configuration HTTP server.

Installing apache via yum on Red Hat Enterprise Linux 6 does most of the setup for you.

	~]  yum install httpd

	:::bash
	~]  service httpd start

Now if you try to visit the main ip or domain of the server, you may run into an issue getting to the site. Whenever you enable a network service like a web server, you also have to allow the outside to use that service. We have to add an entry into iptables.

	~]  iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

This would add an entry into iptables, but to survive a reboot we would have to save this.

	~]  service iptables save

Now an easier way of doing this, is to use system-config-firewall, which is the gui/tui tool to configure a firewall.

	~]  system-config-firewall

This may not make things perfect, but it can definitely give you a jump start to molding rules on an exam.

## Configure a system to run a default configuration FTP server.

### FTP

vsftpd installs with a default configuration that works for this requirement. So a basic:

	~] yum install vsftpd
	
	~] chkconfig vsftpd on

This will get your default server up and running. But what about firewall and selinux?

### Iptables

For iptables you want to open up port 20 and 21, to allow ftp requests in.

	~] iptables -I INPUT 5 -p tcp -m tcp --dport 20 -j ACCEPT

	~] iptables -I INPUT 5 -p tcp -m tcp --dport 21 -j ACCEPT

Then remember to always save your iptables rules so they survive a reboot.

### Selinux

SELinux is now a part of the exams, so you have to know how to apply the correct context to the directories that will be used by vsftpd.

Here's a tip: All this information is stored in man pages, so rather than memorizing, use the resources available. If you search for _selinux, then all services that have information on how to be configured with SELinux will show up. To search the man pages use:

	~] man -k _selinux
	ftpd_selinux         (8)  - Security-Enhanced Linux policy for ftp daemons

	~] man ftpd_selinux

To make a ftp server's content available you can see it says to run the following:

	semanage fcontext -a -t public_content_t "/var/ftp(/.*)?"

	restorecon -F -R -v /var/ftp

Thats it. As long as you can install the application, vsftpd, open the correct ports in iptables, and set context in SELinux, then you are good to go on this objective.

## Install and update software packages from Red Hat Network, a remote repository, or from the local file system.

Red Hat Network is pretty easy to work with.

	~] rhn_register

And follow the instructions. Now, if you arent lucky enough to have a subscription to this wonderful service, then you will most likely using a repo that you create, or that is given to you.

Most common situation is having a remote repository that you need to pull packages from. Usually you be given a url to connect to looking something like this: http://myremote.com/repo/i386/. The yum repo files are located in /etc/yum.repos.d/ and end with a .repo extension. The format is simple to setup a repo on the fly.

	[myremote]
	name=myremote
	baseurl=http://myremote.com/repo/i386/
	enabled=1
	gpgcheck=0

Those are the essential elements to pull packages via yum from that repo.

Setting up a local repo with a disk is almost the same with a few steps before. First the disk needs to be mounted, and the packages copied from Packages/ into another directory on the server. In this case we will use file:///directory/path/to/repo/ as the url, where /directory/path/to/repo/ is the directory that contains the rpm files.

Next the package creatrepo needs to be installed. Once installed cd into the directory and run:

	~] createrepo .

Now that you have a repo setup, yum needs to know about it. Create a file named mylocal.repo in the /etc/yum.repos.d/ directory.

	[mylocal]
	name=mylocal
	baseurl=file:///directory/path/to/repo/
	enabled=1
	gpgcheck=0

Run a yum command to test, and it should be pulling information about packages from the local repo.

	~] yum list httpd

## Update the kernel package appropriately to ensure a bootable system.
## Modify the system bootloader.


\newpage
\pagebreak

