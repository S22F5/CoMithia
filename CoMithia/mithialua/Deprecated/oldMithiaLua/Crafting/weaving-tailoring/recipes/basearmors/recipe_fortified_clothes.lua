recipe_fortified_clothes = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=10}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["tailor"]<220) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Apprentice Tailor Required].")
			return
	end
	if(player.registry["recipefortifiedclothes"]==1) then
			player:sendMinitext("You already how to forge Fortified Clothes.")
			return
	end

	player:dialogSeq({t,"Fortified Clothes:\n\nA standard mage armor.",t,"Requires:\n\n-Apprentice tailor\n-10 Wool fabric\n-4 Romney fabric\n-500 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to tailor Fortified Clothes?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipefortifiedclothes"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipetailoring"]=player.registry["recipetailoring"]+1
			player:removeItem("recipe_fortified_clothes",1)
			player:dialogSeq({t,"You now know how to tailor Fortified Clothes."})
		end	
	end)
}