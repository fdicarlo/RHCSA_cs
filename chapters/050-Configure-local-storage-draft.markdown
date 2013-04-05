# Configure local storage

## List, create, delete, and set partition type for primary, extended, and logical partitions.

The official tool is now parted, but you can still use fdisk to create partitions. I'm a fan of fdisk, so thats what I will be using here.

### List partitions

To list all partitions that are on your server, you would issue the fdisk command, with the list switch.

	$ fdisk -l

### Create new partitions

In order to create new partitions you would first have to open the device in fdisk. I will be opening /dev/sdb and creating both a primary and extended partition. We use the n command to create a new partition.

	$ sudo fdisk /dev/sdb

	Command (m for help): n
	Command action
	e   extended
	p   primary partition (1-4)
	p
	Partition number (1-4, default 1): 1
	First sector (2048-8388607, default 2048): 
	Using default value 2048
	Last sector, +sectors or +size{K,M,G} (2048-8388607, default 8388607): +250M

	Command (m for help): p

	Disk /dev/sdb: 4294 MB, 4294967296 bytes
	255 heads, 63 sectors/track, 522 cylinders, total 8388608 sectors
	Units = sectors of 1 * 512 = 512 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	Disk identifier: 0xd26a7e50

	Device Boot      Start         End      Blocks   Id  System
	/dev/sdb1            2048      514047      256000   83  Linux

	Command (m for help): n
	Command action
	e   extended
	p   primary partition (1-4)
	e
	Partition number (1-4, default 2): 
	Using default value 2
	First sector (514048-8388607, default 514048): 
	Using default value 514048
	Last sector, +sectors or +size{K,M,G} (514048-8388607, default 8388607): +500M

	Command (m for help): w
	The partition table has been altered!

	Calling ioctl() to re-read partition table.
	Syncing disks.
	$ sudo partprobe

### Delete partitions

Deleting partitions is even easier. You would just type d at the fdisk prompt, tell it which partition number you are deleting, and the write the changes with the w flag.

	$ sudo fdisk /dev/sdb

	 Command (m for help): p

	 Disk /dev/sdb: 4294 MB, 4294967296 bytes
	 255 heads, 63 sectors/track, 522 cylinders, total 8388608 sectors
	 Units = sectors of 1 * 512 = 512 bytes
	 Sector size (logical/physical): 512 bytes / 512 bytes
	 I/O size (minimum/optimal): 512 bytes / 512 bytes
	 Disk identifier: 0x08bafe2e

	   Device Boot      Start         End      Blocks   Id  System
	 /dev/sdb1            2048     1026047      512000   83  Linux
	 /dev/sdb2         1026048     1538047      256000    5  Extended

	 Command (m for help): d
	 Partition number (1-5): 2

	 Command (m for help): p

	 Disk /dev/sdb: 4294 MB, 4294967296 bytes
	 255 heads, 63 sectors/track, 522 cylinders, total 8388608 sectors
	 Units = sectors of 1 * 512 = 512 bytes
	 Sector size (logical/physical): 512 bytes / 512 bytes
	 I/O size (minimum/optimal): 512 bytes / 512 bytes
	 Disk identifier: 0x08bafe2e

	   Device Boot      Start         End      Blocks   Id  System
	 /dev/sdb1            2048     1026047      512000   83  Linux

	 Command (m for help): w
	 The partition table has been altered!

	 Calling ioctl() to re-read partition table.
	 Syncing disks.
	 $ sudo partprobe

### Set partition type

