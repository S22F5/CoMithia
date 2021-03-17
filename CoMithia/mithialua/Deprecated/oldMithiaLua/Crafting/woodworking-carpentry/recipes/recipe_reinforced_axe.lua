recipe_reinforced_axe = {
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
	if(player.registry["recipereinforcedaxe"]==1) then
			player:sendMinitext("You already know how to carve a Reinforced axe.")
			return
	end

	player:dialogSeq({t,"Reinforced axe:\n\nA woodcutting axe for T3 and below.",t,"Requires:\n\n-Talented Carpenter\n-20 Cedar board\n-20 Copper bars\n-5 Soulstones\n-1000 coins\n\nto be carved."},1)
	local choice=player:menuString2("Do you wish to learn how to carve a Reinforced axe?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			if(player:hasItem("recipe_reinforced_axe",1)) then
			player.registry["recipereinforcedaxe"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipecarpenting"]=player.registry["recipecarpenting"]+1
			player:removeItem("recipe_reinforced_axe",1)
			player:dialogSeq({t,"You now know how to carve a Reinforced mining pick."})
			end
		end	
	end)
}