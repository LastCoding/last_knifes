-- Localize & Initialize
local register_knife = knifes.register_knife
local modpath = knifes.modpath
local log_prefix = '['..minetest.get_current_modname()..'] '
local registry = modpath..DIR_DELIM..'registry'


-- Check if a file exists
--
-- This function validates the existence of a file by trying to open the file
-- for reading. If this succeeds the file is present.
--
-- @param file_name The file name (path) to be checked
local file_exists = function (file_name)
    local f = io.open(file_name ,'r')
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end


-- Load built-in support for supported mods
local config = Settings(modpath..DIR_DELIM..'mod.conf')
local depends = config:get('depends')

for modname in depends:gmatch('[0-9a-z_-]+') do
    local registry_file = registry..DIR_DELIM..modname..'.lua'
    if file_exists(registry_file) and minetest.get_modpath(modname) then
        dofile(registry_file)
        local message = 'Loaded built-in '..modname..' support'
        minetest.log('action', log_prefix..message)
    end
end
