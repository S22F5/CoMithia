recipe_chrysocolla_ring= {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=3}
    player.npcGraphic=t.graphic
	player.npcColor=t.color
	
	if(player.registry["recipechrysocollaring"]==1) then
			player:sendMinitext("You already know how to craft an Chrysocolla ring.")
			return
	end
	if(player.registry["jewelcrafter"]<220) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Apprentice Jewelcrafter Required].")
			return
	end
	player:dialogSeq({t,"Chrysocolla ring:\n\nA more powerful ring for anyone.",t,"Requires:\n\n-Apprentice Jewelcrafter\n-2 Shining chrysocolla\n-50 coins\n\nto be crafted."},1)
	local choice=player:menuString2("Do you wish to learn how to craft an Chrysocolla ring?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			if(not player:hasItem("recipe_chrysocolla_ring",1)) then
				return
			end
			player.registry["recipechrysocollaring"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipejewelcrafter"]=player.registry["recipejewelcrafter"]+1
			player:removeItem("recipe_chrysocolla_ring",1)
			player:dialogSeq({t,"You now know how to craft an Chrysocolla ring."})
		end	
	end)
}