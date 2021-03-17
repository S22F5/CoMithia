recipe_fortified_plate_dress = {
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
	if(player.registry["recipefortifiedplatedress"]==1) then
			player:sendMinitext("You already how to forge a Fortified plate Dress.")
			return
	end

	player:dialogSeq({t,"Fortified plate Dress:\n\nA standard warrior Plate Dress.",t,"Requires:\n\n-Apprentice armorer\n-10 Tin bars\n-4 Bronze bar\n-500 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to forge a Fortified Plate Dress?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipefortifiedplatedress"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipearmorsmith"]=player.registry["recipearmorsmith"]+1
			player:removeItem("recipe_fortified_plate_dress",1)
			player:dialogSeq({t,"You now know how to forge a Fortified Plate Dress."})
		end	
	end)
}