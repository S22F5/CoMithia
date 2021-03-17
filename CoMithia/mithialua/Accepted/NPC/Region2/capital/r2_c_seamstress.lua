r2_c_seamstress = {
click = async(function(player,npc)
	local t = {graphic = convertGraphic(1381, "monster"), color = 0}
	local opts = {"Buy"}
	local optsbuy = {"Peasant", "Weapons", "Garbs", "Dresses", "Robes", "Gowns"}
	local menuOption
	local menuOptionBuy

	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 0
	menuOption = player:menuString("Welcome to my shop. How can I help you?", opts)
	
	if (menuOption == "Buy") then
		menuOptionBuy = player:menuString("What kind of object would you like to buy?", optsbuy)
		
		if (menuOptionBuy == "Peasant") then
			player:buyExtend("What do you wish to buy?", {200000000, 200000001})
		elseif (menuOptionBuy == "Weapons") then
			player:buyExtend("What do you wish to buy?", {100000000, 30800000, 31500000, 40800000, 41500000})
		elseif (menuOptionBuy == "Garbs") then
			player:buyExtend("What do you wish to buy?", {190000013, 190000037, 190000061, 190000085, 190000109, 190000133, 190000157})
		elseif (menuOptionBuy == "Dresses") then
			player:buyExtend("What do you wish to buy?", {190000014, 190000038, 190000062, 190000086, 190000110, 190000134, 190000158})
		elseif (menuOptionBuy == "Robes") then
			player:buyExtend("What do you wish to buy?", {190000019, 190000043, 190000067, 190000091, 190000115, 190000139, 190000163})
		elseif (menuOptionBuy == "Gowns") then
			player:buyExtend("What do you wish to buy?", {190000020, 190000044, 190000068, 190000092, 190000116, 190000140, 190000164})
		end
	--elseif (menuOption == "Sell") then
	--	player:sellExtend("What do you wish to sell?", {})
	end
end)
}