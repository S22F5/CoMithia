recipe_face_smasher = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=17}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color


	if(player.registry["weaponsmith"]<6400) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Talented Bladesmith Required].")
			return
	end
	if(player.registry["recipefacesmasher"]==1) then
			player:sendMinitext("You already know how to forge a Face smasher.")
			return
	end

	player:dialogSeq({t,"Face smasher:\n\nA warrior mace.",t,"Requires:\n\n-Talented Bladesmith\n-50 Soulstones\n-20 Iron bars\n-10 Copper bars\n-1 Gold bar\n-5000 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to Forge a Face smasher?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			if(not player:hasItem("recipe_face_smasher",1)) then
				return
			end
			player.registry["recipefacesmasher"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipebladesmith"]=player.registry["recipebladesmith"]+1
			player:removeItem("recipe_face_smasher",1)
			player:dialogSeq({t,"You now know how to forge a Face smasher."})
		end	
	end)
}