# Operate running systems

## Boot, reboot, and shut down a system normally.

Basically, they are referring to these actions on the command line. I'm sure everyone is able to do this on a pc, but not necessarily a live Red Hat Enterprise Linux Server remotely.

The commands are simple for the server.

### Reboot

	$ sudo reboot

Another way

	$ sudo shutdown -r now

Changing to init 6 will reboot as well, which is what init 6 does.

	$ sudo init 6

### Shutdown

On the same note, init 0 calls all of the shutdown scripts and gracefully shuts down your machine.

	$ sudo init 0

Surprisingly you can also use the shutdown command to shutdown completely by using the -h switch.

	$ sudo shutdown -h

I think we all know how to boot the computer, so that shouldn't be a problem. :-)

## Boot systems into different runlevels manually.

Red Hat Enterprise Linux is similar to most other linux distributions in its core functionality. The ability to run the operating system in multiple run levels is an important skill to have.

If you type into your terminal:

	$ runlevel

you should see a number as the output.

	$ N 3

This is the runlevel my server was running at the time this was written.

There are 6 runlevels:

* Runlevel 0 - Halt
* Runlevel 1 - Single User mode. Most services turned off, including networking. Used to perform maintenance on the server usually. Boots logged into roots account, no password.
* Runlevel 2 - This is basic functions, multi-user mode, without any networking.
* Runlevel 3 - This is what servers usually run in, as it provides all of the services of the normal server, without the graphical user interface.
* Runlevel 4 - Doesn't really get used.
* Runlevel 5 - This provides the same functions of runlevel 3, along with services to allow for desktop functionality (graphical user interface).
* Runlevel 6 - Reboot

The command to jump runlevels is actually really easy. Just type init followed by the runlevel you want to switch into.

	$ init 1

The above command would turn off most services and drop you into single user mode.

## Use single-user mode to gain access to a system.

Booting into single user mode is the easiest way to gain access to a Red Hat Enterprise Linux server.

This is only feasible if you have access to the physical console, which you will on the RHCSA and RHCE exams.

* At the beginning of the boot process you should see the grub menu pop up with a countdown and some kernel options (or perhaps just one option).
* It should be counting down at this point and says: "Press any key to enter the menu". In this case you would hit any key.
* At the bottom of the screen there is an explanation of the few options that are available to use on this page. One of these options is "e" for edit. Hit "e" to edit the boot kernel options. NOTE: (You can also use "a" for append, although they both accomplish the same thing.)
* You would now edit the main kernel options, adding either "single" or even just "1" at the end. Once you have completed that hit enter, the "b" for boot.
* You are now in single user mode, and be auto logged in as root.

NOTE: for Red Hat Enterprise Linux 6.0 there is a bug that will prevent you from changing your root password in single user mode. This is a result of SELinux. For this situation you would want to temporarily disable SELinux.

	# setenforce 0

Now you should be allowed to change your root password.

## Identify CPU/memory intensive processes, adjust process priority with renice, and kill processes.

A few commands to help you identify processes on the exam are ps and top. These are commands that you will actually use extensively to monitor systems in the workplace.

### ps - report a snapshot of the current processes.

ps helps you see what processes are being run, what files and commands they are being run with, who they are being run by, as well and their process ids. All the above items are crucial when troubleshooting issues on a Red Hat Enterprise Linux 6 system.

a few good examples pulled from a man page:

EXAMPLES

	# To see every process on the system using standard syntax:
	$ ps -e
	$ ps -ef
	$ ps -eF
	ps -ely

	# To see every process on the system using BSD syntax:
	$ ps ax
	$ ps axu

	# To print a process tree:
	$ ps -ejH
	$ ps axjf

	# To get info about threads:
	$ ps -eLf
	$ ps axms

	# To get security info:
	$ ps -eo euser,ruser,suser,fuser,f,comm,label
	$ ps axZ
	$ ps -eM

	# To see every process running as root (real & effective ID) in user format:
	$ ps -U root -u root u

There is plenty of more info on this in the man pages as well as a plethoura of information on the web for ps.

### top - display Linux tasks

At its most basic usage you can just type:

	$ top

There is a whole lot of options that go along with that command: "man top" to see them all.

### renice — alter priority of running processes

As stated in the description, renice is a linux utility to change the priority of a process. This could obviously come in handy while trying to keep a process at bay.

Example from the man page:

	renice +1 987 -u daemon root -p 32

This would change the priority of process ID's 987 and 32, and all processes owned by users daemon and root.

Man Page http://linux.die.net/man/8/renice

### kill - terminate a process

Like it states in the name, this kills processes. Once you have identified the process you would like to kill with top or ps, you would use the kill command to terminate that process.

The most common implementation of this is:

	# kill 2342

If that doesnt kill the process you would use the -9 switch, which will take out most any process.

	# kill -9 2342

NOTE: The -9 command should be used with caution. Make sure you are killing the right pid, otherwise terrible things may transpire, especially on the RHCSA or the RHCE, where time is of concern.

## Locate and interpret system log files.

Most of the logs you will deal with are going to be located in /var/log/. There are some exceptions to this, such as apache vhosts. Many people write the logs for a specific virtual host in a folder with the web content.

Aside from the occasional exception, this is the spot.

Logs are written in a way that makes them easy to parse through with text processing tools like cat, grep, and awk.

