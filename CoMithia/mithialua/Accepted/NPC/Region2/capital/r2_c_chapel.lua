r2_c_chapel = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color	
	player:dialogSeq({npcG, "To bind to another player, both must be present in the room.",
	npcG, "When you're ready say: \n<b>We would like to become\n<b>one.",
	npcG, "To accept just say: \n<b>I do.",
	npcG, "To separate, just say: \n<b>Separate."}, 1)
end),

say = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color	
	local speech = player.speech
	local speech = string.lower(speech)

	if (player.id == npc.registry["spouseB"] and npc.registry["timer"] >= os.time()) then
		if (speech == "i do.") then
			--Union mark
			player:addLegend("Bound to "..Player(npc.registry["spouseA"]).name.."."..curT(), "union", 6, 15)
			Player(npc.registry["spouseA"]):addLegend("Bound to "..Player(npc.registry["spouseB"]).name.."."..curT(), "union", 6, 15)
			player.spouse = Player(npc.registry["spouseA"]).id
			Player(npc.registry["spouseA"]).spouse = player.id
			npc.registry["spouseB"] = 0
			npc.registry["spouseA"] = 0
			npc.registry["timer"] = 0
			npc:talk(0, ""..npc.name..": and now you shall be bound.")
		elseif (speech == "i don't.") then
			npc.registry["spouseB"] = 0
			npc.registry["spouseA"] = 0
			npc.registry["timer"] = 0
			npc:talk(0, ""..npc.name..": Since "..player.name.." didn't accept; I guess there won't be a ceremony...")			
		end
	end
	
	if (speech == "we would like to become one." and npc.registry["timer"] < os.time() and player.spouse == 0) then
		npc.registry["timer"] = os.time() + 30
		local spouseBString = player:input("Who shall be bound by you?")
		local spouseB = Player(""..spouseBString)
		if (player.m == npc.m and spouseB.m == npc.m and spouseB.spouse == 0 and player.name ~= spouseB.name) then
			local options = {"Yes", "No"}
			local menu = player:menu("Are you sure you want to bind to "..spouseB.name.."?", options)
			if (menu == 1) then--Yes
				npc.registry["spouseA"] = player.id
				npc.registry["spouseB"] = spouseB.id
				npc:talk(0, ""..npc.name..": "..spouseB.name..", do you accept to be bound to "..player.name.."?")
			elseif (menu == 2) then--No
				npc.registry["spouseB"] = 0
				npc.registry["spouseA"] = 0
				npc.registry["timer"] = 0
			end
		else
			player:dialogSeq({npcG, "That person can not bind to you."}, 1)
			npc.registry["spouseB"] = 0
			npc.registry["spouseA"] = 0
			npc.registry["timer"] = 0
		end
	end
	
	if (speech == "separate." and player.spouse > 0) then
		local options = {"Yes", "No"}
		local menu = player:menu("Are you sure you want to separate?", options)
		if (menu == 1) then--Yes
			player:removeLegendbyName("union")
			player.spouse = 0
			player:dialogSeq({npcG, "It is done."}, 1)
		elseif (menu == 2) then--No
			npc:talk(0, ""..npc.name..": Don't do it!")
		end
	
	end
end),

action = function(npc)
	if (npc.registry["timer"] < os.time() and npc.registry["timer"] > 0) then
		npc.registry["spouseB"] = 0
		npc.registry["spouseA"] = 0
		npc.registry["timer"] = 0
		npc:talk(0, ""..npc.name..": I guess there won't be a ceremony...")
	end
end

}