recipe_fortified_armor = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=0}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color


	if(player.registry["armorer"]<220) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Apprentice Armorer Required].")
			return
	end
	if(player.registry["recipefortifiedarmor"]==1) then
			player:sendMinitext("You already how to forge a Fortified Armor.")
			return
	end

	player:dialogSeq({t,"Fortified Armor:\n\nA standard rogue armor.",t,"Requires:\n\n-Apprentice Armorer\n-10 Tin bars\n-4 Bronze bars\n-500 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to forge a Fortified Armor?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipefortifiedarmor"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipearmorsmith"]=player.registry["recipearmorsmith"]+1
			player:removeItem("recipe_fortified_armor",1)
			player:dialogSeq({t,"You now know how to forge a Fortified Armor."})
		end	
	end)
}