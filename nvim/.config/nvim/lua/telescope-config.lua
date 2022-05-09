local t = require('telescope')

t.setup({
   pickers = {
    find_files = {theme = 'ivy' }
   }
})
t.load_extension('fzf')
t.load_extension('file_browser')


