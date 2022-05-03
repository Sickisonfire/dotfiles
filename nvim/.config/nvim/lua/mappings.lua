local keymap = vim. keymap

vim.g.mapleader = " "

--exit insert mode aka spam kj
keymap.set('i', 'jj', '<ESC>')
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'kj', '<ESC>')

-- yank to eol
keymap.set('n', 'Y', 'y$', { noremap = true })

--keep selected line centered
keymap.set('n', 'n', 'nzzzv', {noremap=true})
keymap.set('n', 'N', 'Nzzzv', {noremap=true})
keymap.set('n', 'J', 'mzJ`z', {noremap=true})

--" better undo
keymap.set('i', ',', ',<C-g>u', {noremap = true})
keymap.set('i', '.', '.<C-g>u', {noremap = true})
keymap.set('i', '!', '!<C-g>u', {noremap = true})
keymap.set('i', '?', '?<C-g>u', {noremap = true})

--" moving lines
keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
keymap.set('v', 'K', ':m \'>-2<CR>gv=gv', {noremap = true})
--keymap.set('n', '<leader>k', ':m .-2<CR>==', {noremap = true})
--keymap.set('n', '<leader>j', ':m .+1<CR>==', {noremap = true})

--"copy to clipboard
keymap.set('v','<C-c>', '\"+y', {noremap = true})

--"replace word under cursor ( . to do it again)
keymap.set('n', 'cn', 'cn *``cgn', {noremap = true})
keymap.set('n', 'cN', 'cN *``cgN', {noremap = true})

keymap.set('n', '<leader>a', 'ggVG<CR>', {noremap = true})
keymap.set('n', '<leader>u', ':UndotreeToggle<CR>')
keymap.set('n', '<leader>e', ':Lexplore! 20<CR>')
keymap.set('n', '<leader>w', ':w<CR>', {noremap = true})
keymap.set('n', '<leader>x', ':x<CR>', {noremap = true})
keymap.set('n', '<leader>q', ':q<CR>', {noremap = true})

--"copy paste
keymap.set('v', '<leader>c', '\"+y<CR>', {noremap = true})
keymap.set('n', '<leader>v', '\"+p<CR>', {noremap = true})

keymap.set('n', '<C-p>', ':Telescope find_files<CR>')
keymap.set('n', '<leader>ps', function() require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > " )})end)

--    " window management
keymap.set('n', '<leader>tn', ':tabnext<CR>')
keymap.set('n', '<leader>tp', ':tabprevious<CR>')
keymap.set('n', '<leader>h', ':wincmd h<CR>', {noremap = true})
keymap.set('n', '<leader>j', ':wincmd j<CR>', {noremap = true})
keymap.set('n', '<leader>k', ':wincmd k<CR>', {noremap = true})
keymap.set('n', '<leader>l', ':wincmd l<CR>', {noremap = true})
keymap.set('n', '<leader>l', ':wincmd l<CR>', {noremap = true})
keymap.set('n', '<leader>nvs', ':vsplit<CR>')
keymap.set('n', '<leader>ns', ':split<CR>')
keymap.set('n', '<leader>=', ':resize +10<CR>')
keymap.set('n', '<leader>-', ':resize -10<CR>')
keymap.set('n', '<leader>.', ':vert resize +10<CR>')
keymap.set('n', '<leader>,', ':vert resize -10<CR>')

--    "source this file
keymap.set('n', '<leader>so', ':source ~/.config/nvim/init.lua<CR>')
keymap.set('n', '<leader>se', ':tabnew ~/.config/nvim/init.lua<CR>')
