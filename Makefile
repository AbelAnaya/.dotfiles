# Variables definition
ZSH_CUSTOM = ${HOME}/.oh-my-zsh/custom

default: all

all: uninstall move

install: install-prerequisites install-kitty install-nvim install-tmux install-tmux-tpm install-fzf install-oh-my-zsh install-powerlevel10k install-oh-my-zsh-plugins install-git-alias

create-dirs:
	@sudo mkdir -p /etc/lightdm
	@mkdir -p ~/.config/polybar
	@mkdir -p ~/.local/scripts
	@mkdir -p ~/.fonts
	@mkdir -p ~/.local/share/rofi/
	@mkdir -p ~/.local/share/rofi/themes/

move: create-dirs move-fonts
	@cp -r nvim/ ~/.config/
	@sudo cp -r lightdm/* /etc/lightdm/
	@cp -r kitty/ ~/.config/
	@cp -r i3/ ~/.config/
	@cd tmux/ && ls tmux* | grep -v .md | xargs -I{} cp {} ~/.{}
	@cp -r scripts/* ~/.local/scripts
	@sudo cp -r scripts/* /usr/local/bin
	@cd zsh/ && ls zsh* | grep -v project | xargs -I{} cp {} ~/.{}
	@cp zsh/p10k.zsh ~/.p10k.zsh
	@cp -r polybar/ ~/.config/

install-prerequisites:
	@sudo apt-get install -y zsh ripgrep xclip python3 pip python3-venv flameshot curl npm fuse pavucontrol net-tools network-manager network-manager-gnome xbacklight

install-nitrogen:
	@sudo apt-get install nitrogen

install-polybar:
	@sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libcurl4-openssl-dev libmpdclient-dev libiw-dev libpulse-dev libjsoncpp-dev libnl-genl-3-dev libcurlpp-dev libxcb-image0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev wireless-tools
	@git clone https://github.com/polybar/polybar.git ~/polybar

move-fonts:
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
	@sudo apt-get install lightdm lightdm-gtk-greeter lightdm-settings

install-rofi:
	sudo apt-get install rofi
	@git clone https://github.com/lr-tech/rofi-themes-collection.git ~/.local/share/rofi/themes
	rofi-theme-selector

install-i3:
	@/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
	@sudo apt install ./keyring.deb
	echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
	@sudo apt update
	@sudo apt install i3 i3-wm i3lock i3lock-fancy xss-lock
	@pip install autotiling

install-kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
	sudo ln -sf ~/.local/kitty.app/bin/kitty /usr/bin
	sudo ln -sf ~/.local/kitty.app/bin/kitten /usr/bin
	sudo cp ~/.local/kitty.app/share/applications/kitty* /usr/share/applications/
	sudo sed -i "s|Icon=kitty|Icon=/home/$$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" /usr/share/applications/kitty*.desktop
	sudo sed -i "s|Exec=kitty|Exec=/home/$$USER/.local/kitty.app/bin/kitty|g" /usr/share/applications/kitty*.desktop

install-nodejs:
	@curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | zsh
	@nvm install --lts
	@nvm use --lts
	@sudo apt-get purge nodejs
	@sudo apt-get autoremove

install-powerlevel10k:
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k

install-nvim:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	@sudo chmod u+x nvim.appimage
	@sudo mv nvim.appimage /usr/bin/nvim
	@sudo chown root:root /usr/bin/nvim
	@sudo chmod 755 /usr/bin/nvim

install-tmux:
	@apt-get install tmux

install-tmux-tpm:
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install-git-alias:
	@./scripts/git_alias.sh

uninstall:
	@rm -rf ~/.config/nvim
	@rm -rf ~/.local/share/nvim
	@rm -rf ~/.tmux/
	@rm -rf ~/.tmux*
