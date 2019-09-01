-- Register a new knife
--
-- definition = {
--   name = 'Name of the knife',
--   head = {
--       texture = 'head_material_texture.png',
--       opacity = 20
--   },
--   texture = 'knife_texture.png',
--   craft = 'crafting:material',
-- }
--
-- The `name` will be shown as tooltip on hovering the item in the inventory
-- and will be used as it is.
--
-- `head` is a texture table containing two entries. The `texture` entry
-- defines the texture that is used as base for the hammer head texture mask.
-- The `opacity` entry is the opacity value between 0 (fully transparent) and
-- 255 (fully visible) of the embossing effect. When omitting the opacity
-- value, 51.2 will be used.
--
-- To change the mask textture packs need to add `knifes_head_mask.png` with
-- another file. All black pixels will become transparent. To change the
-- embossing effect add `knifes_emboss.png` with transparent backgground. The
-- embossing texture is simply overlayed over the generated head texture.
--
-- Instead of `head` the entry `texture` can be used. This does not auto-create
-- The hammer texture but uses the given texture file as hammer texture. If
-- both `head` and `texture` are given `texture` gets precedence.
--
-- With `craft` the material to craft the knife from is defined. Knifes are
-- crafted all the same with the provided material for x and a stick for s
--
--   [ ][ ][x]
--   [ ][x][ ]
--   [s][ ][ ]
--
-- If for `craft` a table is provided then the mod tries to register the knife
-- with the given table as recipe table. The `output` value gets overwritten
-- by the mod but all other values are taken as they are.
--
-- @param short_id   Unprefixed ID for the new hammer
-- @param definition Definition table as described
-- @see <https://dev.minetest.net/on_use#on_use>
-- @see <https://dev.minetest.net/minetest.register_craft>
-- @return void
knifes.register_knife = function (short_id, definition)
    local autotexture = '(([combine:16x16:-1,1=+s)^((+h^+m)^[makealpha:0,0,0))'
    local knife_id = minetest.get_current_modname()..':'..short_id
    local texture = ''
    local opacity = ''

    if definition.head and not definition.texture then
        texture = autotexture:gsub('+.', {
            ['+s'] = 'default_stick.png',
            ['+h'] = definition.head.texture,
            ['+m'] = 'knifes_head_mask.png'
        })

        opacity = definition.head.opacity or 51.2
        texture = '('..texture..'^(knifes_emboss.png^[opacity:'..opacity..'))'
    end

    if definition.texture then
        texture = definition.texture
    end

    minetest.register_tool(knife_id, {
        description = definition.name,
        inventory_image = texture,
        _knifes = { uses = definition.uses },
        tool_capabilities = {
            full_punch_interval = 0.8,
            damage_groups = {fleshy=8}
        }
    })

    if type(definition.craft) == 'string' then
        minetest.register_craft({
            output = knife_id,
            recipe = {
                { '',              '',               definition.craft },
                { '',              definition.craft, ''               },
                { 'default:stick', '',               ''               }
            }
        })
    elseif type(definition.craft) == 'table' then
        definition.craft['output'] = knife_id
        minetest.register_craft(definition.craft)
    end
end
