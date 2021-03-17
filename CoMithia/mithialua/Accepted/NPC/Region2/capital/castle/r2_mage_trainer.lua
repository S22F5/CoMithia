r2_mage_trainer = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.class == 0) then
		table.insert(menuOptions, "About Mage")
	end
	
	if (player.class == 0 and player.level >= 5) then
		table.insert(menuOptions, "Become a Mage")
	end
	
	if (player.class == 0 or player.baseClass == 3) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	if (player.class == 3 and player.level >= 25) then
		table.insert(menuOptions, "About Subpaths")
	end
	local choice = player:menuString("How may I assist you, young fledgling?", menuOptions)
	
	if (choice == "About Mage") then
		local spells = player:getSpells()
		
		player:dialogSeq({npcG, "Would you like to test Mage spells?"}, 1)
		
		for x = 1, #spells do
			if (spells[x] ~= 1 and spells[x] ~= 2 and spells[x] ~= 4) then
				player:removeSpell(spells[x])
			end
		end
		
		if (player:canLearnSpell("inhibit"))  then
			player:addSpell("inhibit")
		end
		
		if (player:canLearnSpell("singe"))  then
			player:addSpell("singe")
		end
		
		if (player:canLearnSpell("stop_time"))  then
			player:addSpell("stop_time")
		end
		
		player:flushDuration(1)
		player:sendMinitext("You learn beginner mage spells.")
	elseif (choice == "Become a Mage") then
		local spells = player:getSpells()
		
		for x = 1, #spells do
			if (spells[x] ~= 1 and spells[x] ~= 2 and spells[x] ~= 4) then
				player:removeSpell(spells[x])
			end
		end
		
		if (player:canLearnSpell("inhibit"))  then
			player:addSpell("inhibit")
		end
		
		if (player:canLearnSpell("singe"))  then
			player:addSpell("singe")
		end
		
		if (player:canLearnSpell("stop_time"))  then
			player:addSpell("stop_time")
		end
		
		player:flushDuration(1)
		player:sendMinitext("You learn beginner mage spells.")
		player.class = 3
		player:status()
	elseif (choice == "Learn Spell") then
		player:learnSpell()
	elseif (choice == "Forget Spell") then
		player:forgetSpell()
	elseif (choice == "About Subpaths") then
		player:dialogSeq({npcG, "I've heard of an astral at the top of a mountain.",
		"You should go look for him at the top of a mountain for more information."}, 1)
		player:dialogSeq({npcG, "I've heard of a time sage always reading books inside the city.",
		"If you can't find him, try pulling a book."}, 1)		
	end
	
	player:calcStat()
end),

action = function(npc, player)

end
}