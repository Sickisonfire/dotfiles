local utils = require("utils")

local create_new_file = function(args)
  -- TODO
  -- implement compnent flag to specificly generate components
  -- could be called with :NewFile "component"
  -- makes you just enter component name

  local cwd = vim.fn.getcwd()
  local sep = utils.get_sep()

  local cwd_with_sep = cwd .. sep
  local file = vim.fn.input('', cwd_with_sep, 'file')
  utils.clear_cmd_line()

  if not (cwd_with_sep == file or file == "") then
    local p = utils.Path:new(nil, file)
    p:create({ recursive = true })
  else
    print('no file entered')
  end
end

vim.api.nvim_create_user_command('NewFile', create_new_file, {})
