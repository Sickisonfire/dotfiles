HOME = os.getenv("HOME")

local o = vim.o
local g = vim.g
local cmd = vim.cmd

cmd([[set path=$PWD/**]])
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.nu = true
o.relativenumber = true
o.hidden = true
o.errorbells = false 
g.noh = true
o.expandtab = true
o.wrap = false 
o.incsearch = true
o.termguicolors = true
o.scrolloff = 8
g.showmode = false 
g.completeopt = {"menuone","noinsert","noselect"}
o.mouse = "nv"
o.swapfile = false 
o.backup = false
o.undodir= HOME .. "/.vim/undodir"
o.undofile = true

o.splitbelow = true
o.splitright = true

g.netrw_preview=1
g.netrw_banner=0

g.onedark_terminal_italics = true
cmd('colorscheme nord')
cmd('hi Normal guibg=none')

