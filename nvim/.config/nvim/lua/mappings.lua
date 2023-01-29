local keymap = vim.keymap

vim.g.mapleader = " "

--exit insert mode aka spam kj
-- bad habit
-- keymap.set('i', 'jj', '<ESC>')
-- keymap.set('i', 'jk', '<ESC>')
-- keymap.set('i', 'kj', '<ESC>')

-- yank to eol
keymap.set('n', 'Y', 'y$', { noremap = true })

--keep selected line centered
keymap.set('n', 'n', 'nzzzv', { noremap = true })
keymap.set('n', 'N', 'Nzzzv', { noremap = true })
keymap.set('n', 'J', 'mzJ`z', { noremap = true })

-- keep things centered while moving
keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
keymap.set('n', 'n', 'nzz', { noremap = true })
keymap.set('n', 'N', 'Nzz', { noremap = true })

--" better undo
keymap.set('i', ',', ',<C-g>u', { noremap = true })
keymap.set('i', '.', '.<C-g>u', { noremap = true })
keymap.set('i', '!', '!<C-g>u', { noremap = true })
keymap.set('i', '?', '?<C-g>u', { noremap = true })

--" moving lines
keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
keymap.set('v', 'K', ':m \'>-2<CR>gv=gv', { noremap = true })
--keymap.set('n', '<leader>k', '<cmd>m .-2<CR>==', {noremap = true})
--keymap.set('n', '<leader>j', '<cmd>m .+1<CR>==', {noremap = true})

--"copy to clipboard
keymap.set('v', '<C-c>', '\"+y', { noremap = true })

--"replace word under cursor ( . to do it again)
keymap.set('n', 'cn', '*``cgn', { noremap = true })
keymap.set('n', 'cN', '*``cgN', { noremap = true })

keymap.set('n', '<leader>nf', '<cmd>NewFile<CR>', { noremap = true })

keymap.set('n', '<leader>a', 'ggVG<CR>', { noremap = true })
keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>')
--keymap.set('n', '<leader>e', '<cmd>Lexplore! 20<CR>')
keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true })
keymap.set('n', '<leader>x', '<cmd>x<CR>', { noremap = true })
keymap.set('n', '<leader>q', '<cmd>q<CR>', { noremap = true })

-- Telescope
keymap.set('n', '<leader>e', '<cmd>Telescope file_browser<CR>')
keymap.set('n', '<leader>ce', '<cmd>Telescope file_browser path=%:p:h<CR>')
keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<CR>')
keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<CR>')
keymap.set('n', '<C-p>', '<cmd>Telescope find_files<CR>')
keymap.set('n', '<leader>ps',
  function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ") }) end)


keymap.set('n', '<leader>tt', '<cmd>Lspsaga toggle_floaterm<CR>')
keymap.set('t', '<leader>tt', '<C-\\><C-n><cmd>Lspsaga toggle_floaterm<CR>')
keymap.set('t', '<leader>tt', '<C-\\><C-n><CR>')

--"copy paste
keymap.set('v', '<leader>c', '\"+y<CR>', { noremap = true })
keymap.set('n', '<leader>v', '\"+p<CR>', { noremap = true })


--    " window management
keymap.set('n', '<leader>tn', '<cmd>tabnext<CR>')
keymap.set('n', '<leader>tp', '<cmd>tabprevious<CR>')
keymap.set('n', '<leader>h', '<cmd>wincmd h<CR>', { noremap = true })
keymap.set('n', '<leader>j', '<cmd>wincmd j<CR>', { noremap = true })
keymap.set('n', '<leader>k', '<cmd>wincmd k<CR>', { noremap = true })
keymap.set('n', '<leader>l', '<cmd>wincmd l<CR>', { noremap = true })
keymap.set('n', '<leader>nvs', '<cmd>vsplit<CR>')
keymap.set('n', '<leader>ns', '<cmd>split<CR>')
keymap.set('n', '<leader>=', '<cmd>resize +10<CR>')
keymap.set('n', '<leader>-', '<cmd>resize -10<CR>')
keymap.set('n', '<leader>.', '<cmd>vert resize +10<CR>')
keymap.set('n', '<leader>,', '<cmd>vert resize -10<CR>')

--    "source this file
keymap.set('n', '<leader>soc', '<cmd>source %<CR>')
keymap.set('n', '<leader>so', '<cmd>source $MYVIMRC<CR>')
keymap.set('n', '<leader>se', '<cmd>tabnew $MYVIMRC<CR>')

keymap.set('n', '<leader>ok', 'r<C-K>OK<CR>', { noremap = true })

-- debugging DAP
keymap.set('n', '<F5>', function() require 'dap'.continue() end)
keymap.set('n', '<F10>', function() require 'dap'.step_over() end)
keymap.set('n', '<F11>', function() require 'dap'.step_into() end)
keymap.set('n', '<F12>', function() require 'dap'.step_out() end)
keymap.set('n', '<leader>b', function() require 'dap'.toggle_breakpoint() end)
keymap.set('n', '<leader>B', function() require 'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: ')) end)
keymap.set('n', '<leader>dlp', function() require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point Message: ')) end)
keymap.set('n', '<leader>dr', function() require 'dap'.repl.toggle() end)
keymap.set('n', '<leader>dcb', function() require 'dap'.clear_breakpoints() end)
keymap.set('n', '<leader>dui', function() require 'dapui'.toggle() end)
