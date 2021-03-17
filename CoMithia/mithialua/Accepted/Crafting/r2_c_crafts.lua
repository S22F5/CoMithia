r2_c_crafts = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
		
	local options = {"Forget a craft"}
	local menu
	
	player:dialogSeq({npcG, "Hey there, are you an artisan?"}, 1)
	menu = player:menuString("How can I help you?", options)
	if (menu == "Forget a craft") then
		options = r2_c_crafts.learned_crafts(player)
		if (#options > 0) then
			menu = player:menuString("Which craft would you like to forget?", options)
			if (menu == "Tailor") then
				options = {"I will forget my craft", "No, I've worked hard!"}
				menu = player:menuString("Are you SURE you want to FOREVER FORGET "..menu.."ing?", options)
				if (menu == "I will forget my craft") then
					player.registry["professionalTailor"] = 0
					player.registry["tailor"] = 0
					player:removeLegendbyName("tailor")
				else
					player:dialog("Let me know if you change your mind.", {})
				end
			elseif (menu == "Stylist") then
				options = {"I will forget my craft", "No, I've worked hard!"}
				menu = player:menuString("Are you SURE you want to FOREVER FORGET your Stylist skill?", options)
				if (menu == "I will forget my craft") then
					player.registry["professionalStylist"] = 0
					player.registry["stylist"] = 0
					player:removeLegendbyName("stylist")
				else
					player:dialog("Let me know if you change your mind.", {})
				end
			elseif (menu == "Forester") then
				options = {"I will forget my craft", "No, I've worked hard!"}
				menu = player:menuString("Are you SURE you want to FOREVER FORGET Foresting?", options)
				if (menu == "I will forget my craft") then
					player.registry["professionalForester"] = 0
					player.registry["forester"] = 0
					player:removeLegendbyName("forester")
				else
					player:dialog("Let me know if you change your mind.", {})
				end
			elseif (menu == "Smith") then
				options = {"I will forget my craft", "No, I've worked hard!"}
				menu = player:menuString("Are you SURE you want to FOREVER FORGET "..menu.."ing?", options)
				if (menu == "I will forget my craft") then
					player.registry["professionalSmith"] = 0
					player.registry["smith"] = 0
					player:removeLegendbyName("smith")
				else
					player:dialog("Let me know if you change your mind.", {})
				end
			end
		else
			player:dialogSeq({npcG, "There are no crafts left for you to forget."}, 1)
		end
	end
	
end),

learned_crafts = function(player)
	local ret = {}
	if (player.registry["professionalTailor"] > 0 or player.registry["tailor"] > 0) then
		table.insert(ret, "Tailor")
	end
	if (player.registry["professionalStylist"] > 0 or player.registry["stylist"] > 0) then
		table.insert(ret, "Stylist")
	end
	if (player.registry["professionalForester"] > 0 or player.registry["forester"] > 0) then
		table.insert(ret, "Forester")
	end
	if (player.registry["professionalSmith"] > 0 or player.registry["smith"] > 0) then
		table.insert(ret, "Smith")
	end
	return ret
end,

say = function(player, npc)
end,

action = function(npc, player)
end
}