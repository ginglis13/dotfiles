# dotfiles

This repository contains most if not all of the dotfiles/config files I use on my machine. Screenshots included below. Configs can mostly be found in the `.config/` dir, with the exception being vim, with `.vim/` containing those files.


### Screenshots

![](./.dotfile_screenshots/empty.png?raw=true)
![](./.dotfile_screenshots/sc1.png?raw=true)

Some things I use:

## vim

Objective, non-controversial statement: vim is the best text editor. I can't use other programs/editors like [vscodium](https://github.com/VSCodium/vscodium) without installing a plugin for vim keybindings. vim has increased my productivity since learning to use it, and it still feels like I'm learning a new vim trick every day. You can find my [.vimrc](https://github.com/ginglis13/dotfiles/blob/master/.vim/.vimrc) in this repository. Plugins I use for vim:

- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [dracula theme](https://github.com/dracula/vim)
- [supertab](https://github.com/ervandew/supertab)
- [syntastic](https://github.com/vim-syntastic/syntastic)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)

I typically use [VimAwesome](https://vimawesome.com/) to find new plugins. Most of the plugins I use today were either recommended by friends who found them on this site, or I found them myself on this site.

![](./.dotfile_screenshots/vim.png?raw=true)

## i3

I use [i3-gaps](https://github.com/Airblader/i3) as my window manager. I don't think I've changed much to the default config. I've added some custom keybinds and replaced the i3bar with polybar.

## xfce4-terminal

I recently switched over to xfce's terminal from [st](https://st.suckless.org/). st was just a bit too much for my needs, and made some things more difficult than they needed to be (i.e., scrolling in the terminal). xfce has already proven to be much more fitting for my use case. I use the [Nord theme for xfce-terminal](https://github.com/arcticicestudio/nord-xfce-terminal) with some extra tweaks to the background coloration to fit in with the rest of my overall theme.

## polybar

Most of my changes to polybar are purely aesthetic. I use [Material Icons](https://material.io/resources/icons/?style=baseline) instead of the default, and I've changed some coloring up to match the rest of my theme.

## rofi

[rofi](https://github.com/davatorium/rofi) is a dmenu replacement, and a good one at that. Here's what it looks like with some dracula theming:

![](./.dotfile_screenshots/rofi.png?raw=true)

Again, just some aesthetic changes to fit my theme.

I use [rofimoji](https://github.com/fdw/rofimoji) so I can more easily copy-paste emojis or insert them in text. Having come from macOS, this is more or less a replacement to the `Ctrl-Cmd-Space` keybind for pulling up the emoji keyboard.


## ranger

I use [ranger](https://github.com/ranger/ranger) as my filemanager, a Python project that I have actually contributed to (barely but hey anything counts in open source :smile:). I don't use it particularly often, but it is definitely handy when I need to quickly view an image, gif, or video. Gotta love those vim keybindings, they make everything better.

![](./.dotfile_screenshots/ranger.png?raw=true)

## Other cool stuff I use

- [vlc](https://www.videolan.org/vlc/index.html) - media player
- [sxiv](https://github.com/muennich/sxiv) - image viewer
- [weechat](https://weechat.org/) - irc client
- [i3lock-fancy](https://github.com/meskarune/i3lock-fancy) - lockscreen
- [TerminusBrowser](https://github.com/wtheisen/TerminusBrowser) - (shameless plug) terminal chatboard client I am a maintainer of!
- [vscodium](https://github.com/VSCodium/vscodium) - ide (in the rare cases I don't use vim)
- [yaegi](https://github.com/containous/yaegi) - go interactive shell
