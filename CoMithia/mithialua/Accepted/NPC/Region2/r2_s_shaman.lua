r2_s_shaman = {
click = async(function(player,npc)
	local npcG = {graphic = 0, color = 0}
	local opts = {"Yes", "No"}
	local options = {}
	local menu

	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	local rand = math.random(100000)

	if (player.state ~= 1) then
		options = {"Bind"}
		if (player.level >= 41) then
			table.insert(options, "Quest")
		end
		menu = player:menuString("Greetings.", options)
		if (menu == "Quest") then--Quest
			if (player:hasItem("dweller_bone", 30) == true) then
				menu = player:menu("I see you have some bones, would you trade them?", opts)
				if (menu == 1 and player.level >= 43 and player:hasItem("dweller_bone", 30) == true) then
					player:removeItem("dweller_bone", 30)
					player:addGold(1500)
					if (rand <= 250) then--Level 50 boots
						player:addItem("studded_boots", 1)
					elseif (rand <= 1000) then--Level 40 boots
						player:addItem("hardened_boots", 1)
					end
					player:dialogSeq({npcG, "Thanks for the bones, let me know if you get more."}, 1)
				elseif (menu == 2) then
					player:dialogSeq({npcG, "Think about it."}, 1)
				end
			else
				player:dialogSeq({npcG, "Do you have any dweller bones?\n\nBring me 30 and we can arrange a deal."}, 1)
			end
		elseif (menu == "Bind") then--Bind
			if (player.bindMap > 0) then
				local menuOption = player:menuString("Would you like to return to your bind point?", opts)
				
				if (menuOption == "Yes") then
					player:sendAnimationXY(15, player.x, player.y, 0)
					npc:talk(0, "Shaman: We shall meet again, "..player.name..".")
					player:warp(player.bindMap, player.bindX, player.bindY)
					player:sendAnimation(15, 0)
				end
			else
				player:dialogSeq({npcG, "Nice skull you have, have you thought about donating it?"})
			end
		end
	else
		local menuOption = player:menuString("Even the best sometimes fall. Do you wish to be resurrected?", opts)
		
		if (menuOption == "Yes") then
			player.state = 0
			player.attacker = player.ID
			player:addHealthExtend(player.maxHealth, 0, 0, 0, 0, 0)
			player.magic = player.maxMagic
			player:updateState()
			player:addHealthExtend(1, 0, 0, 0, 0, 0)
			player:sendAnimation(96)
			player:playSound(112)
			player.registry["lastrez"] = os.time()
			npc:talk(0, "Shaman: We shall meet again, "..player.name..".")
		else
			player:dialogSeq({npcG, "Suit yourself, spirit. Come visit me anytime.", 
			"Don't forget to submit your skull release form!"}, 1)
		end
	end
end),

say = function(player, npc)
	local speech = string.lower(player.speech)
	
	if ((string.find(speech, "(.*)res(.*)") or string.find(speech, "(.*)rez(.*)")) and player.state == 1) then
		player.state = 0
		player.attacker = player.ID
		player:addHealthExtend(player.maxHealth, 0, 0, 0, 0, 0)
		player.magic = player.maxMagic
		player:updateState()
		player:addHealthExtend(1, 0, 0, 0, 0, 0)
		player:sendAnimation(96)
		player:playSound(112)
		player.registry["lastrez"] = os.time()
		npc:talk(0, "Shaman: We shall meet again, ".. player.name..".")
	elseif (string.find(speech, "(.*)bind(.*)") and player.state ~= 1 and player.bindMap > 0) then
		player:sendAnimationXY(15, player.x, player.y, 0)
		npc:talk(0, "Shaman: We shall meet again, "..player.name..".")
		player:warp(player.bindMap, player.bindX, player.bindY)
		player:sendAnimation(15, 0)
	end
end
}