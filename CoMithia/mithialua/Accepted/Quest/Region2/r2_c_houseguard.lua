r2_c_houseguard = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local options = {}
	local menu
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.quest["masterOfDeception"] == 6) then
		--[[if (player:hasDuration("copycat") == true) then
			menu = player:input("...?")
			if (string.lower(menu) == "nomi") then]]--
				player:warp(6003, 12, 13)
			--[[end
		end]]--
	end
end)
}