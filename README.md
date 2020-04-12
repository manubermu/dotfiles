# dotfiles

### Repository index
- [Welcome to Dotfiles!](#welcome)
- [Installation Guide](#install)
 	- [Dotfiles on your local computer](#install)
 	- [From Google drive (or other cloud service)](#install_cloud)
- [How to: Uninstall Dotfiles](#uninstall)
- [Contribute to this repository](#contribute)
- [New to Dotfiles? Don't be panic!](#newbie)
- [Special thanks](#thanks)
- [Contact](#contact)


# <a name="install"></a>Installation Guide

**Note:** Tested on OS X Sierra 10.12.0 and El Capitan 10.11.4 using iMac (Mid 2011) and Mac Book Pro Retina (Early 2015).

1. Open the **Terminal** app.
	- Option 1. Go to /Applications/Utilities and click on Terminal icon.
	- Option 2. Open spotlight (command ⌘ + space), type "Terminal" and click enter.

2. Clone this repository on your on your /Documents directory and enter to the created directory.

	```Bash
	$ cd /Users/<your_username>/Documents
	$ git clone https://github.com/manubermu/dotfiles.git
	$ cd dotfiles
	```

3. <a name="install_point3" /> Run `./install.sh` located on your dotfiles folder.

	```bash
	$ cd /Users/<your_username>/Documents/dotfiles
	$ chmod +x dotfiles.sh && ./dotfiles.sh
	```
