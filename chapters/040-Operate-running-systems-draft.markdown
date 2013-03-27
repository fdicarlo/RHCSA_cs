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
## Use single-user mode to gain access to a system.
## Identify CPU/memory intensive processes, adjust process priority with renice, and kill processes.
## Locate and interpret system log files.
## Access a virtual machine's console.
## Start and stop virtual machines.
## Start, stop, and check the status of network services.

\newpage
\pagebreak
