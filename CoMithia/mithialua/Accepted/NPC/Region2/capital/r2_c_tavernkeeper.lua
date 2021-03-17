r2_c_tavernkeeper = {
click = async(function(player,npc)
	local t = {graphic = convertGraphic(634, "monster"), color = 0}
	local opts = {"Buy", "Sell"}
	local menuOption
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 0
	menuOption = player:menuString("Welcome to my tavern. You could literally swim in the amount of ale I sell.", opts)
	
	if (menuOption == "Buy") then
		player:buyExtend("What do you wish to buy?", {177, 170})
	elseif (menuOption == "Sell") then
		player:sellExtend("What do you wish to sell?", {3})
	end
end)
}