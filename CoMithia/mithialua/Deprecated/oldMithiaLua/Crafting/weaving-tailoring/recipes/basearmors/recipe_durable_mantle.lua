recipe_durable_mantle = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=10}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["tailor"]<840) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Accomplished Tailor Required].")
			return
	end
	if(player.registry["recipedurablemantle"]==1) then
			player:sendMinitext("You already how to forge Durable Mantle.")
			return
	end

	player:dialogSeq({t,"Durable Mantle:\n\nA standard poet Mantle.",t,"Requires:\n\n-Accomplished tailor\n-12 Wool fabric\n-6 Romney fabric\n-1000 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to tailor Durable Mantle?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipedurablemantle"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipetailoring"]=player.registry["recipetailoring"]+1
			player:removeItem("recipe_durable_mantle",1)
			player:dialogSeq({t,"You now know how to tailor Durable Mantle."})
		end	
	end)
}