In order to use the disk we have to set a partition type. In this case we just make it a general Linux format #83. If it were going to be part of a raid array, we would make it Linux raid auto, #fd.

	$ fdisk /dev/sdb

	Command (m for help): t
	Selected partition 1
	Hex code (type L to list codes): L

	0  Empty           24  NEC DOS         81  Minix / old Lin bf  Solaris        
	1  FAT12           27  Hidden NTFS Win 82  Linux swap / So c1  DRDOS/sec (FAT-
	2  XENIX root      39  Plan 9          83  Linux           c4  DRDOS/sec (FAT-
	3  XENIX usr       3c  PartitionMagic  84  OS/2 hidden C:  c6  DRDOS/sec (FAT-
	4  FAT16 <32M      40  Venix 80286     85  Linux extended  c7  Syrinx         
	5  Extended        41  PPC PReP Boot   86  NTFS volume set da  Non-FS data    
	6  FAT16           42  SFS             87  NTFS volume set db  CP/M / CTOS / .
	7  HPFS/NTFS/exFAT 4d  QNX4.x          88  Linux plaintext de  Dell Utility   
	8  AIX             4e  QNX4.x 2nd part 8e  Linux LVM       df  BootIt         
	9  AIX bootable    4f  QNX4.x 3rd part 93  Amoeba          e1  DOS access     
	a  OS/2 Boot Manag 50  OnTrack DM      94  Amoeba BBT      e3  DOS R/O        
	b  W95 FAT32       51  OnTrack DM6 Aux 9f  BSD/OS          e4  SpeedStor      
	c  W95 FAT32 (LBA) 52  CP/M            a0  IBM Thinkpad hi eb  BeOS fs        
	e  W95 FAT16 (LBA) 53  OnTrack DM6 Aux a5  FreeBSD         ee  GPT            
	f  W95 Ext'd (LBA) 54  OnTrackDM6      a6  OpenBSD         ef  EFI (FAT-12/16/
	10  OPUS            55  EZ-Drive        a7  NeXTSTEP        f0  Linux/PA-RISC b
	11  Hidden FAT12    56  Golden Bow      a8  Darwin UFS      f1  SpeedStor      
	12  Compaq diagnost 5c  Priam Edisk     a9  NetBSD          f4  SpeedStor      
	14  Hidden FAT16 <3 61  SpeedStor       ab  Darwin boot     f2  DOS secondary  
	16  Hidden FAT16    63  GNU HURD or Sys af  HFS / HFS+      fb  VMware VMFS    
	17  Hidden HPFS/NTF 64  Novell Netware  b7  BSDI fs         fc  VMware VMKCORE 
	18  AST SmartSleep  65  Novell Netware  b8  BSDI swap       fd  Linux raid auto
	1b  Hidden W95 FAT3 70  DiskSecure Mult bb  Boot Wizard hid fe  LANstep        
	1c  Hidden W95 FAT3 75  PC/IX           be  Solaris boot    ff  BBT            
	1e  Hidden W95 FAT1 80  Old Minix      
	Hex code (type L to list codes): 83

	Command (m for help): w
	The partition table has been altered!

	Calling ioctl() to re-read partition table.
	Syncing disks.

Redhat actually encourages the use of parted nowadays, with works a little differently. To see information about that, see this link http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Storage_Administration_Guide/s1-disk-storage-parted.html

## Create and remove physical volumes, assign physical volumes to volume groups, and create and delete logical volumes.

### Create and remove physical volumes

Creating a physical volume in LVM is the first step in the LVM setup. Its the part where you actually tell Red Hat Enterprise Linux that you want a disk to be used for LVM.

pvcreate is the command used to add the physical volumes, or physical partitions.

	~] pvcreate /dev/sdb
	~] Physical volume "/dev/sdb" successfully created

pvremove is used to disassociate the volume from LVM.

	~] pvremove /dev/sdb
	~] Labels on physical volume "/dev/sdb" successfully wiped

### Assign physical volumes to volume groups

Once that physical volume has been created we can add it to a volume group with the vgcreate or vgextend (if the volume group has already been created).

If the volume group does not exist, you can create it and add physical volumes in one shot:

	~] vgextend MyVolGroup /dev/sdc 
	No physical volume label read from /dev/sdc
	Physical volume "/dev/sdc" successfully created
	Volume group "MyVolGroup" successfully extended

To assign a new physical volume to an existing volume group we use vgextend:

	~] vgextend MyVolGroup /dev/sdc 
	Volume group "MyVolGroup" successfully extended

