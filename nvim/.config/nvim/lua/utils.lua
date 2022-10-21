local uv = vim.loop

local sep = "/"

local function _path_is_absolute(path)
  if vim.startswith(path, sep) then
    return true
  else
    return false
  end
end

local function _path_explode(path)
  return vim.split(path, sep)
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
  return parts[#parts - 1]
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
  if uv.fs_stat(self.path) then
    return true
  else
    return false
  end
end

return Path
