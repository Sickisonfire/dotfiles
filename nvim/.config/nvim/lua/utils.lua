local uv = vim.loop

local utils = {}

function utils.clear_cmd_line()
  vim.api.nvim_cmd({ cmd = 'echon', args = { '"\r\r"' } }, {})
  vim.api.nvim_cmd({ cmd = 'echon', args = { '" "' } }, {})
end

function utils.get_sep()
  if string.match(uv.os_uname().sysname, "win") then
    return "\\"
  else
    return "/"
  end
end

local function _path_is_absolute(path)
  if vim.startswith(path, utils.get_sep()) then
    return true
  else
    return false
  end
end

local function _path_explode(path)
  local parts = vim.split(path, utils.get_sep(), { trimempty = true })

  if _path_is_absolute(path) then
    table.insert(parts, 1, utils.get_sep())
  end

  return parts
end

local function _path_is_dir(path)
  local stat = uv.fs_stat(path)
  if not stat then
    return false
  end
  if stat.type == 'directory' then
    return true
  else
    return false
  end
end

local function _path_get_parent(parts)
  local parent = ''
  for i = 1, #parts - 1, 1 do
    if i > 1 then
      parent = parent .. utils.get_sep() .. parts[i]
    end
  end

  return parent
end

local Path = {}

function Path:new(path_obj, path)
  path_obj = path_obj or {}

  setmetatable(path_obj, self)
  self.__index = self

  self.path = path

  self.is_absolute = _path_is_absolute(self.path)
  self.parts = _path_explode(self.path)
  self.name = self.parts[#self.parts]
  self.is_dir = _path_is_dir(self.path)
  self.parent = _path_get_parent(self.parts)

  return path_obj
end

function Path:exists()
  if uv.fs_access(self.path, 0) then
    return true
  else
    return false
  end
end

function Path:create(opts)
  opts = opts or {}

  local filepath = self.path
  if self:exists() then
    error('ERROR: could not create file "' .. self.name .. '". File does already exist.')
  else
    local parent = Path:new(nil, self.parent)
    if not parent:exists() then
      vim.fn.mkdir(parent.path, "p")
    end

    vim.api.nvim_cmd({ cmd = 'e', args = { filepath } }, {})
  end
end

utils.Path = Path

return utils
