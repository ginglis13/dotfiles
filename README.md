# dotfiles

This repository contains most if not all of the dotfiles/config files I use on my machine. I keep this up to date w my arch linux machine. Screenshots included below. Configs can mostly be found in the `.config/` dir, with the exception being vim, with `.vim/` containing those files.


### Screenshots

![](./dotfile_screenshots/empty.png)
![](./dotfile_screenshots/sc1.png)

Some things I use:

## vim

Objective, non-controversial statement: vim is the best text editor. I can't use other programs/editors like [vscodium]() without installing a plugin for vim keybindings. vim has increased my productivity since learning to use it, and it still feels like I'm learning a new vim trick every day. You can find my [.vimrc]() in this repository. Plugins I use for vim:

	- [fzf.vim]()
	- [dracula theme]()
	- [supertab]()
	- [syntastic]()
	- [vim-airline]()
	- [vim-fugitive]()
	- [auto-pairs]()
	- [vim-sneak]()
	- [nerdcommenter]()

![](./dotfile_screenshots/vim.png)

## i3

I use [i3-gaps]() as my window manager. I don't think I've changed much to the default config. I've added some custom keybinds and replaced the i3bar with polybar.

## xfce4-terminal

I recently switched over to xfce's terminal from [st](). st was just a bit too much for my needs, and made some things more difficult than they needed to be (i.e., scrolling in the terminal). xfce has already proven to be much more fitting for my use case. I use the [Nord theme for xfce]() with some extra tweaks to the background coloration to fit in with the rest of my overall theme.

## polybar

Most of my changes to polybar are purely aesthetic. I use [Matieral Icons]() instead of the default, and I've changed some coloring up to match the rest of my theme.

## rofi

rofi is a dmenu replacement, and a good one at that. Here's what it looks like with some dracula theming:

![](./dotfile_screenshots/rofi.png)


Again, just some aesthetic changes to fit my theme.

## ranger

I use [ranger]() as my filemanager, a Python project that I have actually contributed to (barely but hey anything counts in open source :smile:). I don't use it particularly often, but it is definitely handy when I need to quickly view an image, gif, or video.

![](./dotfile_screenshots/ranger.png)

## Other cool stuff I use

	- [vlc]() - media player
	- [sxiv]() - image viewer
	- [weechat]() - irc client
	- [i3lock-fancy]() - lockscreen
	- [TerminusBrowser]() - (shameless plug) terminal chatboard client I am a maintainer of!
	- [vscodium]() - ide
	- [yaegi]() - go interactive shell
