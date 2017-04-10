<!-- 
.. title: LVM Quick Reference
.. slug: lvm-quick-reference
.. date: 2017-04-10 21:50:33 UTC+01:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

# LVM Cheat Guide

There are a number of commands to know when doing basic Logical Volume Management, and it is probably most efficient to remember the three layers and how they interact, to be able to manage LVM volumes efficiently and autonomously.

## I. Devices and Volumes

### Physical devices

On the disk partitions side, there are:

* An actual device: a hard disk, SSD, USB drive, etc
	* for example, `/dev/sda` or `/dev/hdb`
* Partitions on the drives
	* for example `/dev/sda1` or `/dev/sdb3`

The tools to manipulate these are

* `lsblk` to identify block devices easily
	* or `df` if `lsblk` is not available
* `fdisk` or `gdisk` for partitioning

### Logical constructs

In LVM there are 3 layers:

* The Physical Volume
	* rather than referring to a device, it actually refers to a partition on a device
	* It is generally also referred to with the partition name
	* for example `/dev/sda1` or `/dev/sdb3`
* The Volume Group
	* this identifies a grouped pool of Physical Volumes that can be used together in the group
	* for example `/dev/mapper/lv-group`
* The Logical Volume
	* a collection of Physical Volumes from the same group
	* There can be multiple Logical Volumes per Volume Group
	* The Logical Volume looks like a single partition when you check your mount points
	* A Logical Volume can incorporate or release Physical Volumes in its group
	* For example, `/dev/mapper/lv-group/lv-volume`

The tools used to manage these are divided into three sets, each with multiple operations:

* `pv*`, `vg*` and `lv*`
* for all three, `*scan`, `*display`, `*create`
* for `vg*` and `lv*`, the added operations `*extend`, `*remove`
* each set has many more of its own operations, use tab completion on the start of the command-set to show them.

## II. Operations

The easiest way to remember the order of operations is to think of it this way: A physical device gets divided into partitions, and the partitions are reassembled into groups to form logical volumes.

If anything, this diagram may be the most useful to retain:


	Plain Partitions            Logical Volume Management
	======================================================================


	ACTUAL DEVICE       +-------->  PHYSICAL VOLUME 
	     |              |                   |
	     |              |                   |
	     |              |          <vgcreate, vgextend>
	     |              |                   |
	     |              |                   |
	                    |                   |
	  <fdisk>       <pvcreate>        VOLUME GROUP 
	                    |                   |
	     |              |                   |
	     |              |          <lvcreate, lvextend>
	     |              |               <resize2fs>
	     |              |                   |              Non-mountable states
	 --------------------------------------------------------------------------
	     |              |                   |              Mountable states
	     v              |                   v
	 PARTITION ---------+             LOGICAL VOLUME


As such, the first operations divide the physical devices into partitions, after which they are prepped, added to the appropriate volume group, added to a logical volume, and the logical volume is expanded to incorporate it. Finally the system needs to expand the filesystem to the full extents of the volume.

### 1. Device Preparation : Partitioning

Identify or create a partition you want to add to your LVM space.

You can use sudo `fdisk /dev/sdX` to create or manipulate partitions.

The partitions you want to add to volume management must have the system tag `8e` : "Linux LVM"

If the partitions you are creating are on the same device as one your system is currently using, you will need to remount it, or even reboot if your root partition resides there.

### 2. Prepare the partition for LVM : Physical Volume

* Use `pvscan` to identify existing Physical Volumes.
* Use `pvdisplay` for detailed information about each.
* Use `pvcreate $PARTITION` (where `$PARTITION` is a `/dev/sdX` as appropriate) to add physical volume information to the partition.
* Use `pvscan` to confirm that it is recognized.

### 3. Associate the Physical Volume : Volume Group

* Use `vgscan` to identify existing Volume Groups
* Use `vgdisplay` to print detailed information about them.

#### a. Creating new Volume Groups

* Use vgcreate `$VOLUMENAME $PV` to create a new Volume Group

Here, `$PV` is a physical volume path (the name of a partition you've already prepped as a physical volume). When creating a new volume group, you need to specify a physical volume, you can't create one empty.

#### b. Add any extra Physical Volumes to an existing Volume Group

* Use `vgextend $VOLUMENAME $PV`

Again, any physical volume `$PV` is a `/dev/sdN` partition that has been marked as a physical volume.

### 4. Assign the Physical Volume to a Logical Volume

* Use `lvscan` to identify Logical Volumes attached to your machine.

* Use lvdisplay to get detailed information

#### a. Creating new Logical Volumes

Use `lvcreate --extents 100%FREE $PV` to incorporate 100% of the currently free space on the Physical Volume. Note that `100%FREE` has no space character in it.

Finally, you need to create a filesystem on it:

	mkfs.ext4 $LV

where `$LV` is the logical volume's path (again, check `lvscan`).

Use `lvdisplay` for detailed information on the Logical Volumes on your system.

#### b. Adding a Physical Volume to an existing Logical Volume

Use `lvextend --extents 50%FREE $LV $PV` to add 50% (for example) of the *currently free* space on $PV to the Logical Volume identified by `$LV`; where `$LV` is the path to the Logical Volume, for example `/dev/mapper/lv-group/lv-volume`. Note again that `50%FREE` does not have a space in it.

After adding a Physical Volume to a Logical Volume, the Logical Volume still needs to make use of the added space. To do this for ext2,, ext3 and ext4 filesystems, use `resize2fs $LV` where `$LV` is the name or group of the Logical Volume.

You may be requested to run a disk check first before completing the procedure.
