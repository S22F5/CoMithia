basement_chest = {

on_spawn = function(mob)
	if (math.random(0,4) == 0) then
		mob.color = 26
	end
end,
	
click = async(function(player, mob)
	local lootTableCommon = {"copper_ingot", 1, 3, "flaming_ash_board", 1, 3, "golden_cloth", 1, 3, "dark_green_dye", 1, 1, "tan_dye", 1, 1}
	local lootTableUncommon = {"mysterious_text", 1, 1, "celler_glove", 1, 1, "enraged_dwellers_bone", 1, 1, "enchanted_dweller_skull", 1, 1}
	local lootTableRare = {"subterranian_helm", 1, 1, "forgotten_helm", 1, 1, "braided_wrappings", 1, 1, "ancient_cap", 1, 1}
	
	local oddsCommon = 60
	local oddsUncommon = 12
	local oddsRare = 2
	
	if (player.gameRegistry["trapped_soul"] < os.time()) then
		table.insert(lootTableCommon, "trapped_soul")
		table.insert(lootTableCommon, 1)
		table.insert(lootTableCommon, 1)
	end

	local chestOpts = { }
	
	local t = {graphic = convertGraphic(mob.look, "monster"), color = mob.lookColor}
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 0
	
	if (player.state == 1) then
		player:sendMinitext("You cannot do that while dead.")
		return
	end
	
	if(mob.registry["beingOpened"] == 1) then
		player:dialog("Someone is already opening this..", t)
		return
	else
		mob.registry["beingOpened"] = 1
	end
	
	if(player:hasItem("dweller_key", 1)== true) then
		table.insert(chestOpts, "Open with the deweller's key")
	end
	table.insert(chestOpts, "Nevermind..")
	
	local menu1 = player:menuString("Before you sits a chest. It looks quiet old. The edges are worn down and the lock is rusty.", chestOpts)
	
	if(menu1 == "Open with the deweller's key") then
		local r = math.random(100)
		player:removeItem("dweller_key",1)
		if(r <= oddsRare) then
			local picker = (math.random(1,#lootTableRare/3) -1)* 3 + 1
			local amount = math.random(lootTableRare[picker+1], lootTableRare[picker+2])
			local chosenItem = Item(lootTableRare[picker])
			
			player:addItem(chosenItem.yname, amount)
			
			if (#player.group > 1) then
				for i = 1, #player.group do
					if (player.group[i] ~= player.ID) then
						player:msg(4, player.name.." has received "..amount.." "..chosenItem.name.."(s).", player.group[i])
					end
				end
			end
			
			mob:removeHealth(mob.health)
			player:dialogSeq({{graphic = chosenItem.icon, color = chosenItem.iconC}, "In the chest you found "..amount.." "..chosenItem.name.."."}, 1)
		elseif(r <= oddsUncommon) then
			local picker = (math.random(1,#lootTableUncommon/3) -1)* 3 + 1
			local amount = math.random(lootTableUncommon[picker+1], lootTableUncommon[picker+2])
			local chosenItem = Item(lootTableUncommon[picker])
			
			player:addItem(chosenItem.yname, amount)
			
			if (#player.group > 1) then
				for i = 1, #player.group do
					if (player.group[i] ~= player.ID) then
						player:msg(4, player.name.." has received "..amount.." "..chosenItem.name.."(s).", player.group[i])
					end
				end
			end
			
			mob:removeHealth(mob.health)
			player:dialogSeq({{graphic = chosenItem.icon, color = chosenItem.iconC}, "In the chest you found "..amount.." "..chosenItem.name.."."}, 1)
		elseif(r <= oddsCommon) then
			--local chosenItem = Item(lootTableCommon[math.random(1,#lootTableCommon)]) old
			local picker = (math.random(1,#lootTableCommon/3) -1)* 3 + 1
			local amount = math.random(lootTableCommon[picker+1], lootTableCommon[picker+2])
			local chosenItem = Item(lootTableCommon[picker])
			
			
			if (chosenItem.yname == "trapped_soul") then
				player.gameRegistry["trapped_soul"] = os.time() + (20 * 60)
			end
			
			player:addItem(chosenItem.yname, amount)
			
			if (#player.group > 1) then
				for i = 1, #player.group do
					if (player.group[i] ~= player.ID) then
						player:msg(4, player.name.." has received "..amount.." "..chosenItem.name.."(s).", player.group[i])
					end
				end
			end
			
			mob:removeHealth(mob.health)
			player:dialogSeq({{graphic = chosenItem.icon, color = chosenItem.iconC}, "In the chest you found "..amount.." "..chosenItem.name.."."}, 1)
		else
			if (#player.group > 1) then
				for i = 1, #player.group do
					if (player.group[i] ~= player.ID) then
						player:msg(4, player.name.." has broken a key.", player.group[i])
					end
				end
			end
			
			mob.registry["beingOpened"] = 0
			player:dialog("The key breaks in the lock of the chest", t)
		end
	else
		mob.registry["beingOpened"] = 0
		return
	end
end),

move = function(mob, target)
	mob.registry["beingOpened"] = 0
end	
}