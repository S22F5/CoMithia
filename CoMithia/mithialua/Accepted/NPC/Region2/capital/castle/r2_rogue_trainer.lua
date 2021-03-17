r2_rogue_trainer = {
click = async(function(player, npc)
	local t = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 1
	
	if (player.class == 0) then
		table.insert(menuOptions, "About Rogue")
	end
	
	if (player.class == 0 and player.level >= 5) then
		table.insert(menuOptions, "Become a Rogue")
	end
	
	if (player.class == 0 or player.baseClass == 2) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	if (player.class == 2 and player.level >= 25) then
		table.insert(menuOptions, "About Subpaths")
	end	
	
	local choice = player:menuString("How may I assist you, young fledgling?", menuOptions)
	if (choice == "About Rogue") then
		local spells = player:getSpells()
		
		player:dialogSeq({t, "Would you like to test Rogue spells?"}, 1)
		
		for x = 1, #spells do
			if (spells[x] ~= 1 and spells[x] ~= 2 and spells[x] ~= 4) then
				player:removeSpell(spells[x])
			end
		end
		
		if (player:canLearnSpell("cub_trap"))  then
			player:addSpell("cub_trap")
		end
		
		if (player:canLearnSpell("sand_trap"))  then
			player:addSpell("sand_trap")
		end
		
		if (player:canLearnSpell("leech_trap"))  then
			player:addSpell("leech_trap")
		end
		
		if (player:canLearnSpell("hilt_strike"))  then
			player:addSpell("hilt_strike")
		end
		
		if (player:canLearnSpell("file")) then
			player:addSpell("file")
		end
		
		player:flushDuration(1)
		player:sendMinitext("You learn beginner rogue spells.")
	elseif (choice == "Become a Rogue") then
		local spells = player:getSpells()
		
		for x = 1, #spells do
			if (spells[x] ~= 1 and spells[x] ~= 2 and spells[x] ~= 4) then
				player:removeSpell(spells[x])
			end
		end
		
		if (player:canLearnSpell("cub_trap"))  then
			player:addSpell("cub_trap")
		end
		
		if (player:canLearnSpell("sand_trap"))  then
			player:addSpell("sand_trap")
		end
		
		if (player:canLearnSpell("leech_trap"))  then
			player:addSpell("leech_trap")
		end
		
		if (player:canLearnSpell("hilt_strike"))  then
			player:addSpell("hilt_strike")
		end
		
		if (player:canLearnSpell("file")) then
			player:addSpell("file")
		end
		
		player:flushDuration(1)
		player:sendMinitext("You learn beginner rogue spells.")
		player.class = 2
		player:status()
	elseif (choice == "Learn Spell") then
		player:learnSpell()
	elseif (choice == "Forget Spell") then
		player:forgetSpell()
	elseif (choice == "About Subpaths") then
		player:dialogSeq({t, "Ah, yes; Phantoms...\n\nA friend of mine should be able to give you more information.",
		"She's usually around the tavern by east gate.",
		"Wanderers are usually moving from place to place, but I know of one has a hut east of Areci Mesuv."}, 1)
	end
	
	player:calcStat()
end),

action = function(npc, player)

end
}