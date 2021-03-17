r2_c_fiona = {
click = async(function(player, npc)
	local options = {"Buy", "Sell"}
	local choice
	local buyItems = {50000, 50001}
	local sellItems = {50000, 50001}
	
	player.dialogType = 1
	player.lastClick = npc.ID
	
	if (#options ~= 0) then
		choice = player:menuString("Welcome to my shop, how can I help you?", options)
		
		if (choice == "Buy") then
			player:buyExtend("What would you like to buy?.", buyItems)
		elseif (choice == "Sell") then
			player:sellExtend("What do you wish to sell?", sellItems)
		end
	end
end),

say = function(player, npc)
	local speech = string.lower(player.speech)
	local item
	local number
	
	if (string.sub(speech, 1, 6) == "i buy " and (string.sub(speech, 7, 10) == "comb" or string.sub(speech, 7, 14) == "scissors")) then
		item = Item(string.sub(speech, 7, 10))
		
		if (item == nil) then
			item = Item(string.sub(speech, 7, 14))
		end
		
		if (item ~= nil) then
			number = tonumber(string.match(speech, "i buy "..string.lower(item.name).." number (%d+)"))
			
			if (number == nil) then
				number = 1
			end
			
			if (player:removeGold(item.price * number) == true) then
				player:addItem(item.yname, number)
				npc:talk(0, "Fiona: I sold you "..number.." "..item.name.." for "..(item.price * number).." gold.")
			end
		end
	end
end
}