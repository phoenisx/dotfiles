# Some bookmarks that I don't want to delete

> These were the links and places I looked for when I was working on Ubuntu.
> Installing softwares in `Arch` is quite user friendly, and automatic.
> If any trouble comes up, either the Arch Doc or the community forums can help.

* Java 1.8 (JRE & JDK) -> [How To Install](http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html)

> NOTE: Eclipse Works with Java v1.8 only... I would suggest to use IntelliJ
> Enterprise version (if you can afford to buy the license).

* Git
- Docker -> [Installation](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#os-requirements)

* Redshift
	- Create a Config file from [Official Page](http://jonls.dk/redshift/)
	- Check these [dependencies](https://askubuntu.com/questions/482373/how-do-i-install-redshift-in-ubuntu), and install
	them using Synaptics...
	- `redshift -c ~/.config/redshift.conf` to run the redshift
	- Also in configuration, To setup for Multiple Displays, checkout [this issue](https://github.com/jonls/redshift/issues/23#issuecomment-228368667). It describes to use xrandr for finding the number for primary screen...


# Some Useful Info

* DBeaver (Installer)
  - Change the dbeaver.ini file in `/usr/share/dbeaver` or in installed directory
    and change `--launcher.GTK_version` to 3

* Generate SSH Key for Git
	- Use Public Key for SSH for Gitlab
	- Setup SSH Config for other remotes, [How To](https://www.digitalocean.com/community/tutorials/how-to-configure-custom-connection-options-for-your-ssh-client)

* Clone Docker Project from My Personal Repo, to start Hazelcast and AMQ with latest conf
* Git Setup
	- git config --global http.sslverify false (For Making HTTP Protocol work for cloning and stuff)
	- For SSH Cloning, I need to create a new Key file, whose config should be set like this
	- Also do remember to add the ssh key to registery

```shell
# Start the ssh-agent in the background.
eval "$(ssh-agent -s)"

# Register the Key...
ssh-add ~/.ssh/id_rsa

```

* Firefox Optimization for RAM:
	- Disable MultiProcess in Firefox
	- Enable Performance in Preferences -> General Tab, with `1` as Default.
	- Try to Remove most of the Plugins and Extensions used...
	- `browser.tabs.remote.autostart`, make it false

## Network Driver Issues:

Wireless Network for Broadcom _14e4:4365_, is not supported by default by, Linux Mint/Ubuntu
To get a workaround for this, I went to this [site](https://askubuntu.com/questions/459654/drivers-for-broadcom-bcm43142-on-ubuntu-14-04-trusty-tahr)

__*Solution*__:
Using Synaptics Manager Install `bcmwl-kernel-source`, for wireless network...

