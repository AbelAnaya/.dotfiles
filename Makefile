default: all

all: uninstall move

install: install-nvim install-tmux-tpm install-fzf install-oh-my-zsh install-powerlevel10k install-oh-my-zsh-plugins

move:
	@cp -r config/* ~/.config/ 
	@cd tmux/ && ls tmux* | grep -v .md | xargs -I{} cp {} ~/.{}
	@cp -r scripts/* ~/.local/scripts
	@cd zsh/ && ls zsh* | xargs -I{} cp {} ~/.{}
	@cp zsh/p10k.zsh ~/.p10k.zsh

install-fzf:
	@sudo apt-get install fzf -y

install-oh-my-zsh-plugins:
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

install-oh-my-zsh:
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sh install.sh

install-powerlevel10k:
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
	echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

install-nvim:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	@sudo chmod u+x nvim.appimage
	@sudo mv nvim.appimage /usr/bin/nvim

install-tmux-tpm:
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

uninstall:
	@rm -rf ~/.config/nvim 
	@rm -rf ~/.local/share/nvim 
	@rm -rf ~/.tmux/
	@rm -rf ~/.tmux*
