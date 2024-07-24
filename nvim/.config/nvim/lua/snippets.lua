local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.setup({
  -- ext_base_prio = 300,
  -- enable_autosnippets = true,
  -- store_selection_keys = "<Tab>",
  -- luasnip uses this function to get the currently active filetype. This
  -- is the (rather uninteresting) default, but it's possible to use
  -- eg. treesitter for getting the current filetype by setting ft_func to
  -- require("luasnip.extras.filetype_functions").from_cursor (requires
  -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
  -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
  ft_func = function()
    return vim.split(vim.bo.filetype, ".", { plain = true })
  end,
})

ls.add_snippets("zig", {
  s("print", {
    t('std.debug.print("{}",.{'),
    i(0),
    t('});'),
  })
}, { key = "zig" })


-- require("luasnip.loaders.from_lua").lazy_load({ include = { "all", "cpp" } })
