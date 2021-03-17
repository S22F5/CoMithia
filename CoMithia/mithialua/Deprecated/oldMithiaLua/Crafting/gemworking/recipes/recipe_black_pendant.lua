recipe_black_pendant = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=3}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["jewelcrafter"]<840) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Accomplished Jewelcrafter Required].")
			return
	end
	if(player.registry["recipeblackpendant"]==1) then
			player:sendMinitext("You already know how to craft a Black pendant.")
			return
	end

	player:dialogSeq({t,"Black pendant:\n\nA rogue pendant infused with darkness.",t,"Requires:\n\n-Accomplished Jewelcrafter\n-25 Soulstones\n-20 Shining Chrysocollas\n-10 Shining Amethysts\n-5 Experience gems\n-5000 coins\n\nto be crafted."},1)
	local choice=player:menuString2("Do you wish to learn how to Craft a Black pendant?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			if(not player:hasItem("recipe_black_pendant",1)) then
				return
			end
			player.registry["recipeblackpendant"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipejewelcrafter"]=player.registry["recipejewelcrafter"]+1
			player:removeItem("recipe_black_pendant",1)
			player:dialogSeq({t,"You now know how to Craft a Black pendant."})
		end	
	end)
}