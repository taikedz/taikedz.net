<!-- 
.. title: How Open Windows Could Screw Over Linux Adoption
.. slug: how-open-windows-could-screw-over-linux-adoption
.. date: 2017-04-19 11:39:53 UTC+01:00
.. tags: linux, microsoft, embrace extend extinguish
.. category: linux
.. link: 
.. description: A review of how Embrace Extend Extinguish can harm open source
.. type: text
-->

This is a musing on how ["Embrace, Extend, Extinguish"](https://en.wikipedia.org/wiki/Embrace%2C_extend_and_extinguish) could be applied in today's open world. I'm not saying that Microsoft _will_ do this - its Ballmer days are over, right? - but that, in essence, it could.

I personally would like to have as little to do with Microsoft products as possible. Currently, that is not a luxury I can yet afford. But I am working on it.

It also brings to the fore of my mind the importance of specifying what I mean by "I run Linux on my laptop" - it means:

> **I run "GNU/Linux"**, from boot to `init` and beyond.

* I do not have any interest in "Android/Linux" on my laptop
* I would rather have GNU/Linux on my phone
* Chrome/Linux is a lobotomization of GNU/Linux
* and I certainly have no interest in putting effort into "Win/Linux".

Which reminds me, my Trisquel migration project is still waiting...

So without further ado: how could Microsoft's Linux Subsystem for Windows damage the further adoption of Linux and Free Software.

Emphasis on *could*.

## 1/ Release various Microsoft tools for Windows devlopment as open sourced code

> Embrace

This is a critical move to increase adoption of MS tools in the community, thereby leading to a desire for these tools, translated to the workplace.

Adoption of tools not only amongst individual developers but predominantly in teaching institutions is especially good for pushing these tools into the workplace. Make it open. Make it adoptable. Make it addictive. Microsoft moves in on high schools and universities. Graduates come to expect these tools at work, or bring them to their new workplaces.

## 2/ Integrate Linux subsystem to run Linux binaries and tools

> Extend

Increase adoption of Windows in general. Why have multiple operating systems when you can have just the one ; GNU/Linux apps will run on Win/Linux but not the reverse. So just deploy everything on Windows.

Don't bother investing in training on Red Hat, SuSE or Ubuntu. Windows runs Linux apps, because Microsoft loves Linux!

With Windows still largely deployed on desktops, developing for the Linux subsystem can be done on Windows, and deployed to Windows systems. Traditionally Windows-only solutions can run on the same host as their Linuxy bretheren.

## 3/ Contribute to open source projects

> Prepare to Extinguish

Microsoft and open-Microsoft advocates start committing changes to popular open source projects, making them run well on Win/Linux and *take advantage of Windows features exposed to the Linux subsystem*, as well as helpfully providing improved packaging options and dsitrbution options for Windows systems.

The full benefits of harnessing the throughput of the community to improve workflows benefits Windows users and the Windows experience. Things look up.

Software Freedom advocates realize they must ride out the storm.

## 4/ Develop parallel closed improvements to otherwise open tools

> War

Core developers, originally Microsoft employees from the start, are directed to implement closed changes in the Enterprise context.

This is a migration to an open core strategy. Likely there will be extensions "for Enterprises" that integrate to the still highly closed source large solutions still payed for by companies.

The strong adoption driven by the "open" tools ushers the users of tools tied to Microsoft's strategy means further buy-in to the paid, closed options; and shutting out community efforts from driving decisions.

Software Freedom advocates sound alarm bells but are mostly ignored.

## 5/ Incrementally add Windows idiosyncracies to the Linux subsystem

> Pestilence

This means that special adaptations need to be made for Win/Linux apps to run on actual GNU/Linux, in absence notably of the hook-ins to the Windows oversystem hosting the Win/Linux subsystem.

Yes you could run the software on GNU/Linux, but you're better off with the out-of-the-box support on Win/Linux.

Software Freedom advocates see that this is a critical juncture - if a clean cut is not made at this point, the tear may pull more resources to the easier side - the side with an artifically lower barrier to entry, where the original core developers and decision makers are.

And it's easier to follow the original core developers, who stay with their employer.

## 6/ Cease contributing core code to open source variant

> Famine

Change the APIs used in closed versions, critical to communicating with the Enterprise features, and cease to publish documentation publicly.

Fast-paced development continues on the now fully re-closed packages with integrations and shiny improvements; and adopters of the "open Microsoft" tools don't really want to switch everything up to go to open aor Libre tools.

We've seen such effects of parting core developers between projects on MySQL and OpenOffice. In both cases, the core developers moved to keep their work open (spawning MariaDB and LibreOffice), and the company acquiring an open solution to slap on an open-core strategy suffered a blow.

In this scenario however, the core developers came not from an open community from the start, but as company employees, creating and managing the project with company goals and allegiances in mind.

Software Freedom advocates know they were right, but that is little consolation.

## 7/ Microsoft makes the case against open source

> Death

Microsoft claims that proper Enterprise systems cannot run on open source, and show that the community variants cannot keep up. The open variants continue to be developed in the community, but without the input from core developers who are still at Microsoft, the open variant lags behind the "real deal" and eventually is abandoned: those who move on adopt different tools, those who will not/cannot just pay into the Microsoft ecosystem.

Microsoft's strength in the industry is renewed, Linux's credibility is tarnished and set back.

Open-washing media neither knows nor cares about the fact that the deft retention of the core developers into the Microsoft fold is what contrbuted to the win. Game set and match.

## Epilogue

Richard Stallman wags his finger: yea for a time it was open, but it was never truly Free.

Linus Torvalds still doesn't give a shit: people sometimes make shit tool choices. As long as they don't shove them up his kernel, it's not his problem.

