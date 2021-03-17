r2_c_yehru = {
click = async(function(player, npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	local options = {}
	local choice = ""
	local clanCost = 350000
	
	player.dialogType = 0
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	
	if (player.clan == 0) then
		table.insert(options, "Yes")
		table.insert(options, "No")
	else
		async(clan.menu(player, npc))
		--table.insert(options, "Leave Clan")
	end
	
	if (#options > 1) then
		choice = player:menuString("I can help you make a clan, but it will cost you. To forge the paperwork properly I'll need "..clanCost.." gold coins.", options)
	end
	
	if (choice == 1) then
		player:dialogSeq({npcGraphics, "So shall it be."}, 1)
		player.clan = 0
		player:sendStatus()
	elseif (choice == "Yes") then
		local clanName = ""
		
		repeat
			clanName = player:input("What shall you name your clan? There's only enough room for 63 characters!")
		until (string.len(clanName) >= 3 and string.len(clanName) <= 63)
		
		if (player:removeGold(clanCost) == true) then
			player:addClan(clanName)
			player.registry["clan"..player.clan.."leader"] = 250
		end
	elseif (choice == "No") then
		player:dialogSeq({npcGraphics, "I see then, come back when you have the money."}, 1)
	end
end)
}