Similarly if we want to remove /dev/sdc from that group we would run ''vgreduce'':

	~] vgreduce MyVolGroup /dev/sdc
	Removed "/dev/sdc" from volume group "MyVolGroup"


### Create and delete logical volumes

Logical Volumes have similar commands to create and delete as Volume Groups and Physical Volumes.

To create a new logical volume:

	~] lvcreate -L 100M MyVolGroup
	Logical volume "lvol0" created

To display the volume after for confirmation:

	~] lvdisplay MyVolGroup
	--- Logical volume ---
	LV Name                /dev/MyVolGroup/lvol0
	VG Name                MyVolGroup
	LV UUID                zwLMev-i63w-7Jpk-XuqZ-VGl7-89Ov-WpoewP
	LV Write Access        read/write
	LV Status              available
	# open                 0
	LV Size                100.00 MiB
	Current LE             25
	Segments               1
	Allocation             inherit
	Read ahead sectors     auto
	- currently set to     256
	Block device           253:2

To delete the logical volume you would use the LV Name listed in the results of lvdisplay:

	:::bash ~] lvremove /dev/MyVolGroup/lvol0 Do you really want to remove active logical volume lvol0? [y/n]: y Logical volume "lvol0" successfully removed

## Create and configure LUKS-encrypted partitions and logical volumes to prompt for password and mount a decrypted file system at boot.

This is a brand new objective that was not present on the RHEL5 requirements. There are a few steps to this, but once you go through it a few times its not too bad.

First step is to create a partition with fdisk or parted. We will use fdisk here.

	~] fdisk -c -u /dev/sdb

	Command (m for help): n
	Command action
	e   extended
	p   primary partition (1-4)
	p
	Partition number (1-4, default 1): 1
	First sector (2048-8388607, default 2048): 
	Using default value 2048
	Last sector, +sectors or +size{K,M,G} (2048-8388607, default 8388607): +200M

	Command (m for help): t
	Selected partition 1
	Hex code (type L to list codes): 83

	Command (m for help): w
	The partition table has been altered!

	Calling ioctl() to re-read partition table.
	Syncing disks.

Now that the partition is created, we have to luks encrypt it. First we fill it with random data for security:

	 ~] dd if=/dev/urandom of=/dev/sdb1 bs=1M
	dd: writing '/dev/sdb1': No space left on device
	201+0 records in
	200+0 records out
	209715200 bytes (210 MB) copied, 26.0497 s, 8.1 MB/s

Then we can encrypt the partition with luksFormat:

	 ~] cryptsetup luksFormat /dev/sdb1

	WARNING!
	========
	This will overwrite data on /dev/sdb1 irrevocably.

	Are you sure? (Type uppercase yes): YES
	Enter LUKS passphrase: 
	Verify passphrase:

Now that the partition is encrypted, we open it and give it a label. The label is the name that it will show up as under /dev/mapper/

	~] cryptsetup luksOpen /dev/sdb1 mynew_data 
	Enter passphrase for /dev/sdb1:

Once the partition is setup and luks encrypted, it will be available in the /dev/mapper/ directory. You can do an ls on the /dev/mapper/ directory to confirm.

	~] ls /dev/mapper/
	control  mynew_data  VolGroup-lv_root  VolGroup-lv_swap

Next steps involve creating a filesystem, adding the partition into the /etc/crypttab file, as well as in the /etc/fstab file in order to configure automounting on boot.

	~] mkfs.ext4 /dev/mapper/mynew_data 
	mke2fs 1.41.14 (22-Dec-2010)
	Filesystem label=
	OS type: Linux
	Block size=1024 (log=0)
	Fragment size=1024 (log=0)
	Stride=0 blocks, Stripe width=0 blocks
	50800 inodes, 202752 blocks
	10137 blocks (5.00%) reserved for the super user
	First data block=1
	Maximum filesystem blocks=67371008
	25 block groups
	8192 blocks per group, 8192 fragments per group
	2032 inodes per group
	Superblock backups stored on blocks: 
	8193, 24577, 40961, 57345, 73729
	Writing inode tables: done                            
	Creating journal (4096 blocks): done
	Writing superblocks and filesystem accounting information: done

	This filesystem will be automatically checked every 25 mounts or
	180 days, whichever comes first.  Use tune2fs -c or -i to override
	~] vim /etc/crypttab

