# Initial Setup for Linux

## Network Driver Issues:

Wireless Network for Broadcom _14e4:4365_, is not supported by default by, Linux Mint/Ubuntu
To get a workaround for this, I went to this [site](https://askubuntu.com/questions/459654/drivers-for-broadcom-bcm43142-on-ubuntu-14-04-trusty-tahr)

__*Solution*__:
Using Synaptics Manager Install `bcmwl-kernel-source`, for wireless network...

## Initial Installs:

#### Important Repos:

* [Awesome Teminal Fonts](https://github.com/gabrielelana/awesome-terminal-fonts)
	- Can be used for Modifying various terminal related fonts, to look better...
* [Git Terminal PS1](https://github.com/arialdomartini/oh-my-git)

### Command Line:

* Java 1.8 (JRE & JDK) -> [How To Install](http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html)

> NOTE: Eclipse Works with Java v1.8 only...

* Mysql -> Using Synaptics
	- Also Installing Mysql Shell for Batch Programming...
* Git
- Docker -> [Installation](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#os-requirements)
* Redshift
	- Create a Config file from [Official Page](http://jonls.dk/redshift/)
	- Check these [dependencies](https://askubuntu.com/questions/482373/how-do-i-install-redshift-in-ubuntu), and install
	them using Synaptics...
	- `redshift -c ~/.config/redshift.conf` to run the redshift
	- Also in configuration, To setup for Multiple Displays, checkout [this issue](https://github.com/jonls/redshift/issues/23#issuecomment-228368667). It describes to use xrandr for finding the number for primary screen...
* Vim
* Sublime Text
* Atom Text Editor - [Site](https://github.com/atom/atom/releases/)
* Visual Studio COde
* NodeJS - [Site](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)

### Softwares

* Eclipse (installer)
* DBeaver (Installer)
	- Change the dbeaver.ini file in `/usr/share/dbeaver` or in installed directory and change `--launcher.GTK_version` to 3
* MongoDB


### Setups

* Generate SSH Key for Git
	- Use Public Key for SSH for Gitlab
	- Setup SSH Config for other remotes, [How To](https://www.digitalocean.com/community/tutorials/how-to-configure-custom-connection-options-for-your-ssh-client)
* Install PowerLine Fonts, before proceeding... Better use FiraCode, 
  a much better Font for Development, also if used, enable Font Ligatures...

```shell
cd
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d #if directory doesn't exists

# Clean Font Cache...
fc-cache -vf ~/.fonts/

# Move config file
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```
* Teminal Setup:
	- [Silver Searcher](https://github.com/ggreer/the_silver_searcher)
	- [Fuzzy Search](https://github.com/junegunn/fzf)
	- Use Shubham's Cobalt2 Theme, _Paste it to ~/.oh-my-zsh/themes_, and change theme to cobalt2.
* Setting Up `vim`:
	- Clone Shubham's [Repo](https://github.com/snkshukla/dotfiles)
	- Copy .vim folder to ~/, and make necessary changes to install only required plugins in VIM
	- `PlugInstall` in `vim`

* Setting Eclipse Color Themes
	- Make theme to Dark
	- Download __Eclipse Color Theme__ for Eclipse and Set the Syntax to Monokai __OR INSTALL Darkest Dark Theme__
	- For handling Eclipse Tabs, use .desktop to run following __NOTE: Can also be used with DBeaver__
	_Exec=env SWT_GTK3=0 GTK2_RC_FILES=<DIR>/.gtkrc-eclipse <DIR>/eclipse-jee-neon/eclipse_, [LINK](https://github.com/KiranMohan/eclipse-gtk3-ubuntu)
	Where `.gtkrc-eclipse` can be found [here](https://gist.github.com/andrioli/3825078)...

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

## Needs to be Done

* ~~Change PS1 for Terminal~~
	- Install _oh-my-zsh_, and Patched PowerLine Fonts from [Site](https://github.com/Lokaltog/powerline-fonts).
* ~~Need to Make DBeaver Eclipse UI support small tabs...~~
