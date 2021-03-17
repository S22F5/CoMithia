recipe_rugged_armor = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=0}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color


	if(player.registry["armorer"]<2200) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Adept Armorer Required].")
			return
	end
	if(player.registry["reciperuggedarmor"]==1) then
			player:sendMinitext("You already how to forge a Rugged Armor.")
			return
	end

	player:dialogSeq({t,"Rugged Armor:\n\nA standard rogue Armor.",t,"Requires:\n\n-Adept Armorer\n-10 Copper bars\n-1 Silver bar\n-1200 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to forge a Rugged Armor?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
		if(player:hasItem("recipe_rugged_armor",1)) then
			player.registry["reciperuggedarmor"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipearmorsmith"]=player.registry["recipearmorsmith"]+1
			player:removeItem("recipe_rugged_armor",1)
			player:dialogSeq({t,"You now know how to forge a Rugged Armor."})
		end
		end	
	end)
}