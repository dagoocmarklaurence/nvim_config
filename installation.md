Install from start of neovim in windows. OS (Win 11 Home)

1.) Customize first your terminal or you can download other terminal from ms store.
	-I prefer the default Windows Terminal and just change the opacity and fonts and cursor color.
	-Fonts: go to nerdfonts website and download your prefer font (JetBrainsMono)

2.) Go to neovim website to get documention on how to install neovim.
	-using winget
	-command: winget install Neovim.Neovim

3.) After install neovim. Install other needed item.
	- C compiler like: "cc", "gcc", "clang", "cl", "zig"
	- I installed zig using winget.
	- Install node, it is needed in mson when installing other plugins like (prettier, etc..)

4.) After installation of c compiler and node, clone the lua config.
	- go to your .\AppData\Local\
	- create a folder name "nvim"
	- paste the copied/extracted file from this repo.

5.) Then open neovim. It will first download all the file needed in your config.

6.) Enjoy using neovim
