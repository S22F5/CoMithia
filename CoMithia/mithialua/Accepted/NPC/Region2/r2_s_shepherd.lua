r2_s_shepherd = {
click = async(function(player,npc)
	local t = {graphic = 0, color = 0}
	local opts = {"Buy"}
	local optsbuy = {"Shears"}
	local menuOption
	local menuOptionBuy

	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 1
	menuOption = player:menuString("How can I help you?", opts)
	
	if (menuOption == "Buy") then
		
			player:buyExtend("What do you wish to buy?", {1000000000})

	end
end)
}