In the /etc/crypttab file you would simply place the name of the encrypted device, as well as the path to the device:

mynew_data /dev/sdb1

Then we make the directory and add an entry into fstab, so that it mounts on boot:

	~] mkdir /mynew_data
	~] vim /etc/fstab

	# Add the following:
	/dev/mapper/mynew_data /mynew_data ext4    defaults    1 2

Thats it. You should run the mount command in order to verify your entries are correct in fstab, to prevent any boot issues.

	~] mount -a

	~] mount
	# .... lots of data here that im leaving out
	/dev/mapper/mynew_data on /mynew_data type ext4 (rw,relatime,seclabel,barrier=1,data=ordered)

Awesome, try that a few times and you should be good to go on setting up luks encrypted partitions.

## Configure systems to mount file systems at boot by Universally Unique ID (UUID) or label.

Configuring a filesystem to mount via UUID or label is an essential part of managing filesystems and partitions on the Red Hat Enterprise Linux system, and will most probably be something you will see on an RHCSA/RHCE exam.

First we will configure mounting at boot time via UUID. To find the UUID of a device you have to issue just one command:

	~] blkid
	/dev/sda1: UUID="183e5753-fbe7-4cf7-b974-f6cb9a326a33" TYPE="ext4" 
	/dev/sda2: UUID="1OJDNK-4gpP-s3YE-cK7o-1urJ-cXHk-jPnuF7" TYPE="LVM2_member" 
	/dev/sdb1: UUID="1c1fa5a2-11e5-4d6b-89e9-61a15dcbe0f6" TYPE="crypto_LUKS" 
	/dev/mapper/VolGroup-lv_swap: UUID="dc82e68f-f1b9-409d-a1f7-c556eb6eb78a" TYPE="swap" 
	/dev/sdc: UUID="vFLamh-rudP-T1jc-ZrrH-LTgD-FUuq-IHUBgM" TYPE="LVM2_member" 
	/dev/mapper/VolGroup-lv_root: UUID="5bbc084b-1af0-464f-8629-9490a75cacd9" TYPE="ext4" 
	/dev/mapper/mynew_data: UUID="f8b694a6-916d-4ffa-8e5c-a7ed8ab25b5d" TYPE="ext4"

Once you have the UUID you can head over to /etc/fstab to create the entry. Here we will pick our new luks partition.

	~] vim /etc/fstab
	Inside of fstab we need to add a line. (if you already have a line for this partition, comment it out with #)

	UUID=f8b694a6-916d-4ffa-8e5c-a7ed8ab25b5d /mynew_data ext4 defaults 1 2

Then write/save the file and quit :wq You can confirm that this is entered correctly by using the mount command:

	~] mount -a

	~] mount
	..ommitted data...
	/dev/mapper/mynew_data on /mynew_data type ext4 (rw,relatime,seclabel,barrier=1,data=ordered)

Now to mount a filesystem via label requires another step, to label the filesystem. Luckily this is done in one easy step using e2label. I am going to label the filesystem luksdrive

	~] e2label /dev/mapper/mynew_data luksdrive

Now we can unmount the filesystem, change our fstab to use a label, and run mount a again to see it mounted via label instead.

	~] umount /mynew_data/

Verify its unmounted

	~] mount

Then edit /etc/fstab this time using LABEL=luksdrive in place of UUID. So the line should look like:

	LABEL=luksdrive         /mynew_data             ext4    defaults        1 2
	Run mount -a and mount to confirm:

	~] mount -a

	~] mount
	..ommitted data...
	/dev/mapper/mynew_data on /mynew_data type ext4 (rw,relatime,seclabel,barrier=1,data=ordered)

Thats all there is to that. I would try that out a number of times to make sure you have the process down. Repitition is key.

## Add new partitions and logical volumes, and swap to a system non-destructively.

\newpage
\pagebreak

