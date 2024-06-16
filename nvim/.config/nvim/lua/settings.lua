HOME = os.getenv("HOME")

local o = vim.o
local g = vim.g
local cmd = vim.cmd

cmd([[set path=$PWD/**]])
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.tw = 80
o.nu = false
o.relativenumber = true
o.hidden = true
o.errorbells = false
o.hlsearch = false
o.expandtab = true
o.wrap = false
o.incsearch = true
o.termguicolors = true
o.scrolloff = 8
g.showmode = false
g.completeopt = { "menuone", "noinsert", "noselect" }
o.mouse = "nv"
o.swapfile = false
o.backup = false
o.undodir = HOME .. "/.vim/undodir"
o.undofile = true
o.cursorline = true

o.splitbelow = true
o.splitright = true

g.netrw_banner = false
g.do_filetype_lua = true

o.conceallevel = 1
cmd('colorscheme darkforest')
cmd('hi Normal guibg=NONE')
cmd('hi cursorline guibg=NONE')
cmd('hi SignColumn guibg=none')
cmd('set laststatus=3')
cmd('set scl=yes')

--- lsp shader glsl
cmd('au BufEnter *frag set filetype=glsl')

g.coq_settings = {
  auto_start = 'shut-up',
  ["display.pum.fast_close"] = false,
}
