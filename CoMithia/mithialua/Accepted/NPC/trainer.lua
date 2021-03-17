trainer = {
click = async(function(player, npc)
	trainer.clicknoasync(player, npc)
end),

clicknoasync = function(player, npc)
	local choice
	local amount
	--local opts = {}
	local menuOptions = {}
	local g = {graphic = convertGraphic(1385, "monster"), color = 0}
	
	player.npcGraphic = g.graphic
	player.npcColor = g.color
	player:dialog("I've been deprecated!", g)
	return
	--[[
	if (player.ap > 0) then
		table.insert(opts, "AP")
	end
	if (player.sp > 0) then
		table.insert(opts, "SP")
	end
	
	if (#opts > 0) then
		choice = player:menuString("Would you like to train with AP or SP?\n(Current AP: "..player.ap..")\n(Current SP: "..player.sp..")", opts)
	else
		player:dialog("You do not have enough AP or SP to train.", g)
		return
	end
	--12 AP/SP per Level
	--5 AP per 1 M/G/W
	--25 AP per 2 M+G+W
	--20 AP per 1 AC+MR
	--60 AP per 1 Vita/Mana Regen
	--5 AP per 1 Min/Max Damage
	--1 AP per 1 Physical Deduction
	--75 AP per 2 Protection
	
	--75 SP per 4 M+G+W
	--8 SP per 1 AC/MR
	--12 SP per 1 AC+MR
	--75 SP per 1 Regen
	--50 SP per 1 Vita/Mana Regen
	--6 SP per 1 Min/Max Damage
	--6 SP per 5 Physical Deduction
	--30 SP per 1 Protection
	--30 SP per 1 Speed
	--10 SP per 1 Weapon/Armor Dura Mods
	
	--1 AP/SP per 4 Vita/Mana
	
	if (choice == "AP") then
	]]--
	--[[if (math.floor(player.ap / 5) > 0) then
		if (player.registry["base_might"] < BASE_MGW) then
			table.insert(menuOptions, "Might")
		end
		if (player.registry["base_grace"] < BASE_MGW) then
			table.insert(menuOptions, "Grace")
		end
		if (player.registry["base_will"] < BASE_MGW) then
			table.insert(menuOptions, "Will")
		end
	end
	if (math.floor(player.ap / 25) > 0) then
		if (player.registry["base_might"] < BASE_MGW and player.registry["base_grace"] < BASE_MGW and player.registry["base_will"] < BASE_MGW) then
			table.insert(menuOptions, "Might + Grace + Will Combo")
		end
	end]]--
		--[[
		if (math.floor(player.ap / 20) > 0) then
			if (player.registry["base_ac"] < BASE_ACMR and player.registry["base_mr"] < BASE_ACMR) then
				table.insert(menuOptions, "AC + MR Combo")
			end
		end
		
		if (player.registry["base_vita"] < BASE_VITAMANA) then
			table.insert(menuOptions, "Vita")
		end
		if (player.registry["base_mana"] < BASE_VITAMANA) then
			table.insert(menuOptions, "Mana")
		end
		if (math.floor(player.ap / 60) > 0) then
			if (player.registry["base_vregen"] < BASE_VMREGEN) then
				table.insert(menuOptions, "Vita Regen")
			end
			if (player.registry["base_mregen"] < BASE_VMREGEN) then
				table.insert(menuOptions, "Mana Regen")
			end
		end
		if (math.floor(player.ap / 5) > 0) then
			if (player.baseMaxDam ~= nil and (player.baseMinDam == nil or player.baseMinDam < player.baseMaxDam) and player.registry["base_mindam"] < BASE_MINMAXDAM) then
				table.insert(menuOptions, "Min Damage")
			end
			if (player.registry["base_maxdam"] < BASE_MINMAXDAM) then
				table.insert(menuOptions, "Max Damage")
			end
		end
		if (player.registry["base_pd"] < BASE_PD) then
			table.insert(menuOptions, "Physical Deduction")
		end
		if (math.floor(player.ap / 75) > 0) then
			if (player.registry["base_prot"] < BASE_PROT) then
				table.insert(menuOptions, "Protection")
			end
		end
		]]--
	--[[if (#menuOptions > 0) then	
		choice = player:menuString("What stat would you like to train? You have "..player.ap.." AP left.", menuOptions)
		if (choice == "Might") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.ap / 5)..")"))
			if (amount > math.floor(player.ap / 5)) then
				amount = math.floor(player.ap / 5)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_might"] > BASE_MGW) then
				amount = BASE_MGW - player.registry["base_might"]
			end
			if (amount <= 0) then
				return
			end
			player.baseMight = player.baseMight + amount
			player.baseHealth = player.baseHealth + (20 * amount)
			player.registry["base_might"] = player.registry["base_might"] + amount
			player.ap = player.ap - (5 * amount)
		elseif (choice == "Grace") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.ap / 5)..")"))
			if (amount > math.floor(player.ap / 5)) then
				amount = math.floor(player.ap / 5)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_grace"] > BASE_MGW) then
				amount = BASE_MGW - player.registry["base_grace"]
			end
			if (amount <= 0) then
				return
			end
			player.baseGrace = player.baseGrace + amount
			player.baseHealth = player.baseHealth + (10 * amount)
			player.baseMagic = player.baseMagic + (10 * amount)
			player.registry["base_grace"] = player.registry["base_grace"] + amount
			player.ap = player.ap - (5 * amount)
		elseif (choice == "Will") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.ap / 5)..")"))
			if (amount > math.floor(player.ap / 5)) then
				amount = math.floor(player.ap / 5)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_will"] > BASE_MGW) then
				amount = BASE_MGW - player.registry["base_will"]
			end
			if (amount <= 0) then
				return
			end
			player.baseWill = player.baseWill + amount
			player.baseMagic = player.baseMagic + (20 * amount)
			player.registry["base_will"] = player.registry["base_will"] + amount
			player.ap = player.ap - (5 * amount)
		elseif (choice == "Might + Grace + Will Combo") then
			amount = tonumber(player:input("How many multiples of 2 "..choice.." would you like to train? (Max: "..math.floor(player.ap / 25)..")"))
			if (amount > math.floor(player.ap / 25)) then
				amount = math.floor(player.ap / 25)
			elseif (amount <= 0) then
				return
			end
			if ((2 * amount) + player.registry["base_might"] > BASE_MGW) then
				amount = math.floor((BASE_MGW - player.registry["base_might"]) / 2)
			end
			if ((2 * amount) + player.registry["base_grace"] > BASE_MGW) then
				amount = math.floor((BASE_MGW - player.registry["base_grace"]) / 2)
			end
			if ((2 * amount) + player.registry["base_will"] > BASE_MGW) then
				amount = math.floor((BASE_MGW - player.registry["base_will"]) / 2)
			end
			if (amount <= 0) then
				return
			end
			player.baseMight = player.baseMight + (2 * amount)
			player.baseGrace = player.baseGrace + (2 * amount)
			player.baseWill = player.baseWill + (2 * amount)
			player.baseHealth = player.baseHealth + (60 * amount)
			player.baseMagic = player.baseMagic + (60 * amount)
			player.registry["base_might"] = player.registry["base_might"] + (2 * amount)
			player.registry["base_grace"] = player.registry["base_grace"] + (2 * amount)
			player.registry["base_will"] = player.registry["base_will"] + (2 * amount)
			player.ap = player.ap - (25 * amount)
			]]--
		--[[
		elseif (choice == "AC + MR Combo") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.ap / 20)..")"))
			if (amount > math.floor(player.ap / 20)) then
				amount = math.floor(player.ap / 20)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_ac"] > BASE_ACMR) then
				amount = BASE_ACMR - player.registry["base_ac"]
			end
			if (amount + player.registry["base_mr"] > BASE_ACMR) then
				amount = BASE_ACMR - player.registry["base_mr"]
			end
			if (amount <= 0) then
				return
			end
			player.baseAC = player.baseAC - amount
			player.baseResist = player.baseResist - amount
			player.registry["base_ac"] = player.registry["base_ac"] + amount
			player.registry["base_mr"] = player.registry["base_mr"] + amount
			player.ap = player.ap - (20 * amount)
		elseif (choice == "Vita") then
			amount = tonumber(player:input("How many multiples of 4 "..choice.." would you like to train? (Max: "..player.ap..")"))
			if (amount > player.ap) then
				amount = player.ap
			elseif (amount <= 0) then
				return
			end
			if ((4 * amount) + player.registry["base_vita"] > BASE_VITAMANA) then
				amount = math.floor((BASE_VITAMANA - player.registry["base_vita"]) / 4)
			end
			if (amount <= 0) then
				return
			end
			player.baseHealth = player.baseHealth + (4 * amount)
			player.registry["base_vita"] = player.registry["base_vita"] + (4 * amount)
			player.ap = player.ap - amount
		elseif (choice == "Mana") then
			amount = tonumber(player:input("How many multiples of 4 "..choice.." would you like to train? (Max: "..player.ap..")"))
			if (amount > player.ap) then
				amount = player.ap
			elseif (amount <= 0) then
				return
			end
			if ((4 * amount) + player.registry["base_mana"] > BASE_VITAMANA) then
				amount = math.floor((BASE_VITAMANA - player.registry["base_mana"]) / 4)
			end
			if (amount <= 0) then
				return
			end
			player.baseMagic = player.baseMagic + (4 * amount)
			player.registry["base_mana"] = player.registry["base_mana"] + (4 * amount)
			player.ap = player.ap - amount
		elseif (choice == "Vita Regen") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.ap / 60)..")"))
			if (amount > math.floor(player.ap / 60)) then
				amount = math.floor(player.ap / 60)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_vregen"] > BASE_VMREGEN) then
				amount = BASE_VMREGEN - player.registry["base_vregen"]
			end
			if (amount <= 0) then
				return
			end
			player.baseVRegen = player.baseVRegen + amount
			player.registry["base_vregen"] = player.registry["base_vregen"] + amount
			player.ap = player.ap - (60 * amount)
		elseif (choice == "Mana Regen") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.ap / 60)..")"))
			if (amount > math.floor(player.ap / 60)) then
				amount = math.floor(player.ap / 60)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_mregen"] > BASE_VMREGEN) then
				amount = BASE_VMREGEN - player.registry["base_mregen"]
			end
			if (amount <= 0) then
				return
			end
			player.baseMRegen = player.baseMRegen + amount
			player.registry["base_mregen"] = player.registry["base_mregen"] + amount
			player.ap = player.ap - (60 * amount)
		elseif (choice == "Min Damage") then
			local dmg = math.floor(player.ap / 5)
			if (player.baseMinDam + dmg > player.baseMaxDam) then
				dmg = player.baseMaxDam - player.baseMinDam
			end
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..dmg..")"))
			if (amount > dmg) then
				amount = dmg
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_mindam"] > BASE_MINMAXDAM) then
				amount = BASE_MINMAXDAM - player.registry["base_mindam"]
			end
			if (amount <= 0) then
				return
			end
			player.baseMinDam = player.baseMinDam + amount
			player.registry["base_mindam"] = player.registry["base_mindam"] + amount
			player.ap = player.ap - (5 * amount)
		elseif (choice == "Max Damage") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.ap / 5)..")"))
			if (amount > math.floor(player.ap / 5)) then
				amount = math.floor(player.ap / 5)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_maxdam"] > BASE_MINMAXDAM) then
				amount = BASE_MINMAXDAM - player.registry["base_maxdam"]
			end
			if (amount <= 0) then
				return
			end
			player.baseMaxDam = player.baseMaxDam + amount
			player.registry["base_maxdam"] = player.registry["base_maxdam"] + amount
			player.ap = player.ap - (5 * amount)
		elseif (choice == "Physical Deduction") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..player.ap..")"))
			if (amount > player.ap) then
				amount = player.ap
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_pd"] > BASE_PD) then
				amount = BASE_PD - player.registry["base_pd"]
			end
			if (amount <= 0) then
				return
			end
			player.basePhysDeduct = player.basePhysDeduct + amount
			player.registry["base_pd"] = player.registry["base_pd"] + amount
			player.ap = player.ap - amount
		elseif (choice == "Protection") then
			amount = tonumber(player:input("How many multiples of 2 "..choice.." would you like to train? (Max: "..math.floor(player.ap / 75)..")"))
			if (amount > math.floor(player.ap / 75)) then
				amount = math.floor(player.ap / 75)
			elseif (amount <= 0) then
				return
			end
			if ((2 * amount) + player.registry["base_prot"] > BASE_PROT) then
				amount = math.floor((BASE_PROT - player.registry["base_prot"]) / 2)
			end
			if (amount <= 0) then
				return
			end
			player.baseProtection = player.baseProtection + (2 * amount)
			player.registry["base_prot"] = player.registry["base_prot"] + (2 * amount)
			player.ap = player.ap - (75 * amount)
		]]--
		--end
		--player:msg(0, "You now have a total of "..player.ap.." attribute points.", player.ID)
	--[[
	elseif (choice == "SP") then
		if (math.floor(player.sp / 75) > 0) then
			if (player.registry["base_might"] < BASE_MGW and player.registry["base_grace"] < BASE_MGW and player.registry["base_will"] < BASE_MGW) then
				table.insert(menuOptions, "Might + Grace + Will Combo")
			end
		end
		if (math.floor(player.sp / 8) > 0) then
			if (player.registry["base_ac"] < BASE_ACMR) then
				table.insert(menuOptions, "AC")
			end
			if (player.registry["base_mr"] < BASE_ACMR) then
				table.insert(menuOptions, "MR")
			end
		end
		if (math.floor(player.sp / 12) > 0) then
			if (player.registry["base_ac"] < BASE_ACMR and player.registry["base_mr"] < BASE_ACMR) then
				table.insert(menuOptions, "AC + MR Combo")
			end
		end
		if (player.registry["base_vita"] < BASE_VITAMANA) then
			table.insert(menuOptions, "Vita")
		end
		if (player.registry["base_mana"] < BASE_VITAMANA) then
			table.insert(menuOptions, "Mana")
		end
		if (math.floor(player.sp / 75) > 0) then
			if (player.registry["base_regen"] < BASE_REGEN) then
				table.insert(menuOptions, "Regen")
			end
		end
		if (math.floor(player.sp / 50) > 0) then
			if (player.registry["base_vregen"] < BASE_VMREGEN) then
				table.insert(menuOptions, "Vita Regen")
			end
			if (player.registry["base_mregen"] < BASE_VMREGEN) then
				table.insert(menuOptions, "Mana Regen")
			end
		end
		if (math.floor(player.sp / 6) > 0) then
			if (player.baseMaxDam ~= nil and (player.baseMinDam == nil or player.baseMinDam < player.baseMaxDam) and player.registry["base_mindam"] < BASE_MINMAXDAM) then
				table.insert(menuOptions, "Min Damage")
			end
			if (player.registry["base_maxdam"] < BASE_MINMAXDAM) then
				table.insert(menuOptions, "Max Damage")
			end
			if (player.registry["base_pd"] < BASE_PD) then
				table.insert(menuOptions, "Physical Deduction")
			end
		end
		if (math.floor(player.sp / 30) > 0) then
			if (player.registry["base_prot"] < BASE_PROT) then
				table.insert(menuOptions, "Protection")
			end
			if (player.registry["base_speed"] < BASE_SPEED) then
				table.insert(menuOptions, "Speed")
			end
		end
		if (math.floor(player.sp / 10) > 0) then
			if (player.registry["base_wdm"] < BASE_WEAPARMOR) then
				table.insert(menuOptions, "Weapon Dura Mod")
			end
			if (player.registry["base_adm"] < BASE_WEAPARMOR) then
				table.insert(menuOptions, "Armor Dura Mod")
			end
		end
		
		choice = player:menuString("What stat would you like to train?", menuOptions)
		if (choice == "Might + Grace + Will Combo") then
			amount = tonumber(player:input("How many multiples of 4 "..choice.." would you like to train? (Max: "..math.floor(player.sp / 75)..")"))
			if (amount > math.floor(player.sp / 75)) then
				amount = math.floor(player.sp / 75)
			elseif (amount <= 0) then
				return
			end
			if ((4 * amount) + player.registry["base_might"] > BASE_MGW) then
				amount = math.floor((BASE_MGW - player.registry["base_might"]) / 4)
			end
			if ((4 * amount) + player.registry["base_grace"] > BASE_MGW) then
				amount = math.floor((BASE_MGW - player.registry["base_grace"]) / 4)
			end
			if ((4 * amount) + player.registry["base_will"] > BASE_MGW) then
				amount = math.floor((BASE_MGW - player.registry["base_will"]) / 4)
			end
			if (amount <= 0) then
				return
			end
			player.baseMight = player.baseMight + (4 * amount)
			player.baseGrace = player.baseGrace + (4 * amount)
			player.baseWill = player.baseWill + (4 * amount)
			player.baseHealth = player.baseHealth + (100 * amount)
			player.baseMagic = player.baseMagic + (100 * amount)
			player.registry["base_might"] = player.registry["base_might"] + (4 * amount)
			player.registry["base_grace"] = player.registry["base_grace"] + (4 * amount)
			player.registry["base_will"] = player.registry["base_will"] + (4 * amount)
			player.sp = player.sp - (75 * amount)
		elseif (choice == "AC") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 8)..")"))
			if (amount > math.floor(player.sp / 8)) then
				amount = math.floor(player.sp / 8)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_ac"] > BASE_ACMR) then
				amount = BASE_ACMR - player.registry["base_ac"]
			end
			if (amount <= 0) then
				return
			end
			player.baseAC = player.baseAC - amount
			player.registry["base_ac"] = player.registry["base_ac"] + amount
			player.sp = player.sp - (8 * amount)
		elseif (choice == "MR") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 8)..")"))
			if (amount > math.floor(player.sp / 8)) then
				amount = math.floor(player.sp / 8)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_mr"] > BASE_ACMR) then
				amount = BASE_ACMR - player.registry["base_mr"]
			end
			if (amount <= 0) then
				return
			end
			player.baesMR = player.baseResist - amount
			player.registry["base_mr"] = player.registry["base_mr"] + amount
			player.sp = player.sp - (8 * amount)
		elseif (choice == "AC + MR Combo") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 12)..")"))
			if (amount > math.floor(player.sp / 12)) then
				amount = math.floor(player.sp / 12)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_ac"] > BASE_ACMR) then
				amount = BASE_ACMR - player.registry["base_ac"]
			end
			if (amount + player.registry["base_mr"] > BASE_ACMR) then
				amount = BASE_ACMR - player.registry["base_mr"]
			end
			if (amount <= 0) then
				return
			end
			player.baseAC = player.baseAC - amount
			player.baseResist = player.baseResist - amount
			player.registry["base_ac"] = player.registry["base_ac"] + amount
			player.registry["base_mr"] = player.registry["base_mr"] + amount
			player.sp = player.sp - (12 * amount)
		elseif (choice == "Vita") then
			amount = tonumber(player:input("How many multiples of 4 "..choice.." would you like to train? (Max: "..player.sp..")"))
			if (amount > player.sp) then
				amount = player.sp
			elseif (amount <= 0) then
				return
			end
			if ((4 * amount) + player.registry["base_vita"] > BASE_VITAMANA) then
				amount = math.floor((BASE_VITAMANA - player.registry["base_vita"]) / 4)
			end
			if (amount <= 0) then
				return
			end
			player.baseHealth = player.baseHealth + (4 * amount)
			player.registry["base_vita"] = player.registry["base_vita"] + (4 * amount)
			player.sp = player.sp - amount
		elseif (choice == "Mana") then
			amount = tonumber(player:input("How many multiples of 4 "..choice.." would you like to train? (Max: "..player.sp..")"))
			if (amount > player.sp) then
				amount = player.sp
			elseif (amount <= 0) then
				return
			end
			if ((4 * amount) + player.registry["base_mana"] > BASE_VITAMANA) then
				amount = math.floor((BASE_VITAMANA - player.registry["base_mana"]) / 4)
			end
			if (amount <= 0) then
				return
			end
			player.baseMagic = player.baseMagic + (4 * amount)
			player.registry["base_mana"] = player.registry["base_mana"] + (4 * amount)
			player.sp = player.sp - amount
		elseif (choice == "Regen") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 75)..")"))
			if (amount > math.floor(player.sp / 75)) then
				amount = math.floor(player.sp / 75)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_regen"] > BASE_REGEN) then
				amount = BASE_REGEN - player.registry["base_regen"]
			end
			if (amount <= 0) then
				return
			end
			player.baseRegen = player.baseRegen + amount
			player.registry["base_regen"] = player.registry["base_regen"] + amount
			player.sp = player.sp - (75 * amount)
		elseif (choice == "Vita Regen") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 50)..")"))
			if (amount > math.floor(player.sp / 50)) then
				amount = math.floor(player.sp / 50)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_vregen"] > BASE_VMREGEN) then
				amount = BASE_VMREGEN - player.registry["base_vregen"]
			end
			if (amount <= 0) then
				return
			end
			player.baseVRegen = player.baseVRegen + amount
			player.registry["base_vregen"] = player.registry["base_vregen"] + amount
			player.sp = player.sp - (50 * amount)
		elseif (choice == "Mana Regen") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 50)..")"))
			if (amount > math.floor(player.sp / 50)) then
				amount = math.floor(player.sp / 50)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_mregen"] > BASE_VMREGEN) then
				amount = BASE_VMREGEN - player.registry["base_mregen"]
			end
			if (amount <= 0) then
				return
			end
			player.baseMRegen = player.baseMRegen + amount
			player.registry["base_mregen"] = player.registry["base_mregen"] + amount
			player.sp = player.sp - (50 * amount)
		elseif (choice == "Min Damage") then
			local dmg = math.floor(player.sp / 6)
			if (player.baseMinDam + dmg > player.baseMaxDam) then
				dmg = player.baseMaxDam - player.baseMinDam
			end
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..dmg..")"))
			if (amount > dmg) then
				amount = dmg
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_mindam"] > BASE_MINMAXDAM) then
				amount = BASE_MINMAXDAM - player.registry["base_mindam"]
			end
			if (amount <= 0) then
				return
			end
			player.baseMinDam = player.baseMinDam + amount
			player.registry["base_mindam"] = player.registry["base_mindam"] + amount
			player.sp = player.sp - (6 * amount)
		elseif (choice == "Max Damage") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 6)..")"))
			if (amount > math.floor(player.sp / 6)) then
				amount = math.floor(player.sp / 6)
				return
			end
			if (amount + player.registry["base_maxdam"] > BASE_MINMAXDAM) then
				amount = BASE_MINMAXDAM - player.registry["base_maxdam"]
			end
			if (amount <= 0) then
				return
			end
			player.baseMaxDam = player.baseMaxDam + amount
			player.registry["base_maxdam"] = player.registry["base_maxdam"] + amount
			player.sp = player.sp - (6 * amount)
		elseif (choice == "Physical Deduction") then
			amount = tonumber(player:input("How many multiples of 5 "..choice.." would you like to train? (Max: "..math.floor(player.sp / 6)..")"))
			if (amount > math.floor(player.sp / 6)) then
				amount = math.floor(player.sp / 6)
			elseif (amount <= 0) then
				return
			end
			if ((5 * amount) + player.registry["base_pd"] > BASE_PD) then
				amount = math.floor((BASE_PD - player.registry["base_pd"]) / 5)
			end
			if (amount <= 0) then
				return
			end
			player.basePhysDeduct = player.basePhysDeduct + (5 * amount)
			player.registry["base_pd"] = player.registry["base_pd"] + (5 * amount)
			player.sp = player.sp - (6 * amount)
		elseif (choice == "Protection") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 30)..")"))
			if (amount > math.floor(player.sp / 30)) then
				amount = math.floor(player.sp / 30)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_prot"] > BASE_PROT) then
				amount = BASE_PROT - player.registry["base_prot"]
			end
			if (amount <= 0) then
				return
			end
			player.baseProtection = player.baseProtection + amount
			player.registry["base_prot"] = player.registry["base_prot"] + amount
			player.sp = player.sp - (30 * amount)
		elseif (choice == "Speed") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 30)..")"))
			if (amount > math.floor(player.sp / 30)) then
				amount = math.floor(player.sp / 30)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_speed"] > BASE_SPEED) then
				amount = BASE_SPEED - player.registry["base_speed"]
			end
			if (amount <= 0) then
				return
			end
			player.baseSpeed = player.baseSpeed - amount
			player.registry["base_speed"] = player.registry["base_speed"] + amount
			player.sp = player.sp - (30 * amount)
		elseif (choice == "Weapon Dura Mod") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 10)..")"))
			if (amount > math.floor(player.sp / 10)) then
				amount = math.floor(player.sp / 10)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_wdm"] > BASE_WEAPARMOR) then
				amount = BASE_WEAPARMOR - player.registry["base_wdm"]
			end
			if (amount <= 0) then
				return
			end
			player.weapDuraMod = player.weapDuraMod + amount
			player.registry["base_wdm"] = player.registry["base_wdm"] + amount
			player.sp = player.sp - (10 * amount)
		elseif (choice == "Armor Dura Mod") then
			amount = tonumber(player:input("How much "..choice.." would you like to train? (Max: "..math.floor(player.sp / 10)..")"))
			if (amount > math.floor(player.sp / 10)) then
				amount = math.floor(player.sp / 10)
			elseif (amount <= 0) then
				return
			end
			if (amount + player.registry["base_adm"] > BASE_WEAPARMOR) then
				amount = BASE_WEAPARMOR - player.registry["base_adm"]
			end
			if (amount <= 0) then
				return
			end
			player.armorDuraMod = player.armorDuraMod + amount
			player.registry["base_adm"] = player.registry["base_adm"] + amount
			player.sp = player.sp - (10 * amount)
		end
		player:msg(0, "You now have a total of "..player.sp.." skill points.", player.ID)
		]]--
	--[[else
		player:dialog("You do not have enough AP to train.", g)
		return
	end
	
	player:calcStat()
	player:sendStatus()
	player:refresh()]]--
end
}