#!/usr/bin/env bash
set -e

declare -a reqs

if [ "$(uname)" == "Darwin" ]; then
    plat='osx'
    installer='brew install '
    reqs=( 'zsh:zsh'
           'nvim:neovim')
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    plat='linux'
    installer='sudo pacman -Sy '
    reqs=( 'zsh:zsh'
           'nvim:neovim'
           'neomutt:neomutt'
           'tmux:tmux'
           'lynx:lynx'
           'w3m:w3m')
fi

printf "We're about to set up a new $plat system.\nTHIS SHOULD ONLY BE RUN ONCE PER HOST!!!\n\n"

read -p "Do you want to continue? (yN) " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    printf "Bye Bye!"
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

printf "Let's check if we have everything we need...\n"

if [[ "$plat" == "osx" ]]; then
    if ! hash brew 2>/dev/null; then
        printf "Brew missing. Let's install it\n"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
fi

declare -a toinstall
for req in "${reqs[@]}" ; do
    KEY="${req%%:*}"
    VALUE="${req#*:}"
    if hash $KEY 2>/dev/null; then
        printf "$KEY: ok\n"
    else
        printf "$KEY: nope\n"
        toinstall+=($VALUE)
    fi
done
if [[ -n $toinstall ]]; then
    instcmd=$(printf " %s" "${toinstall[@]}")
    instcmd=${instcmd:1}
    printf "We have to install these: $instcmd\n"
    $installer $instcmd
else
    printf "All requirements installed!\n"
fi

if [ -d ~/.oh-my-zsh ]; then
    printf "Oh-my-zsh: ok\n"
else
	printf "Oh-my-zsh: nope. Let's install it!\n"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ -d ~/.tmux/plugins/tpm ]; then
	printf "tmux TPM: ok\n"
else
	printf "tmux TPM: nope. Let's install it!\n"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

printf "Let's install neovim's plugins\n"
nvim +PlugInstall +qall

printf "\n\nWe're now ready to install dotfiles.\n"

./install
