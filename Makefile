# Variables definition
ZSH_CUSTOM = ${HOME}/.oh-my-zsh/custom

default: all

all: uninstall move

install: install-prerequisites install-fonts install-nvim install-tmux-tpm install-fzf install-oh-my-zsh install-powerlevel10k install-oh-my-zsh-plugins install-git-alias

create-dirs:
	@mkdir -p ~/.local/scripts

move: create-dirs
	@cp -r nvim/ ~/.config/
	@sudo cp -r lightdm/* /etc/lightdm/
	@cp -r kitty/ ~/.config/
	@cp -r i3/ ~/.config/
	@cd tmux/ && ls tmux* | grep -v .md | xargs -I{} cp {} ~/.{}
	@cp -r scripts/* ~/.local/scripts
	@sudo cp -r scripts/* /usr/local/bin
	@cd zsh/ && ls zsh* | grep -v project | xargs -I{} cp {} ~/.{}
	@cp zsh/p10k.zsh ~/.p10k.zsh

install-prerequisites:
	@sudo apt-get install -y zsh ripgrep xclip python3-venv flameshot

install-fonts:
	@mkdir -p ~/.fonts
	@cp fonts/* ~/.fonts
	@fc-cache -fv

install-fzf-clone:
	@git clone https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

install-fzf:
	@sudo apt-get install fzf -y

install-oh-my-zsh-plugins:
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

install-oh-my-zsh:
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sh install.sh

install-lightdm:
	sudo apt-get install ligthdm ligthdm-gtk-greeter ligthdm-settings

install-rofi:
	sudo apt-get install rofi
	@mkdir -p ~/.local/share/rofi/
	@mkdir -p ~/.local/share/rofi/themes/
	@git clone https://github.com/lr-tech/rofi-themes-collection.git ~/.local/share/rofi/themes
	rofi-theme-selector

install-i3:
	sudo apt-get install i3 i3-wm i3lock i3lock-fancy xss-lock
	sudo pip install autotiling

install-kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
	sudo ln -sf ~/.local/kitty.app/bin/kitty /usr/bin
	sudo ln -sf ~/.local/kitty.app/bin/kitten /usr/bin
	sudo cp ~/.local/kitty.app/share/applications/kitty* /usr/share/applications/
	sudo sed -i "s|Icon=kitty|Icon=/home/$$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" /usr/share/applications/kitty*.desktop
	sudo sed -i "s|Exec=kitty|Exec=/home/$$USER/.local/kitty.app/bin/kitty|g" /usr/share/applications/kitty*.desktop

install-powerlevel10k:
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k

install-nvim:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	@sudo chmod u+x nvim.appimage
	@sudo mv nvim.appimage /usr/bin/nvim
	@sudo chown root:root /usr/bin/nvim
	@sudo chmod 755 /usr/bin/nvim

install-tmux-tpm:
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install-git-alias:
	@./scripts/git_alias.sh

uninstall:
	@rm -rf ~/.config/nvim
	@rm -rf ~/.local/share/nvim
	@rm -rf ~/.tmux/
	@rm -rf ~/.tmux*
