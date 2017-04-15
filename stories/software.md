<!-- 
.. title: Software Projects
.. slug: software
.. date: 2017-04-14 09:00:39 UTC+01:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

Some items I've been working on that could be useful beyond my own personal uses...

# Easy LXC

[https://gitlab.taikedz.net/taikedz/easy-lxc](https://gitlab.taikedz.net/taikedz/easy-lxc)

Easy LXC is a wrapper around the `lxc-*` commands that provides helpful shortcuts to more swiftly manage your growing collection of Linux Containers on Ubuntu.

Highlights:

* Handy `lx COMMAND CONTAINER` syntax allows you to not specify the "-n" token constantly.
* Implicit container selection
* Defaults file to configure default arguments for any command - for example
	* always list in `--fancy` mode
	* always create amd64 containers
	* etc
* Specify containers by substring name - just type part of the name, and if it matches a single container, that container will be targeted!

Example:

	lx create new-container1
	lx create new-container2
	lx start r1 # Start new-container1, matched by 'r1' in the name
	lx attach . -- hostname # attaches to last used container name
	lx stop
	lx destroy new-container2 # explcitily full name

Only the `create` and `destroy` commands need an explicitly stated name. The rest implicitly use the last name (symbolized by `.` if additional arguments are used)

# Very Easy Firewall

[https://gitlab.taikedz.net/taikedz/vefirewall](https://gitlab.taikedz.net/taikedz/vefirewall)

Very Easy Firewall offers an easy way to manage `iptables` rules in sets with little fuss. Allowing a new port is as simple as

	vef edit input

and adding port numbers!

There are extra features that you may find useful as a sysadmin such as

* Keeping IpTables chains clean - no extraneous chains making thigns heck to read
* Easily readable and writable lists of ports
* Actively seeks to find the configured OpenSSH Server port and allows it - no more accidental lockouts
* Open ports only on given interfaces
* Example lines for port forwarding (see the `lxc` set)
* Code is concise, but clear -- making it easy to maintain and customizable to YOUR requirements.

Example of a VEFirewall input config:

	#%POLICY=ALLOW

	# Allow web ports
	80 443

	# Allow MySQL only on loopback/local interface
	%lo 3306

	# DNS queries over UDP
	53u

Simple!