One example would be searching for Failed logins in /var/log/secure

	$ cat /var/log/messages | grep Failed | less
	Apr  1 16:17:06 mytest sshd[19632]: Failed password for root from 84.204.56.234 port 39045 ssh2
	Apr  1 16:17:09 mytest sshd[19634]: Failed password for root from 84.204.56.234 port 39351 ssh2
	Apr  1 16:17:13 mytest sshd[19636]: Failed password for root from 84.204.56.234 port 39660 ssh2
	Apr  1 22:13:40 mytest sshd[19741]: Failed password for bin from 200.76.17.194 port 53407 ssh2
	Apr  1 22:13:43 mytest sshd[19744]: Failed password for bin from 200.76.17.194 port 40100 ssh2
	Apr  1 22:13:46 mytest sshd[19747]: Failed password for bin from 200.76.17.194 port 51759 ssh2
	Apr  1 22:13:49 mytest sshd[19749]: Failed password for bin from 200.76.17.194 port 45675 ssh2
	Apr  1 22:13:52 mytest sshd[19751]: Failed password for bin from 200.76.17.194 port 54379 ssh2
	Apr  1 22:13:55 mytest sshd[19753]: Failed password for bin from 200.76.17.194 port 12218 ssh2
	Apr  2 06:05:01 mytest sshd[20102]: Failed password for root from 117.211.83.59 port 34815 ssh2

By using the cat command we are able to read all contents of the file, but thats a lot of stuff. We only want to see Failed logins. We then pipe the result of cat, into grep and process the text there. Grep picks out any line that contains Failed. I then piped it to less to output only the last 10 lines.So now you can see all these failed password attempts on our test server. Wow.

Lets say we just want to process the text, and get a count of how many logins were failed in this file. We can pipe the output into wc -l, which counts lines.

	$ cat /var/log/messages | grep Failed | wc -l
	90

Thats a lot of failed logins. That lets us know we should probably tighten up our security a bit, maybe change the port for ssh. Thats something that is covered down the road though. But you can see the value in combining text processing utilities in order to get a clean final result.

Some key tools to look at are:

* cat - http://man.he.net/man1/cat
* tail - http://man.he.net/man1/tail
* head - http://linux.die.net/man/1/head
* wc - http://linux.die.net/man/1/wc
* less - http://linux.die.net/man/1/less
* more - http://linux.die.net/man/1/more
* grep - http://linux.die.net/man/1/grep
* awk - http://linux.die.net/man/1/awk
* sed - http://linux.die.net/man/1/sed

## Access a virtual machine's console.

Knowing how to access the virtual machines console is essential, and if you have never used it could take a few minutes to figure out.

There are two ways to pull it up, one from the gui menu in on the desktop, and the other with the following command in terminal:

	$ virt-manager

For images of what it looks like, if you have never seen it, check out Red Hat's website on the Virtual Machine Manager. Its fairly straightforward.

http://virt-manager.et.redhat.com/index.html

## Start and stop virtual machines.

Starting and stopping virtual machines is just like starting and stopping real machines.

The only main difference, is that you can start and stop them right from the . Virtual Machine Manager

The Red Hat Enterprise Linux 6 Virtual Machine Manager has a fairly intuitive graphical user interface, with obvious start and stop buttons for each machine. If you haven't used it at all, It would be good to download a trial copy of Red Hat, to get an idea of how to navigate the program.

### List VMs on the system

	# virsh list

### Start a VM

	# virsh create /etc/libvert/qemu/vm_file_name.xml

### Kill a VM

#### Shutsdown without notification

	#virsh destroy domain-id

###Shutdown a VM

####Shutdown down with notification
	#virsh shutdown domain-id

## Start, stop, and check the status of network services.

There are a few things to consider when dealing with network services:

* You want to make sure the service is running, if not start it.
* You want to be able to restart the service, to reload a config file that you may have changed.
* You want to have the ability to turn the service off, if you don't plan on using it.
* Also, you need to be able to set the service up to start on boot, or vise versa.

Service management takes place with the service command. Go figure.

To start the httpd service, you would type:

	$ sudo /sbin/service httpd start

To stop it:

	$ sudo /sbin/service httpd stop

To restart it:

	$ sudo /sbin/service httpd restart

To reload it (refresh configs without stopping and starting):

	$ sudo /sbin/service httpd reload

How do you know what services you can do that with? Well that can be listed with the tool that will handing startup programs. chkconfig.

chkconfig is used to manage what runlevel a program with automatically start or get killed in. To list all your services you would just type

	$ sudo /sbin/chkconfig --list

Thats a big list. But you get the idea, you can see how they are either on or off in each runlevel. To narrow down the list we can use grep to process the list and filter out say, our httpd service.

	$ sudo /sbin/chkconfig --list | grep httpd
	httpd              0:off   1:off   2:on    3:on    4:on    5:on    6:off

So we can see that in runlevels 2-5 we have httpd on in. If that were not the case, and my server rebooted, when it came back up all my sites would be disabled, until I manually went in and started the service.

To change the values of that you would just run chkconfig followed by the service and whether you want to on or off in the main runlevels.

	$ sudo /sbin/chkconfig httpd on

You can actually control what runlevels you want the service on in as well by adding the --level switch followed by the runlevels.

	$ sudo /sbin/chkconfig --level 45 httpd off
	$ sudo /sbin/chkconfig --list | grep httpd
	httpd           0:off   1:off   2:on    3:on    4:off   5:off   6:off

I turned off the httpd service for runlevel 4 and 5 there.

\newpage
\pagebreak
