-- Localize
local register_knife = knifes.register_knife
local S = knifes.translator


register_knife('knife_bronze', {
    name = S('Bronze Knife'),
    head = {
        texture = 'default_bronze_block.png',
    },
    craft = 'default:bronze_ingot',
    uses = 150
})

register_knife('knife_diamond', {
    name = S('Diamond Knife'),
    head = {
        texture = 'default_diamond_block.png',
        opacity = 120
    },
    craft = 'default:diamond',
    uses = 300
})

register_knife('knife_gold', {
    name = S('Golden Knife'),
    head = {
        texture = 'default_gold_block.png',
    },
    craft = 'default:gold_ingot',
    uses = 100
})

register_knife('knife_mese', {
    name = S('Mese Knife'),
    head = {
        texture = 'default_mese_block.png',
    },
    craft = 'default:mese_crystal',
    uses = 350
})

register_knife('knife_obsidian', {
    name = S('Obsidian Knife'),
    head = {
        texture = 'default_obsidian_block.png',
        opacity = 25
    },
    craft = 'default:obsidian_shard',
    uses = 400
})

register_knife('knife_steel', {
    name = S('Steel Knife'),
    head = {
        texture = 'default_steel_block.png',
    },
    craft = 'default:steel_ingot',
    uses = 200
})

register_knife('knife_stone', {
    name = S('Stone Knife'),
    head = {
        texture = 'default_stone.png',
    },
    craft = 'default:cobble',
    uses = 70
})

register_knife('knife_wood', {
    name = S('Wooden Knife'),
    head = {
        texture = 'default_wood.png',
    },
    craft = 'default:wood',
    uses = 30
})
