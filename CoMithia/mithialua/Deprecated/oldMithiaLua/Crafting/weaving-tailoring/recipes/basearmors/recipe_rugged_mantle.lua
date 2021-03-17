recipe_rugged_mantle = {
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
	if(player.registry["reciperuggedmantle"]==1) then
			player:sendMinitext("You already how to forge Rugged Mantle.")
			return
	end

	player:dialogSeq({t,"Rugged Mantle:\n\nA standard poet Mantle.",t,"Requires:\n\n-Adept tailor\n-10 Perendale fabric\n-1 Shetland fabric\n-1200 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to tailor Rugged Mantle?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
		if(player:hasItem("recipe_rugged_mantle",1)) then
			player.registry["reciperuggedmantle"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipetailoring"]=player.registry["recipetailoring"]+1
			player:removeItem("recipe_rugged_mantle",1)
			player:dialogSeq({t,"You now know how to tailor Rugged Mantle."})
		end
		end	
	end)
}