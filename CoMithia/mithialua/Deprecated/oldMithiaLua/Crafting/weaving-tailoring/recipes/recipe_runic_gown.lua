recipe_runic_gown = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=10}
    player.npcGraphic=t.graphic
	player.npcColor=t.color

	if(player.registry["tailor"]<50000) then
		player:sendMinitext("You are not skilled enough to learn this recipe [Expert Tailor Required].")
		return
	end
	if(player.registry["reciperunicgown"]==1) then
		player:sendMinitext("You already how to tailor a Runic gown.")
		return
	end

	player:dialogSeq({t,"Runic gown:\n\nA poet gown infused with runic magic.",t,"Requires:\n\n-Expert tailor\n-300 Runic pendants\n-30 Perendale fabric\n-30 Merino fabric\n-30 Shetland fabric\n-30 Rambouillet fabric\n-10 Tiger's eye\n-100000 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to tailor a Runic gown?\n((This action is definitive and will consume your recipe))",opts)
	if(choice=="Yes") then
		if(player:hasItem("recipe_runic_gown",1)) then
			player.registry["reciperunicgown"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipetailoring"]=player.registry["recipetailoring"]+1
			player:removeItem("recipe_runic_gown",1)
			player:dialogSeq({t,"You now know how to tailor a Runic gown."})
		end
	end	
	end)
}