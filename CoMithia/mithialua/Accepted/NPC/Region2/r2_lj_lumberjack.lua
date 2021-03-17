r2_lj_lumberjack = {
click = async(function(player,npc)
	local npcG = {graphic = 0, color = 0}
	local buyOpts = {1000000400, 1000000403}
	local sellOpts = {}
	player.npcGraphic = npcG.graphic
	player.npcColor= npcG.color
	player.dialogType = 1
	
	--Shields
	table.insert(sellOpts, 300000001)
	table.insert(sellOpts, 300000002)
	table.insert(sellOpts, 300000003)
	table.insert(sellOpts, 300000004)
	table.insert(sellOpts, 300000005)
	table.insert(sellOpts, 300000006)
	--Blades
	table.insert(sellOpts, 22200000)
	table.insert(sellOpts, 22200001)
	table.insert(sellOpts, 22900000)
	table.insert(sellOpts, 22900001)
	table.insert(sellOpts, 23600000)
	table.insert(sellOpts, 23600001)
	table.insert(sellOpts, 24300000)
	table.insert(sellOpts, 24300001)
	--Staves
	table.insert(sellOpts, 32200000)
	table.insert(sellOpts, 32200001)
	table.insert(sellOpts, 32900000)
	table.insert(sellOpts, 32900001)
	table.insert(sellOpts, 33600000)
	table.insert(sellOpts, 33600001)
	table.insert(sellOpts, 34300000)
	table.insert(sellOpts, 34300001)
	
	local menu
	local options = {}
	
	if (#buyOpts > 0) then
		table.insert(options, "Buy")
	end
	
	if (#sellOpts > 0) then
		table.insert(options, "Sell")
	end
	
	menu = player:menuString("Work that wood!", options)
	if (menu == "Buy") then
		player:buyExtend("What do you need?", buyOpts)
	elseif (menu == "Sell") then
		player:sellExtend("What do you sell?", sellOpts)
	end
end)
}