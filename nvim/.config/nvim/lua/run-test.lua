---@param opt table
---@return boolean
local function has_args(opt)
  return next(opt.fargs) == nil and false or true
end

---@param args table
---@param ft string
---@return string
local function process_args(args, ft)
  local fts = { rust = "cargo test ", zig = "zig test " }
  return fts[ft] .. args
end

---@param opts table
---@return nil
local function run_test(opts)
  local lang_cmd = { rust = "cargo test", zig = "zig build test" }
  local ft = vim.bo.filetype

  if not lang_cmd[ft] then
    print(ft .. " not supported ")
    return
  end


  ---@type string
  local cmd = has_args(opts) and process_args(opts.args, ft) or lang_cmd[ft]


  vim.api.nvim_get_current_buf()
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_open_win(buf, true, {
    split = 'below',
    height = 15,
  })
  vim.fn.termopen(cmd)
end

vim.api.nvim_create_user_command('Test', run_test, { nargs = "*" })
