r2_warrior_trainer = {
click = async(function(player, npc)
	local t = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 1
	
	if (player.class == 0) then
		table.insert(menuOptions, "About Warrior")
	end
	
	if (player.class == 0 and player.level >= 5) then
		table.insert(menuOptions, "Become a Warrior")
	end
	
	if (player.class == 0 or player.baseClass == 1) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	if (player.class == 1 and player.level >= 25) then
		table.insert(menuOptions, "About Subpaths")
	end	
	
	local choice = player:menuString("How may I assist you, young fledgling?", menuOptions)
	if (choice == "About Warrior") then
		local spells = player:getSpells()
		
		player:dialogSeq({t, "Would you like to test Warrior spells?"}, 1)
		
		for x = 1, #spells do
			if (spells[x] ~= 1 and spells[x] ~= 2 and spells[x] ~= 4) then
				player:removeSpell(spells[x])
			end
		end
		
		if (player:canLearnSpell("defenders_stance"))  then
			player:addSpell("defenders_stance")
		end
		
		if (player:canLearnSpell("warriors_stance"))  then
			player:addSpell("warriors_stance")
		end
		
		if (player:canLearnSpell("rampage"))  then
			player:addSpell("rampage")
		end
		
		player:flushDuration(1)
		player:sendMinitext("You learn beginner warrior spells.")
	elseif (choice == "Become a Warrior") then
		local spells = player:getSpells()
		
		for x = 1, #spells do
			if (spells[x] ~= 1 and spells[x] ~= 2 and spells[x] ~= 4) then
				player:removeSpell(spells[x])
			end
		end
		
		if (player:canLearnSpell("defenders_stance"))  then
			player:addSpell("defenders_stance")
		end
		
		if (player:canLearnSpell("warriors_stance"))  then
			player:addSpell("warriors_stance")
		end
		
		if (player:canLearnSpell("rampage"))  then
			player:addSpell("rampage")
		end
		
		player:flushDuration(1)
		player:sendMinitext("You learn beginner warrior spells.")
		player.class = 1
		player:status()
	elseif (choice == "Learn Spell") then
		player:learnSpell()
	elseif (choice == "Forget Spell") then
		player:forgetSpell()
	elseif (choice == "About Subpaths") then
		player:dialogSeq({t, "Knights are a very organized group, you can find their leader north of the city messenger.",
		"Gladiators are a fun bunch, seek their leader in a cave within Axefel."}, 1)
	end
	
	player:calcStat()
end),

say = function(player, npc)
	local speech = player.speech
	local lspeech = string.lower(speech)

	if (lspeech == "quest") then
		async(r2_warrior_trainer.questSelection(player, npc))
	end
end,

action = function(npc, player)

end,

questSelection = async(function(player, npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	local quests = {}
	
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	if (player.class == 1 and player.quest["greatProtector"] >= 0 and player.quest["greatProtector"] < 250) then
		table.insert(quests, "Great Protector")
	end
	
	if (#quests > 0) then
		local menu = player:menuString("Which quest?", quests)
		
		if (menu == "Great Protector") then
			greatProtector.questIndex(player, npc)
		end
	else
		player:dialogSeq({"No quests available."}, 1)
	end
end)
}