r2_c_shaman = {
click = async(function(player,npc)
	local t = {graphic = 0, color = 0}
	local opts = {"Yes", "No"}

	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 1
			
	if (player.state ~= 1) then
		if (player.bindMap > 0) then
			local menuOption = player:menuString("Would you like to return to your bind point?", opts)
			
			if (menuOption == "Yes") then
				player:sendAnimationXY(15, player.x, player.y, 0)
				npc:talk(0, "Shaman: We shall meet again, "..player.name..".")
				player:warp(player.bindMap, player.bindX, player.bindY)
				player:sendAnimation(15, 0)
			end
		else
			player:dialogSeq({t, "Nice skull you have, have you thought about donating it?"})
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
			player:dialogSeq({t, "Suit yourself, spirit. Come visit me anytime.", 
							t, "Don't forget to submit your skull release form!"})
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