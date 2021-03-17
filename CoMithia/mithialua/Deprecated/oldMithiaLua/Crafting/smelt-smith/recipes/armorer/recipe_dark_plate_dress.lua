recipe_dark_plate_dress = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=0}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["armorer"]<18000) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Skilled Armorer Required].")
			return
	end
	if(player.registry["recipedarkplatedress"]==1) then
			player:sendMinitext("You already how to forge a Dark Plate Dress.")
			return
	end

	player:dialogSeq({t,"Dark Platemail:\n\nA female warrior Plate Dress infused by Darkness.",t,"Requires:\n\n-Skilled Armorer\n-Impenetrable Plate Dress\n-100 Soulstones\n-20 Copper bars\n-10 Iron bars\n-5 Silver bar\n-1 Gold bar\n-5000 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to forge a Dark Armor Dress?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
		if(player:hasItem("recipe_dark_plate_dress",1)) then
			player.registry["recipedarkplatedress"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipearmorsmith"]=player.registry["recipearmorsmith"]+1
			player:removeItem("recipe_dark_plate_dress",1)
			player:dialogSeq({t,"You now know how to forge a Dark Plate Dress."})
		end
		end	
	end)
}