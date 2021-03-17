recipe_winters_chill = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=14}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["carpenter"]<840) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Accomplished Carpenter Required].")
			return
	end
	if(player.registry["recipewinterschill"]==1) then
			player:sendMinitext("You already know how to carve a Winter's chill.")
			return
	end

	player:dialogSeq({t,"Winter's Chill:\n\nA staff infused with cold.",t,"Requires:\n\n-Accomplished Carpenter\n-20 Ash board\n-1 Tiger's eye\n-1 Frozen heart\n-500 coins\n\nto be carved."},1)
	local choice=player:menuString2("Do you wish to learn how to Carve a Winter's chill?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			if(player:hasItem("recipe_winters_chill",1)) then
			player.registry["recipewinterschill"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipecarpenting"]=player.registry["recipecarpenting"]+1
			player:removeItem("recipe_winters_chill",1)
			player:dialogSeq({t,"You now know how to carve a Winter's chill."})
			end
		end	
	end)
}