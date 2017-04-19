<!-- 
.. title: About this site
.. slug: about-this-site
.. date: 2017-04-08 20:51:07 UTC+01:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

A very brief note on what I am using to host this very site. To blow my trumpet and suchlike.

I am hosting this on an [AWS micro-instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts_micro_instances.html). I would normally host on digitalOcean, but using Amazon VPC units is more of a learning thing. Hardly anybody asks for digitalOcean management skills. Amazon's all the rage it seems.

There's very little installed to it - keep things minimal and such. I haven't even installed a webserver to it.

"What be this devilry," you may ask, "for surely, you are serving web pages?" Indeed I am. But not directly from the host environment. Everything is running in a [LXC Linux Container](https://en.wikipedia.org/wiki/LXC), which I manage using [my own tool, Easy LXC](https://gitlab.taikedz.net/taikedz/easy-lxc)

One of the hurdles I have had to overcome to do this is the port forwarding and firewalling, which is more of a hassle than blogs and stack overflow threads woudl have you believe. I hope I [have done my bit](https://serverfault.com/questions/841951/cannot-port-forward-with-ufw-on-ubuntu) now to remedy that to an extent from the forums point of view. It's still not perfect for UFW - when adding the rules in UFW, the containers lose their outgoing connectivity for some strange reason - so for the time being, I am using a homegrown firewall application script I call [Very Easy Firewall](https://gitlab.taikedz.net/taikedz/vefirewall). Before you start with the "oh, but making your own firewall system is highly insecure use a pre-made one," I should stress, I have not re-invented any core firewalling - it's still all iptables under the hood. It's easier to understand what is being done than with UFW, but not as flexible.

*In fine*, that is good. Easier to understand is better. Who wants a firewall state they cannot understand or troubleshoot? It becomes thus more fixable too. I still don't get why UFW is being such a pain, and the fact that it litters the iptables chains with so many damn subchains helps none whatsoever.

Finally the web content layer - these pages are simply static files, served by an apache server, built using the [Nikola static site builder](https://getnikola.com/).

I used to have a Wordpress-based blog at [https://ducakedhare.co.uk](https://web.archive.org/web/20161202072352/http://ducakedhare.co.uk/) but in deciding to retire the DuCakedHare name, I also decided it might be time to ditch the Wordpress stuff too:

1. I am increasingly less and less comfortable with running my personal website on a PHP stack, for content that is not, in itself, dynamic.
1. I like being able to version my site in `git`
1. I like being able to make a tarball as a backup
1. I like writing text as Markdown, in `vim`. Distractionless writing. No sodding buttons and ribbons.

It's not the tool for everyone, but it's one less moving part being exposed to the Wild Wild Net.
