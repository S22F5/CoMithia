recipe_runic_robes = {
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
	if(player.registry["reciperunicrobes"]==1) then
		player:sendMinitext("You already how to tailor a Runic robes.")
		return
	end

	player:dialogSeq({t,"Runic robes:\n\nA poet robe infused with runic magic.",t,"Requires:\n\n-Expert tailor\n-300 Runic pendants\n-30 Perendale fabric\n-30 Merino fabric\n-30 Shetland fabric\n-30 Rambouillet fabric\n-10 Tiger's eye\n-100000 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to tailor a Runic robes?\n((This action is definitive and will consume your recipe))",opts)
	if(choice=="Yes") then
		if(player:hasItem("recipe_runic_robes",1)) then
			player.registry["reciperunicrobes"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipetailoring"]=player.registry["recipetailoring"]+1
			player:removeItem("recipe_runic_robes",1)
			player:dialogSeq({t,"You now know how to tailor a Runic robes."})
		end
	end	
	end)
}