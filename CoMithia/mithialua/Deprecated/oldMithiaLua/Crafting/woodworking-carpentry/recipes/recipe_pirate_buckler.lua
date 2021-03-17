recipe_pirate_buckler = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=14}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["carpenter"]<640) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Accomplished Carpenter Required].")
			return
	end
	if(player.registry["recipepiratebuckler"]==1) then
			player:sendMinitext("You already know how to carve a Pirate buckler.")
			return
	end

	player:dialogSeq({t,"Pirate buckler:\n\nA trivial wooden shield.",t,"Requires:\n\n-Accomplished Carpenter\n-40 Ash board\n-10 Tin bar\n-1 Burning rum\n-1000 coins\n\nto be carved."},1)
	local choice=player:menuString2("Do you wish to learn how to Carve a Pirate buckler?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipepiratebuckler"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipecarpenting"]=player.registry["recipecarpenting"]+1
			player:removeItem("recipe_pirate_buckler",1)
			player:dialogSeq({t,"You now know how to carve a Pirate buckler."})
		end	
	end)
}