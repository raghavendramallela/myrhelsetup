sudo dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm && \
sudo dnf copr enable atim/lazygit -y && \
sudo dnf -y update && \
sudo dnf -y install sudo zsh exa git lazygit fd-find wget python3 cargo ripgrep cmake gcc make unzip gettext && \
sudo dnf -y clean all && \
sudo echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers &&  \
sudo useradd -m -G wheel -s /bin/zsh -u 8055 raghu

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
cp ../ubi9-cntnr/.zshrc .
cp zap-prompt.zsh-theme ./.local/share/zap/plugins/zap-prompt/zap-prompt.zsh-theme

## set local timezone 
sudo rm -rf /etc/localtime && \
sudo ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
## build & install neovim-stable frm src
git clone https://github.com/neovim/neovim && \
cd neovim && \
git checkout stable && \
make CMAKE_BUILD_TYPE=RelWithDebInfo && \
sudo make install && \
cd ~ && \
rm -rf neovim && \
## build & install fuzzy finder frm src
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
~/.fzf/install --all && \
## install treesitter via cargo
cargo install tree-sitter-cli