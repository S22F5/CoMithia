recipe_bloodsoaked_claymore = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=17}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color


	if(player.registry["weaponsmith"]<220) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Apprentice Bladesmith Required].")
			return
	end
	if(player.registry["recipebloodsoakedclaymore"]==1) then
			player:sendMinitext("You already know how to forge a Bloodsoaked claymore.")
			return
	end

	player:dialogSeq({t,"Bloodsoaked claymore:\n\nA Claymore soaking in blood.",t,"Requires:\n\n-Apprentice Bladesmith\n-5 Tin bars\n-1 Chrysocolla\n-250 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to Forge a Bloodsoaked claymore?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipebloodsoakedclaymore"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipebladesmith"]=player.registry["recipebladesmith"]+1
			player:removeItem("recipe_bloodsoaked_claymore",1)
			player:dialogSeq({t,"You now know how to forge a Bloodsoaked claymore."})
		end	
	end)
}