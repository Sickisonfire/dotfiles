local function create_new_file()

  local cwd = vim.fn.getcwd()

  local file = vim.fn.input("where:", cwd .. "/", "file")

  vim.api.nvim_command("e " .. file)

end

vim.api.nvim_create_user_command("NewFile", create_new_file, {})
