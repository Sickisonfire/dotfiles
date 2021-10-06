# Dotfiles

Repo for my Dotfiles.  
WM is i3 with polybar and rofi.
Files are managed with a symlink manager called stow.  
`man stow` for more info on stow or checkout ThePrimegean's [video](https://www.youtube.com/watch?v=tkUllCAGs3c) about it.  


## Packages
- **i3-gaps-rounded** -> wm
- **polybar** -> statusbar
- **picom** -> transparency and transitions
- **rofi** -> application launcher
- **kitty** -> terminal
- **zsh** -> shell
- **tmux** -> terminal multiplexer
- **nvim** -> editor
- **feh** -> for wallpaper
- **stow** -> symlink manager for my dotfiles
- **flameshot** -> screenshots

## Install

1. Install all required packages and stow.  
2. `git clone https://github.com/Sickisonfire/dotfiles.git ~/.dotfiles && cd ~/.dotfiles`
- **Important:** the folder must be at *~/* for stow to work.
- folder name is not important. 
3. `stow <name of subfolder>` for everything subfolder you need.  
- example: `stow i3` generates symlink at *~/.config/i3/config* for i3 config file
- Stow will generate a symlink for all files at the correct location.  
- The .dotfiles Folder is the source of all dotfiles now. Changes have to be made to files in this folder.  
    
Stuff can also be installed partially. Just stow what you need.  

## Keybinds

### i3

Most keybinds are the default keybinds.
|key|function|
|---|-|
|<kbd>win</kbd>| mod key|
|<kbd>Print</kbd>|screenshot|
|<kbd>mod</kbd>+<kbd>o</kbd>| application launcher|
|<kbd>mod</kbd>+<kbd>h,j,k,l</kbd>| focus window|
|<kbd>mod</kbd>+<kbd>Shift</kbd><kbd>h,j,k,l</kbd>|move window|
|<kbd>mod</kbd>+<kbd>1-9</kbd>|change workspace|
|<kbd>mod</kbd>+<kbd>Shift</kbd><kbd>1-9</kbd>|move window to workspace|
|<kbd>mod</kbd>+<kbd>v</kbd>| split vertical|
|<kbd>mod</kbd>+<kbd>Shift</kbd><kbd>v</kbd>|split horizontal|
|<kbd>mod</kbd>+<kbd>Shift</kbd><kbd>c</kbd>|reload i3 config|
|<kbd>mod</kbd>+<kbd>Shift</kbd><kbd>r</kbd>|restart i3|
|<kbd>mod</kbd>+<kbd>Shift</kbd><kbd>e</kbd>|exit i3|

### tmux
Tmux keybinds are default i believe.  
|key|function|
|---|-|
|<kbd>Ctrl</kbd>+<kbd>b</kbd>|prefix|
|<kbd>prefix</kbd>+<kbd>r</kbd>|reload tmux config|
|<kbd>prefix</kbd>+<kbd>h,j,k,l</kbd>| focus pane|

### nvim 
Check init.vim for keybinds.

## Todo
- [ ] add install script
- [ ] fonts
- [ ] custom scripts  


