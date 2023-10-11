default: all

all: move

move:
	@cp -r .config/* ~/.config/ 

uninstall:
	@rm -rf ~/.config/nivm 
	@rm -rf ~/.local/share/nivm 
