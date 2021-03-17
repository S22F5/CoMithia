recipe_impenetrable_armor_dress = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=0}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["armorer"]<6400) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Talented Armorer Required].")
			return
	end
	if(player.registry["recipeimpenetrablearmordress"]==1) then
			player:sendMinitext("You already how to forge a Impenetrable Armor Dress.")
			return
	end

	player:dialogSeq({t,"Impenetrable Armor Dress:\n\nA standard female rogue Armor Dress.",t,"Requires:\n\n-Talented Armorer\n-15 Copper bars\n-4 Silver bar\n-1500 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to forge a Impenetrable Armor Dress?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
		if(player:hasItem("recipe_impenetrable_armor_dress",1)) then
			player.registry["recipeimpenetrablearmordress"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipearmorsmith"]=player.registry["recipearmorsmith"]+1
			player:removeItem("recipe_impenetrable_armor_dress",1)
			player:dialogSeq({t,"You now know how to forge a Impenetrable Armor Dress."})
		end
		end	
	end)
}