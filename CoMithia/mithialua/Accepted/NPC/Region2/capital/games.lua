games = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0
	local menu
	local options = {}
	
	options = {"Musical Foursquare", "Colors"}
	menu = player:menuString("Which game would you like to play?", options)
	if (menu == "Musical Foursquare") then
		player:warp(7101, math.random(3, 21), math.random(22, 23))
	elseif (menu == "Colors") then
		local warpX = {0,1,15,16}
		player:warp(7102, warpX[math.random(#warpX)], math.random(2,12))
	end
end)
}