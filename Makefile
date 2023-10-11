default: all

all: uninstall move

move:
	@cp -r .config/* ~/.config/ 

uninstall:
	@rm -rf ~/.config/nvim 
	@rm -rf ~/.local/share/nvim 
