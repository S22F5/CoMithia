recipe_amethyst_necklace= {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=3}
    player.npcGraphic=t.graphic
	player.npcColor=t.color
	
	if(player.registry["recipeamethystnecklace"]==1) then
			player:sendMinitext("You already know how to craft an Amethyst necklace.")
			return
	end
	if(player.registry["jewelcrafter"]<25) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Novice Jewelcrafter Required].")
			return
	end
	player:dialogSeq({t,"Amethyst necklace:\n\nA basic necklace for anyone.",t,"Requires:\n\n-Novice Jewelcrafter\n-2 Shining Amethyst\n-10 coins\n\nto be crafted."},1)
	local choice=player:menuString2("Do you wish to learn how to craft an Amethyst necklace?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			if(not player:hasItem("recipe_amethyst_necklace",1)) then
				return
			end
			player.registry["recipeamethystnecklace"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipejewelcrafter"]=player.registry["recipejewelcrafter"]+1
			player:removeItem("recipe_amethyst_necklace",1)
			player:dialogSeq({t,"You now know how to craft an Amethyst necklace."})
		end	
	end)
}