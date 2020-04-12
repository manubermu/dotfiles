# Manuel's dotfiles

### Repository index
- [Welcome to Dotfiles!](#welcome)
- [Installation Guide](#install)
 	- [Dotfiles on your local computer](#install)

# <a name="install"></a>Installation Guide

**Note:** Tested on macOS Mojave 10.14.6 Mac Mini (Mid 2011).

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
