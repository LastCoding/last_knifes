-- Init
knifes = {}
knifes.modname = minetest.get_current_modname()
knifes.modpath = minetest.get_modpath(knifes.modname)
knifes.syspath = knifes.modpath..DIR_DELIM..'system'
knifes.translator = minetest.get_translator(knifes.modname)


-- Load mod
dofile(knifes.syspath..DIR_DELIM..'register_knife.lua')
dofile(knifes.syspath..DIR_DELIM..'registry.lua')


-- Clean up
--
knifes.replacements = nil
knifes.syspath = nil
knifes.modpath = nil