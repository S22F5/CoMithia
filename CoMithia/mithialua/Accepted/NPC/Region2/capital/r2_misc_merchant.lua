r2_misc_merchant = {
click = async(function(player,npc)
	local t = {graphic = convertGraphic(837, "monster"), color = 0}
	local opts = {"Buy", "Sell", "Inventory"}
	local optsbuy = {}
	local menuOption
	local menuOptionBuy
	local buyitemsMaster = {500000004, 500000005,500000006, 500000007, 500000008, 680000001, 680000002, 680000003, 680000004, 680000005, 600000001, 600000002, 600000003, 600000004, 600000005}
	local sellitems = {500000004, 500000005, 500000006, 500000007, 500000008, 680000001, 680000002, 680000003, 680000004, 680000005, 600000001, 600000002, 600000003, 600000004, 600000005}
	local dyes = {6001, 6002, 6003, 6004}--{6005, 6006, 6007, 6008, 6009, 6010, 6011, 6012, 6013, 6014, 6015, 6016, 6017, 6018, 6019, 6020, 6021, 6022 ,6023, 6024, 6025, 6026, 6027, 6028, 6029, 6030}
	local alldyes = {6001, 6002, 6003, 6004}--, 6005, 6006, 6007, 6008, 6009, 6010, 6011, 6012, 6013, 6014, 6015, 6016, 6017, 6018, 6019, 6020, 6021, 6022 ,6023, 6024, 6025, 6026, 6027, 6028, 6029, 6030}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 0

	player:dialogSeq({t, "Out of stock.",
	"It seems there is some sort of issue with suppliers."}, 1)
	--[[COMMENT OUT FOR NOW
	if(npc.registry["refreshTime"] <= os.time()) then
		buyitems = { }
		npc.registry["refreshTime"] = os.time() + math.random(1200, 14400)
		for i = 1, math.random(0, math.ceil(#buyitemsMaster/2)) do
			local addedItem = buyitemsMaster[math.random(1,#buyitemsMaster)]
			table.insert(buyitems, addedItem)
		end
		
		if(math.random(0,2) == 0) then
			for i = 1, math.random(0,2) do
				table.insert(buyitems, dyes[math.random(1,#dyes)])
			end
		end
	end
	
	if (#opts ~= 0) then
		menuOption = player:menuString("I have traveled mithia to bring the best deals here to you!", opts)
		
		if (menuOption == "Buy") then
			if(#buyitems == 0) then
				player:dialog("I'm sorry, but I have nothing to offer you right now.", t)
			else
				player:buyExtend("What would you like to buy?.", buyitems)
			end
		elseif (menuOption == "Sell") then
			player:sellExtend("What do you wish to sell?", sellitems)
		elseif (menuOption == "Inventory") then
			if((npc.registry["refreshTime"] - os.time()) < 3600) then
				player:dialog("I am always getting new inventory! Check back in "..math.ceil((npc.registry["refreshTime"] - os.time())/60).." minutes or so!", t)
			else
				player:dialog("I am always getting new inventory! Check back in "..(math.ceil((npc.registry["refreshTime"] - os.time())/360)/10).." hours or so!", t)
			end
		elseif (menuOption == "All dyes") then
			player:buyExtend("RICK JAMES BITCH", alldyes)
		end
	end
	]]--
end)
}