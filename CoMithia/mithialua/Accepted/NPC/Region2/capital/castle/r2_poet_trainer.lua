r2_poet_trainer = {
click = async(function(player, npc)
	local t = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 1
	
	if (player.class == 0) then
		table.insert(menuOptions, "About Poet")
	end
	
	if (player.class == 0 and player.level >= 5) then
		table.insert(menuOptions, "Become a Poet")
	end
	
	if (player.class == 0 or player.baseClass == 4) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	if (player.class == 4 and player.level >= 25) then
		table.insert(menuOptions, "About Subpaths")
	end	
	
	local choice = player:menuString("How may I assist you, young fledgling?", menuOptions)
	if (choice == "About Poet") then
		local spells = player:getSpells()
		
		player:dialogSeq({t, "Would you like to test Poet spells?"}, 1)
		
		for x = 1, #spells do
			if (spells[x] ~= 1 and spells[x] ~= 2 and spells[x] ~= 4) then
				player:removeSpell(spells[x])
			end
		end
		
		if (player:canLearnSpell("brace"))  then
			player:addSpell("brace")
		end
		
		if (player:canLearnSpell("guard"))  then
			player:addSpell("guard")
		end
		
		if (player:canLearnSpell("comfort"))  then
			player:addSpell("comfort")
		end
		
		if (player:canLearnSpell("afflict"))  then
			player:addSpell("afflict")
		end
		
		if (player:canLearnSpell("invoke"))  then
			player:addSpell("invoke")
		end
		
		if (player:canLearnSpell("infuse")) then
			player:addSpell("infuse")
		end
		
		player:flushDuration(1)
		player:sendMinitext("You learn beginner poet spells.")
	elseif (choice == "Become a Poet") then
		local spells = player:getSpells()
		
		for x = 1, #spells do
			if (spells[x] ~= 1 and spells[x] ~= 2 and spells[x] ~= 4) then
				player:removeSpell(spells[x])
			end
		end
		
		if (player:canLearnSpell("brace"))  then
			player:addSpell("brace")
		end
		
		if (player:canLearnSpell("guard"))  then
			player:addSpell("guard")
		end
		
		if (player:canLearnSpell("comfort"))  then
			player:addSpell("comfort")
		end
		
		if (player:canLearnSpell("afflict"))  then
			player:addSpell("afflict")
		end
		
		if (player:canLearnSpell("invoke"))  then
			player:addSpell("invoke")
		end
		
		if (player:canLearnSpell("infuse")) then
			player:addSpell("infuse")
		end
		
		player:flushDuration(1)
		player:sendMinitext("You learn beginner poet spells.")
		player.class = 4
		player:status()
	elseif (choice == "Learn Spell") then
		player:learnSpell()
	elseif (choice == "Forget Spell") then
		player:forgetSpell()
	elseif (choice == "About Subpaths") then
		player:dialogSeq({t, "Rhapsodes can usually be found around the stage near the arena.",
		"Halcyons are often spotted in Sudden Valley, usually near the tree in the pond."}, 1)
	end
	
	player:calcStat()
end),

action = function(npc, player)

end
}