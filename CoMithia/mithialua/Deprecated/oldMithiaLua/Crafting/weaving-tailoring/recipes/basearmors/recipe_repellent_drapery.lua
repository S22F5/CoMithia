recipe_repellent_drapery = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=10}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["tailor"]<2200) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Adept Tailor Required].")
			return
	end
	if(player.registry["reciperepellentdrapery"]==1) then
			player:sendMinitext("You already how to forge Repellent Drapery.")
			return
	end

	player:dialogSeq({t,"Repellent Drapery:\n\nA standard female poet Drapery.",t,"Requires:\n\n-Adept tailor\n-12 Perendale fabric\n-2 Shetland fabric\n-1200 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to tailor a Repellent Drapery?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
		if(player:hasItem("recipe_repellent_drapery",1)) then
			player.registry["reciperepellentdrapery"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipetailoring"]=player.registry["recipetailoring"]+1
			player:removeItem("recipe_repellent_drapery",1)
			player:dialogSeq({t,"You now know how to tailor a Repellent Drapery."})
		end
		end	
	end)
}