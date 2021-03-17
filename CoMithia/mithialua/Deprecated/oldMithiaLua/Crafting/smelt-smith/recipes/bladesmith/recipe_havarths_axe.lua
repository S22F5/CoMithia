recipe_havarths_axe = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=17}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color


	if(player.registry["recipehavarthsaxe"]==1) then
			player:sendMinitext("You already know how to forge a Havarth's axe.")
			return
	end

	player:dialogSeq({t,"Havarth's axe:\n\nReforge Havarth's axe from it's remains.",t,"Requires:\n\n-2 Tin bars\n-Havarth's broken axe\n-5 Amethyst\n-70 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to Forge a Havarth's axe?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipehavarthsaxe"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipebladesmith"]=player.registry["recipebladesmith"]+1
			player:removeItem("recipe_havarths_axe",1)
			player:dialogSeq({t,"You now know how to forge a Havarth's axe."})
		end	
	end)
}