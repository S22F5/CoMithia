styling = {
click = async(function(player, comb)
	local npc = styling.getFreeStylistNPC(player)
	local npcGraphics = {graphic = comb.icon, color = comb.iconC}
	local craftCount = 0
	local fail = 19
	local typeOpts = {"Hair Styling", "Forget Styling"}
	local typeChoice = ""
	local craftLevel = ""
	local levelBonus = 0
	local hairStyles = {}
	local styleToCraft = 0
	local hair = 0
	local target = ""
	local options = {"Yes", "No"}
	local choice = ""
	
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	player.dialogType = 0
	player.lastClick = npc.ID
	
	if (player.registry["professionalTailor"] == 250) then
		craftCount = craftCount + 1
	end
	
	if (player.registry["professionalForester"] == 250) then
		craftCount = craftCount + 1
	end
	
	if (player.registry["professionalSmith"] == 250) then
		craftCount = craftCount + 1
	end
	
	if (player.registry["professionalStylist"] == 250) then
		craftCount = craftCount + 1
	end
	
	if (player.registry["professionalStylist"] == 0 and craftCount < 2) then
		local options = {"Yes", "No"}
		local choice = player:menuString("Would you like to become a stylist?", options)
		
		if (choice == "Yes") then
			player.registry["professionalStylist"] = 250
		else
			player:dialogSeq({t, "Very well then, maybe another time."}, 1)
			return
		end
	elseif (player.registry["professionalStylist"] == 0) then
		player:removeLegendbyName("stylist")
		player.registry["stylist"] = 0
		player:dialogSeq({t, "I'm sorry, but you can only have a maximum of two crafts. Please forget one if you would like to start styling."}, 1)
		return
	end
	
	if (player.registry["stylist"] >= 0) then
		craftlevel = "Beginner"
		levelBonus = 0
		table.insert(hairStyles, "Fresh Meat")
		table.insert(hairStyles, "Wannabe")
		table.insert(hairStyles, "Everyman")
		table.insert(hairStyles, "Mesuvian")
		table.insert(hairStyles, "Grungy")
		table.insert(hairStyles, "Mop Top")
		table.insert(hairStyles, "Gretchen")
		table.insert(hairStyles, "Serpent Tail")
		table.insert(hairStyles, "Worker")
		table.insert(hairStyles, "Snake Charmer")
		table.insert(hairStyles, "Sheepish")
	end
	
	if (player.registry["stylist"] >= 20) then
		craftlevel = "Novice"
		levelBonus = 1
		table.insert(hairStyles, "Bound")
		table.insert(hairStyles, "Flipped")
		table.insert(hairStyles, "Schoolgirl")
		table.insert(hairStyles, "Farmer")
		table.insert(hairStyles, "Bathead")
		table.insert(hairStyles, "Stuck Up")
		table.insert(hairStyles, "Sidewinder")
		table.insert(hairStyles, "Chopstick")
		table.insert(hairStyles, "Emo")
		table.insert(hairStyles, "Bedhead")
		table.insert(hairStyles, "Chopped")
	end
	
	if (player.registry["stylist"] >= 40) then
		craftlevel = "Apprentice"
		levelBonus = 2
		table.insert(hairStyles, "Greased")
		table.insert(hairStyles, "Bandito")
		table.insert(hairStyles, "Chaos")
		table.insert(hairStyles, "Curled Up")
		table.insert(hairStyles, "Bunbuns")
		table.insert(hairStyles, "Wanderer")
		table.insert(hairStyles, "Gentleman")
		table.insert(hairStyles, "Brush")
		table.insert(hairStyles, "Flippy Dippy")
		table.insert(hairStyles, "Muffintop")
		table.insert(hairStyles, "Helmet Head")
	end
	
	if (player.registry["stylist"] >= 80) then
		craftlevel = "Accomplished"
		levelBonus = 3
		table.insert(hairStyles, "Topknot")
		table.insert(hairStyles, "Innocent")
		table.insert(hairStyles, "Patches")
		table.insert(hairStyles, "Wingtips")
		table.insert(hairStyles, "Side Curls")
		table.insert(hairStyles, "WIP")
		table.insert(hairStyles, "Parting Ways")
		table.insert(hairStyles, "Twin Rolls")
		table.insert(hairStyles, "Shoulder Puffs")
		table.insert(hairStyles, "Forked")
		table.insert(hairStyles, "Regal")
	end
	
	if (player.registry["stylist"] >= 160) then
		craftlevel = "Adept"
		levelBonus = 4
		table.insert(hairStyles, "Side Braids")
		table.insert(hairStyles, "Professional")
		table.insert(hairStyles, "Pompous")
		table.insert(hairStyles, "Flat Top")
		table.insert(hairStyles, "Cow Lick")
		table.insert(hairStyles, "Bookworm")
		table.insert(hairStyles, "Mad Chemist")
		table.insert(hairStyles, "Zen")
		table.insert(hairStyles, "Floor Sweeper")
		table.insert(hairStyles, "Coy")
		table.insert(hairStyles, "Swept Bangs")
	end
	
	if (player.registry["stylist"] >= 320) then
		craftlevel = "Talented"
		levelBonus = 5
		table.insert(hairStyles, "Gambler")
		table.insert(hairStyles, "Sprout")
		table.insert(hairStyles, "Fierce")
		table.insert(hairStyles, "Windblown")
		table.insert(hairStyles, "Shocked")
		table.insert(hairStyles, "Jester")
		table.insert(hairStyles, "Formality")
		table.insert(hairStyles, "Spiritual")
		table.insert(hairStyles, "Wisp")
		table.insert(hairStyles, "Hoarded")
		table.insert(hairStyles, "Whip Braid")
	end
	
	if (player.registry["stylist"] >= 640) then
		craftlevel = "Skilled"
		levelBonus = 6
		table.insert(hairStyles, "Thin Mullet")
		table.insert(hairStyles, "Wooly Bully")
		table.insert(hairStyles, "Combed")
		table.insert(hairStyles, "Flutter")
		table.insert(hairStyles, "Under Curl")
		table.insert(hairStyles, "Wedge")
		table.insert(hairStyles, "Afro")
		table.insert(hairStyles, "Dreads")
		table.insert(hairStyles, "Rising Danger")
		table.insert(hairStyles, "Swirled")
		table.insert(hairStyles, "FABULOUS")
	end
	
	if (player.registry["stylist"] >= 1280) then
		craftlevel = "Expert"
		levelBonus = 7
		table.insert(hairStyles, "Wave")
		table.insert(hairStyles, "Side Point")
		table.insert(hairStyles, "Wooly")
		table.insert(hairStyles, "Crested Wave")
		table.insert(hairStyles, "Delusive")
		table.insert(hairStyles, "Rice Buns")
		table.insert(hairStyles, "Hobo")
		table.insert(hairStyles, "Mischievous")
		table.insert(hairStyles, "Swept Out")
		table.insert(hairStyles, "Pulled Back")
		table.insert(hairStyles, "Eyesore")
	end
	
	if (player.registry["stylist"] >= 2560) then
		craftlevel = "Master"
		levelBonus = 8
		table.insert(hairStyles, "Bon Bon")
		table.insert(hairStyles, "Lolli")
		table.insert(hairStyles, "Upswept Fury")
		table.insert(hairStyles, "Romancer")
		table.insert(hairStyles, "Sticky")
		table.insert(hairStyles, "Looper")
		table.insert(hairStyles, "Starlet")
		table.insert(hairStyles, "Tribal Braid")
		table.insert(hairStyles, "Snub Tail")
		table.insert(hairStyles, "Explosion")
		table.insert(hairStyles, "Tattered")
	end
	
	if (player.registry["stylist"] >= 5120) then
		craftlevel = "Grand Master"
		levelBonus = 9
		table.insert(hairStyles, "Balance")
		table.insert(hairStyles, "Sloped")
		table.insert(hairStyles, "Alluring")
		table.insert(hairStyles, "Sovereign")
		table.insert(hairStyles, "Contained")
		table.insert(hairStyles, "Turkey")
		table.insert(hairStyles, "Sakkat")
		table.insert(hairStyles, "Shuriken")
		table.insert(hairStyles, "Matriarch")
		table.insert(hairStyles, "Terbulent")
		table.insert(hairStyles, "Covered Buns")
		table.insert(hairStyles, "Recluse")
	end
	
	if (player.registry["stylist"] >= 10240) then
		craftlevel = "Champion"
		levelBonus = 10
		table.insert(hairStyles, "Little Hood")
		table.insert(hairStyles, "Tuffled")
		table.insert(hairStyles, "Brush Over")
		table.insert(hairStyles, "Nifty")
		table.insert(hairStyles, "Rat's Nest")
		table.insert(hairStyles, "Frosted")
		table.insert(hairStyles, "Spider Silk")
		table.insert(hairStyles, "Highlight")
		table.insert(hairStyles, "Streaked")
		table.insert(hairStyles, "Cloud")
		table.insert(hairStyles, "Creampuff")
		table.insert(hairStyles, "Kid")
		table.insert(hairStyles, "Mess")
	end
	if (player.registry["stylist"] >= 20480) then
		craftlevel = "Legendary"
		levelBonus = 11
		table.insert(hairStyles, "Plaster")
		table.insert(hairStyles, "Headdress")
		table.insert(hairStyles, "Native")
		table.insert(hairStyles, "Gangsta")
		table.insert(hairStyles, "Classy")
		table.insert(hairStyles, "Radical")
		table.insert(hairStyles, "Onion")
		table.insert(hairStyles, "Elaborate")
		table.insert(hairStyles, "Rat Tail")
		table.insert(hairStyles, "Swoops")
		table.insert(hairStyles, "Loner")
		table.insert(hairStyles, "Feathered")
		table.insert(hairStyles, "Lolita")
		table.insert(hairStyles, "Bald")
	end
	
	table.insert(hairStyles, "Nevermind")
		
	player:removeLegendbyName("stylist")
	player:addLegend(""..craftlevel.." stylist", "stylist", 94, 80)
	
	repeat
		target = tostring(player:input("For whom will you be styling?"))
	until (target ~= player.name)
	
	target = Player(target)
	
	if (target == nil or target.gmLevel > 0 or player.m ~= target.m or distance(player, target) > 8) then
		player:dialogSeq({"What are you going to hairstyle? There's nobody there."}, 1)
		return
	end
	
	stylist.setup(npc, target)
	player.dialogType = 2
	typeChoice = player:menuString("What will you craft?", typeOpts)
	
	if (typeChoice == "Hair Styling") then
		styleToCraft = player:menu("What type of hair style would you like to perform?", hairStyles)
	elseif (typeChoice == "Forget Styling") then
		local options = {"Yes", "No"}
		local choice = player:menuString("Are you absolutely sure you wish to forget styling? This will erase all skill you have earned thus far.", options)
		
		if (choice == "Yes") then
			player:dialogSeq({t, "Visit the Legendary Artisan.\n\nHe is usually around the market near East gate Areci Mesuv."}, 1)
			--[[player.registry["professionalStylist"] = 0
			player.registry["stylist"] = 0
			player:removeLegendbyName("stylist")
			return]]--
		else
			player:dialogSeq({t, "Not quite ready to give it up, eh?"}, 1)
			return
		end
	end
	
	if (styleToCraft <= 19) then
		npc.gfxHair = styleToCraft - 1
	elseif (styleToCraft <= 61) then
		npc.gfxHair = styleToCraft
	elseif (styleToCraft <= 87) then
		npc.gfxHair = styleToCraft + 1
	elseif (styleToCraft <= 94) then
		npc.gfxHair = styleToCraft + 2
	elseif (styleToCraft <= 112) then
		npc.gfxHair = styleToCraft + 3
	elseif (styleToCraft <= 137) then
		npc.gfxHair = styleToCraft + 5
	elseif (styleToCraft == 138) then
		npc.gfxHair = fail
	end
	
	if (styleToCraft == #hairStyles) then
		return
	end
	
	choice = player:menuString("Is this how you would like to style their hair?", options)
	
	if (choice == "Yes") then
		async(styling.style(target, npc, player, levelBonus, fail))
	end
end),

style = async(function(player, npc, stylist, levelBonus, fail)
	local options = {"Yes", "No"}
	local choice = ""
	local successRate = 70000
	local stylistSkill = stylist.registry["stylist"]
	
	if (npc == nil) then
		return
	end
	
	player.dialogType = 2
	player.lastClick = npc.ID
	choice = player:menuString("Is this the style you would like?\n<b>WARNING:\nUpon failure, you will become bald.", options)
	
	if (choice == "Yes") then
		if (math.random(100000) <= (successRate + (levelBonus * 2000)) and stylist:hasItem("comb", 1) == true and stylist:hasItem("scissors", 1) == true) then
			player.hair = npc.gfxHair
			stylist.registry["stylist"] = stylistSkill + 1
			stylist:removeItem("comb", 1)
			player:updateState()
			player:dialogSeq({"As your new do springs into action, you feel ready for anything!"}, 1)
		elseif (stylist:hasItem("comb", 1) ~= true or stylist:hasItem("scissors", 1) ~= true) then
			player:dialogSeq({"Have you been swindled? Make sure that stylist has a comb and scissors!"}, 1)
		else
			player.hair = fail
			stylist.registry["stylist"] = stylistSkill + 1
			stylist:removeItem("comb", 1)
			player:updateState()
			player:dialogSeq({"Ouch. That shave was a bit TOO close."}, 1)
		end
	else
		player:dialogSeq({"Whew. That was a close shave."}, 1)
	end
end),

getFreeStylistNPC = function(stylist)
	local npcsInBlock = {}
	
	stylist:addNPC("stylist", stylist.m, stylist.x, stylist.y, 0, 300000)
	npcsInBlock = stylist:getObjectsInCell(stylist.m, stylist.x, stylist.y, BL_NPC)
	
	if (#npcsInBlock > 0) then
		for i = 1, #npcsInBlock do
			if (npcsInBlock[i].yname == "stylist") then
				npcsInBlock[i].state = 0
				return npcsInBlock[i]
			end
		end
	end
end
}

stylist = {
setup = function(npc, target)
	local item
	
	if (target:getEquippedItem(EQ_WEAP) ~= nil) then
		item = target:getEquippedItem(EQ_WEAP)
		npc.gfxWeap = item.look
		npc.gfxWeapC = item.lookC
	else 
		npc.gfxWeap = 65535
	end
	
	if (target:getEquippedItem(EQ_ARMOR) ~= nil) then
		item = target:getEquippedItem(EQ_ARMOR)
		npc.gfxArmor = item.look
		npc.gfxArmorC = item.lookC
	else
		npc.gfxArmor = target.sex
	end
	
	if (target:getEquippedItem(EQ_COAT) ~= nil) then
		item = target:getEquippedItem(EQ_COAT)
		npc.gfxArmor = item.look
		npc.gfxArmorC = item.lookC
	end
	
	if (target:getEquippedItem(EQ_SHIELD) ~= nil) then
		item = target:getEquippedItem(EQ_SHIELD)
		npc.gfxShield = item.look
		npc.gfxShieldC = item.lookC
	else
		npc.gfxShield = 65535
	end
	
	npc.gfxHelm = 65535
	
	if (target:getEquippedItem(EQ_FACEACC) ~= nil) then
		item = target:getEquippedItem(EQ_FACEACC)
		npc.gfxFaceA = item.look
		npc.gfxFaceAC = item.lookC
	else
		npc.gfxFaceA = 65535
	end
	
	npc.gfxFaceAT = 65535
	
	if (target:getEquippedItem(EQ_CROWN) ~= nil) then
		item = target:getEquippedItem(EQ_CROWN)
		npc.gfxCrown = item.look
		npc.gfxCrownC = item.lookC
	else
		npc.gfxCrown = 65535
	end
	
	if (target:getEquippedItem(EQ_MANTLE) ~= nil) then
		item = target:getEquippedItem(EQ_MANTLE)
		npc.gfxCape = item.look
		npc.gfxCapeC = item.lookC
	else
		npc.gfxCape = 65535
	end
	
	if (target:getEquippedItem(EQ_NECKLACE) ~= nil) then
		item = target:getEquippedItem(EQ_NECKLACE)
		npc.gfxNeck = item.look
		npc.gfxNeckC = item.lookC
	else
		npc.gfxNeck = 65535
	end
	
	if (target:getEquippedItem(EQ_BOOTS) ~= nil) then
		item = target:getEquippedItem(EQ_BOOTS)
		npc.gfxBoots = item.look
		npc.gfxBootsC = item.lookC
	else
		npc.gfxBoots = target.sex
	end
	
	npc.gfxFace = target.face
	npc.gfxHair = target.hair
	npc.gfxHairC = target.hairColor
	npc.gfxFaceC = target.faceColor
	npc.gfxSkinC = target.skinColor
	npc.gfxDye = target.armorColor
	npc.gfxName = ""
end,

endAction = function(npc)
	npc:delete()
end
}