# Red Hat Certified System Administrator (RHCSA) Exam objectives[^020-1]

Red Hat reserves the right to add, modify, and remove objectives. Such changes will be made public in advance through revisions to this document.

RHCSA exam candidates should be able to accomplish the tasks below without assistance. These have been grouped into several categories.

**Understand and use essential tools**:

* Access a shell prompt and issue commands with correct syntax.
* Use input-output redirection (>, >>, |, 2>, etc.).
* Use grep and regular expressions to analyze text.
* Access remote systems using ssh and VNC.
* Log in and switch users in multiuser runlevels.
* Archive, compress, unpack, and uncompress files using tar, star, gzip, and bzip2.
* Create and edit text files.
* Create, delete, copy, and move files and directories.
* Create hard and soft links.
* List, set, and change standard ugo/rwx permissions.
* Locate, read, and use system documentation including man, info, and files in /usr/share/doc.

Note: Red Hat may use applications during the exam that are not included in Red Hat Enterprise Linux for the purpose of evaluating candidate's abilities to meet this objective.

**Operate running systems**:

* Boot, reboot, and shut down a system normally.
* Boot systems into different runlevels manually.
* Use single-user mode to gain access to a system.
* Identify CPU/memory intensive processes, adjust process priority with renice, and kill processes.
* Locate and interpret system log files.
* Access a virtual machine's console.
* Start and stop virtual machines.
* Start, stop, and check the status of network services.

**Configure local storage**:

* List, create, delete, and set partition type for primary, extended, and logical partitions.
* Create and remove physical volumes, assign physical volumes to volume groups, and create and delete logical volumes.
* Create and configure LUKS-encrypted partitions and logical volumes to prompt for password and mount a decrypted file system at boot.
* Configure systems to mount file systems at boot by Universally Unique ID (UUID) or label.
* Add new partitions and logical volumes, and swap to a system non-destructively.

**Create and configure file systems**:

* Create, mount, unmount, and use ext2, ext3, and ext4 file systems.
* Mount, unmount, and use LUKS-encrypted file systems.
* Mount and unmount CIFS and NFS network file systems.
* Configure systems to mount ext4, LUKS-encrypted, and network file systems automatically.
* Extend existing unencrypted ext4-formatted logical volumes.
* Create and configure set-GID directories for collaboration.
* Create and manage Access Control Lists (ACLs).
* Diagnose and correct file permission problems.

**Deploy, configure, and maintain systems**:

* Configure networking and hostname resolution statically or dynamically.
* Schedule tasks using cron.
* Configure systems to boot into a specific runlevel automatically.
* Install Red Hat Enterprise Linux automatically using Kickstart.
* Configure a physical machine to host virtual guests.
* Install Red Hat Enterprise Linux systems as virtual guests.
* Configure systems to launch virtual machines at boot.
* Configure network services to start automatically at boot.
* Configure a system to run a default configuration HTTP server.
* Configure a system to run a default configuration FTP server.
* Install and update software packages from Red Hat Network, a remote repository, or from the local file system.
* Update the kernel package appropriately to ensure a bootable system.
* Modify the system bootloader.

**Manage users and groups**:

* Create, delete, and modify local user accounts.
* Change passwords and adjust password aging for local user accounts.
* Create, delete, and modify local groups and group memberships.
* Configure a system to use an existing LDAP directory service for user and group information.

**Manage security**:

* Configure firewall settings using system-config-firewall or iptables.
* Set enforcing and permissive modes for SELinux.
* List and identify SELinux file and process context.
* Restore default file contexts.
* Use boolean settings to modify system SELinux settings.
* Diagnose and address routine SELinux policy violations.
  
\newpage
\pagebreak

[^020-1]: Red Hat Certified System Administrator (RHCSA) Exam objectives (EX200): <https://www.redhat.com/training/courses/ex200/examobjective>
