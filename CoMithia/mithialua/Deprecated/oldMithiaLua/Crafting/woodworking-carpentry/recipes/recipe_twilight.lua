recipe_twilight = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=14}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["carpenter"]<6400) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Talented Carpenter Required].")
			return
	end
	if(player.registry["recipetwilight"]==1) then
			player:sendMinitext("You already know how to carve a Twilight.")
			return
	end

	player:dialogSeq({t,"Twilight:\n\nA Poet's staff.",t,"Requires:\n\n-Talented Carpenter\n-50 Soulstones\n-20 Oak boards\n-20 Cedar boards\n-5 Iron bar\n-1 Gold bar\n-5000 coins\n\nto be carved."},1)
	local choice=player:menuString2("Do you wish to learn how to Carve a Twilight?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			if(player:hasItem("recipe_twilight",1)) then
			player.registry["recipetwilight"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipecarpenting"]=player.registry["recipecarpenting"]+1
			player:removeItem("recipe_twilight",1)
			player:dialogSeq({t,"You now know how to carve a Twilight."})
			end
		end	
	end)
}