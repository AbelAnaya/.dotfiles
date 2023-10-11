default: all

all: uninstall move

install: install-nvim install-tpm install-fzf

move:
	@cp -r .config/* ~/.config/ 
	@cp -r tmux/.tmux* ~/
	@cp -r bin/.local/* ~/.local/

install-fzf:
	@sudo apt-get install fzf -y

install-nvim:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	@sudo chmod u+x nvim.appimage
	@sudo mv nvim.appimage /usr/bin/nvim

install-tmux-tpm:
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install-cht-sht:
	@git clone https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-cht.sh

uninstall:
	@rm -rf ~/.config/nvim 
	@rm -rf ~/.local/share/nvim 
