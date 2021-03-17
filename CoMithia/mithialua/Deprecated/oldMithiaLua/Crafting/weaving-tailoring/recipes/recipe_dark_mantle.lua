recipe_dark_mantle = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=10}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["tailor"]<18000) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Skilled Tailor Required].")
			return
	end
	if(player.registry["recipedarkmantle"]==1) then
			player:sendMinitext("You already how to tailor a Dark mantle.")
			return
	end

	player:dialogSeq({t,"Dark mantle:\n\nA poet Mantle infused with Darkness.",t,"Requires:\n\n-Skilled tailor\n-Impenetrable mantle\n-100 Soulstones\n-20 Perendale fabric\n-10 Merino fabric\n-5 Shetland fabric\n-1 Rambouillet fabric\n-5000 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to tailor a Dark Mantle?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
		if(player:hasItem("recipe_dark_mantle",1)) then
			player.registry["recipedarkmantle"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipetailoring"]=player.registry["recipetailoring"]+1
			player:removeItem("recipe_dark_mantle",1)
			player:dialogSeq({t,"You now know how to tailor a Dark mantle."})
		end
		end	
	end)
}