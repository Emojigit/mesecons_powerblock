-- The POWER_BLOCK

local mesewire_rules =
{
	{x = 1, y = 0, z = 0},
	{x =-1, y = 0, z = 0},
	{x = 0, y = 1, z = 0},
	{x = 0, y =-1, z = 0},
	{x = 0, y = 0, z = 1},
	{x = 0, y = 0, z =-1},
}


minetest.register_node("mesecons_powerblock:power_block", {
	tiles = {"default_mese_block.png^[brighten"},
	inventory_image = "default_mese_block.png^jeija_power_plant.png",
	is_ground_content = false,
	groups = {cracky = 1},
	light_source = minetest.LIGHT_MAX-9,
    	description="Power Block",
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesewire_rules
	}},
	on_blast = mesecon.on_blastnode,
})

-- The BLINKY_BLOCK
--[[ Buggy

local toggle_timer = function (pos)
	local timer = minetest.get_node_timer(pos)
	if timer:is_started() then
		timer:stop()
	else
		timer:start(mesecon.setting("blinky_plant_interval", 3))
	end
end

local on_timer = function (pos)
	local node = minetest.get_node(pos)
	if(mesecon.flipstate(pos, node) == "on") then
		mesecon.receptor_on(pos)
	else
		mesecon.receptor_off(pos)
	end
	toggle_timer(pos)
end

mesecon.register_node("mesecons_powerblock:blinky_block", {
	description="Blinky Block",
	inventory_image = "default_mese_block.png^jeija_blinky_plant_off.png",
	sounds = default.node_sound_stone_defaults(),
	on_timer = on_timer,
	on_rightclick = toggle_timer,
	on_construct = toggle_timer
},{
	tiles = {"default_mese_block.png"},
	groups = {cracky = 1, level = 2},
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesewire_rules
	}},
},{
	tiles = {"default_mese_block.png^[brighten"},
	groups = {cracky = 1, level = 2,not_in_creative_inventory=1},
	light_source = minetest.LIGHT_MAX-9,
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesewire_rules
	}},
})
]]

