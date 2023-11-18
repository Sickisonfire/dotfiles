local o = vim.o
local g = vim.g
local cmd = vim.cmd

-- set hl for global namespace (0)
local set_hl = function(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

-- achieve the same behaviour as: hi! link <from> <to>
local link = function(from, to)
  set_hl(from, {})
  set_hl(from, { default = true, link = to })
end

o.background = "dark"

cmd("hi clear")
g.colors_name = 'darkforest'


local palette = {
  ["white"] = "#F6F9F2",
  ["green"] = "#81F393",
  ["pink"] = "#E49BD0",
  ["yellow"] = "#F4D688",
  ["orange"] = "#FE9878",
  ["red"] = "#C16172",
  ["blue"] = "#85B6E2",
  ["grey"] = "#5F6A5D",
  ["grey-dark"] = "#2E3426",
  ["grey-light"] = "#7E9EA0",
  ["black"] = "#0E0F0E",
  ["cyan"] = "#B0CB9A",
  ["cyan-dark"] = "#6B895D",
  ["bg"] = "#161F14",
}
local NONE = "NONE"

set_hl("Normal", { fg = palette["white"], bg = palette["bg"] })
set_hl("Visual", { bg = palette["grey-dark"] })
set_hl("VisualNOS", { bg = palette["green"] })
set_hl("Comment", { fg = palette["grey-light"], bg = NONE, italic = true })
set_hl("Constant", { fg = palette["orange"], bg = NONE })
set_hl("Character", { fg = palette["yellow"], bg = NONE })
set_hl("String", { fg = palette["yellow"], bg = NONE })
set_hl("Number", { fg = palette["pink"], bg = NONE })
set_hl("Boolean", { fg = palette["pink"], bg = NONE })
set_hl("Float", { fg = palette["pink"], bg = NONE })
set_hl("Identifier", { fg = palette["white"], bg = NONE })
set_hl("Function", { fg = palette["cyan"], bg = NONE })
set_hl("Statement", { fg = palette["green"], bg = NONE })
set_hl("Conditional", { fg = palette["green"], bg = NONE })
set_hl("Repeat", { fg = palette["green"], bg = NONE })
set_hl("Label", { fg = palette["green"], bg = NONE })
set_hl("Operator", { fg = palette["green"], bg = NONE })
set_hl("Keyword", { fg = palette["green"], bg = NONE })
set_hl("Exception", { fg = palette["pink"], bg = NONE })
set_hl("Type", { fg = palette["cyan-dark"], bg = NONE })
set_hl("StorageClass", { fg = palette["cyan-dark"], bg = NONE })
set_hl("Structure", { fg = palette["cyan-dark"], bg = NONE })
set_hl("Typedef", { fg = palette["cyan-dark"], bg = NONE })
set_hl("Special", { fg = palette["grey"], bg = NONE })
set_hl("Delimiter", { fg = palette["orange"], bg = NONE })
set_hl("SpecialComment", { fg = palette["grey-dark"], bg = palette["grey"], bold = true })
set_hl("Underlined", { fg = palette["orange"], bg = NONE })
set_hl("Error", { fg = palette["black"], bg = palette["red"], bold = true })
set_hl("Todo", { fg = palette["black"], bg = palette["cyan"], bold = true })
link("Macro", "PreProc")
link("PreCondit", "PreProc")
link("SpecialChar", "Special")
link("Tag", "Special")
link("Debug", "Special")

set_hl("DiagnosticError", { fg = palette["red"], bg = NONE })
set_hl("DiagnosticWarn", { fg = palette["yellow"], bg = NONE })
set_hl("DiagnosticInfo", { fg = palette["blue"], bg = NONE })
set_hl("DiagnosticHint", { fg = palette["grey-light"], bg = NONE })
set_hl("DiagnosticOk", { fg = palette["green"], bg = NONE })
set_hl("DiagnosticUnderlineError", { fg = palette["red"], bg = NONE, underline = true })
set_hl("DiagnosticUnderlineWarn", { fg = palette["yellow"], bg = NONE, underline = true })
set_hl("DiagnosticUnderlineInfo", { fg = palette["blue"], bg = NONE, underline = true })
set_hl("DiagnosticUnderlineHint", { fg = palette["grey-light"], bg = NONE, underline = true })
set_hl("DiagnosticUnderlineOk", { fg = palette["green"], bg = NONE, underline = true })
set_hl("DiagnosticDeprecated", { sp = palette["red"], strikethrough = true })

link("DiagnosticVirtualTextError", "DiagnosticError")
link("DiagnosticVirtualTextWarn", "DiagnosticWarn")
link("DiagnosticVirtualTextInfo", "DiagnosticInfo")
link("DiagnosticVirtualTextHint", "DiagnosticHint")
link("DiagnosticVirtualTextOk", "DiagnosticOk")
link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingHint", "DiagnosticHint")
link("DiagnosticFloatingOk", "DiagnosticOk")
link("DiagnosticSignError", "DiagnosticError")
link("DiagnosticSignWarn", "DiagnosticWarn")
link("DiagnosticSignInfo", "DiagnosticInfo")
link("DiagnosticSignHint", "DiagnosticHint")
link("DiagnosticSignOk", "DiagnosticOk")
link("DiagnosticUnnecessary", "Comment")


set_hl("Ignore", { fg = palette["black"], bg = palette["grey"] })
set_hl("PreProc", { fg = palette["yellow"], bg = NONE })

set_hl("Conceal", { fg = NONE, bg = NONE })
set_hl("ColorColumn", { fg = palette["grey"], bg = palette["grey-dark"] })
set_hl("Cursor", { fg = NONE, bg = NONE })
set_hl("CursorLine", { fg = NONE, bg = palette["grey-dark"] })
set_hl("QuickFixLine", { fg = palette["white"], bg = palette["grey-dark"] })
set_hl("FoldColumn", { fg = palette["grey-dark"], bg = NONE, bold = true })
set_hl("Folded", { fg = palette["grey"], bg = NONE, bold = true, reverse = true })
set_hl("LineNr", { fg = palette["grey"], bg = NONE })
set_hl("CursorLineNr", { fg = palette["green"], bg = NONE, bold = true })
set_hl("IncSearch", { fg = palette["black"], bg = palette["cyan"], bold = true })
set_hl("MatchParen", { fg = palette["black"], bg = palette["orange"], bold = true })
set_hl("ModeMsg", { fg = palette["green"], bg = NONE, bold = true })
set_hl("NonText", { fg = palette["cyan"], bg = NONE })
set_hl("Pmenu", { fg = palette["black"], bg = palette["cyan-dark"], bold = true })
set_hl("PmenuSbar", { bg = palette["cyan-dark"] })
set_hl("PmenuThumb", { bg = palette["black"] })
set_hl("PmenuSel", { fg = palette["white"], bg = palette["black"], bold = true })
set_hl("SignColumn", { bg = NONE })
set_hl("SpecialKey", { fg = palette["grey"], bg = NONE })
set_hl("WarningMsg", { fg = palette["red"], bg = NONE })
set_hl("SpellBad", { fg = palette["red"], bg = NONE, sp = palette["red"], undercurl = true })
set_hl("SpellCap", { fg = palette["green"], bg = NONE, sp = palette["green"], undercurl = true })
set_hl("SpellLocal", { fg = palette["blue"], bg = NONE, sp = palette["blue"], undercurl = true })
set_hl("SpellRare", { fg = palette["pink"], bg = NONE, sp = palette["pink"], undercurl = true })

-- statusline
set_hl("StatusLine", { fg = palette["white"], bg = palette["grey-dark"] })
set_hl("StatusLineNC", { fg = palette["grey"], bg = palette["bg"] })

-- tabline
set_hl("TabLine", { fg = palette["grey"], bg = palette["grey-dark"] })
set_hl("TabLineFill", { fg = NONE, bg = palette["grey-dark"] })
set_hl("TabLineSel", { fg = palette["bg"], bg = palette["cyan"], bold = true })
set_hl("Title", { fg = palette["cyan-dark"], bg = NONE, bold = true })
link("WildMenu", "TabLineSel")

set_hl("WinSeparator", { fg = palette["grey"], bg = NONE })
set_hl("Directory", { fg = palette["cyan-dark"], bg = NONE })
set_hl("Search", { fg = palette["black"], bg = palette["cyan"], bold = true })
set_hl("CurSearch", { fg = palette["black"], bg = palette["orange"], bold = true })
set_hl("DiffAdd", { fg = palette["green"], bg = NONE })
set_hl("DiffChange", { fg = palette["blue"], bg = NONE })
set_hl("DiffText", { fg = palette["black"], bg = palette["cyan"] })
set_hl("DiffDelete", { fg = palette["red"], bg = NONE })

-- ??
-- hi debugBreakpoint guifg=#90f020 guibg=#00008b gui=reverse cterm=reverse
-- hi debugPC guifg=#90fff0 guibg=#00008b gui=reverse cterm=reverse

link("MoreMsg", "ModeMsg")
link("Question", "ModeMsg")
link("Terminal", "Normal")
link("CursorColumn", "CursorLine")
link("CursorIM", "Cursor")
link("EndOfBuffer", "NonText")
link("ErrorMsg", "Error")
-- link("LineNrAbove", "LineNr")
-- link("LineNrBelow", "LineNr")
link("StatusLineTerm", "StatusLine")
link("StatusLineTermNC", "StatusLineNC")
link("CursorLineFold", "CursorLine")
link("CursorLineSign", "CursorLine")
link("MessageWindow", "PMenu")
link("PopupNotification", "Todo")
link("lCursor", "Cursor")
link("diffAdded", "String")
link("diffRemoved", "WarningMsg")
link("diffOnly", "WarningMsg")
link("diffNoEOL", "WarningMsg")
link("diffIsA", "WarningMsg")
link("diffIdentical", "WarningMsg")
link("diffDiffer", "WarningMsg")
link("diffCommon", "WarningMsg")
link("diffBDiffer", "WarningMsg")
