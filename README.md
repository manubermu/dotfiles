![Dotfiles](doc/img/logo-dotfiles.png)

## Repository index
- [What is a Dotfile?](#what)
- [Why would I want my dotfiles on GitHub?](#why)
- [Installation Guide](#install)
 	- [Dotfiles on your local computer](#install)
- [Contribute](#contribute)
- [Acknowledgements](#acknowledgements)
- [My social networks](#social)
 	
## <a name="what"></a>What is a Dotfile?

According to Drew Barontini:

> Dotfiles is a name used to denote a set of configuration files (generally hidden ones with a . before the filename) that are used to set up and configure various applications and settings, such as: Bash. Git. Vim. Sublime Text"

## <a name="why"></a>Why would I want my dotfiles on GitHub?

According to [here](https://dotfiles.github.io):

> Backup, restore, and sync the prefs and settings for your toolbox. Your dotfiles might be the most important files on your machine.
Learn from the community. Discover new tools for your toolbox and new tricks for the ones you already use.
Share what you’ve learned with the rest of us.

## <a name="install"></a>Installation Guide

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

3. Run `./install.sh` located on your dotfiles folder.

	```bash
	$ cd /Users/<your_username>/Documents/dotfiles
	$ chmod +x install.sh && ./install.sh
	```
4. Now, a menu will appear with the different options offered by the script:

	![Options Menu](doc/img/options-menu.png)
	
	1. **Install Homebrew:** First install `XCode CL tools` and then `Homebrew`.
	2. **Install Applications:** It installs all the applications collected in the file `Brewfile`, located in `/install/profile/`
	3. **Configure macOS:** Configure Git, create _dev_ folders, download Python libraries, configure _Dock_, _Finder_ and `Transmission.app`.
	4. **Configure extensions:** Reads the extensions of a plain text file and sets as default editor `Sublime Text 3.app` and media player `IINA.app`
	5. **Install/Configure zsh:** Install and configure `Zsh` and download plugins.
	6. **Exit:** Finish the execution of the script.

## <a name="ontribute"></a>Contribute

This project as I started as something personal but any help, criticism or improvement is welcome.

* Reporting problems or suggesting new improvements can be done by [opening a new Issue](https://github.com/manubermu/dotfiles/issues). Explain the functionality or problem you found.

* Have you made improvements on the code and want to appear on the project? [Propose a pull request](https://github.com/manubermu/dotfiles/pulls).

## <a name="acknowledgements"></a>Acknowledgements

I would like to thank the following developers, who have published their dotfiles publicly for everyone to see. Thanks to them I have been able to realize this small project that I hope will help other developers.

* [@mathiasbynens](https://github.com/mathiasbynens) and his [dotfiles](https://github.com/mathiasbynens/dotfiles)
* [@MarioCatuogno](https://github.com/MarioCatuogno) and his [dotfiles](https://github.com/MarioCatuogno/Clean-macOS)

## <a name="social"></a>My social networks

You can find me on the following social networks:

* **Twitter:** [https://twitter.com/manubermu](https://twitter.com/manubermu)
* **LinkedIn:** [https://www.linkedin.com/in/manuelbermudezmartinez/](https://www.linkedin.com/in/manuelbermudezmartinez/)
* **Website:** [manubermu.com](https://manubermu.com)
* **Mail:** [manubermu@pm.me](manubermu@pm.me)