r2_c_butcher = {
click = async(function(player,npc)
	local i = 0
	local t = {graphic = convertGraphic(1479, "monster"), color = 0}
	local opts = {"Buy", "Sell"}
	local optsbuy = {}
	local menuOption
	local menuOptionBuy
	local buyitems = {176}
	local sellitems = {4, 1000000600}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 0
	
	if (#opts ~= 0) then
		menuOption = player:menuString("Welcome to my shop, how can I help you?", opts)
		
		if (menuOption == "Buy") then
			player:buyExtend("What would you like to buy?.", buyitems)
		elseif (menuOption == "Sell") then
			player:sellExtend("What do you wish to sell?", sellitems)
		end
	end
end)
}