recipe_frostbane = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=17}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["weaponsmith"]<840) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Accomplished Bladesmith Required].")
			return
	end
	if(player.registry["recipefrostbane"]==1) then
			player:sendMinitext("You already know how to forge a Frostbane.")
			return
	end

	player:dialogSeq({t,"Frostbane:\n\nA Blade infused with cold.",t,"Requires:\n\n-Accomplished Bladesmith\n-10 Tin bars\n-2 Chrysocolla\n-1 Tiger's eye\n-1 Frozen heart\n-500 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to Forge a Frostbane?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipefrostbane"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipebladesmith"]=player.registry["recipebladesmith"]+1
			player:removeItem("recipe_frostbane",1)
			player:dialogSeq({t,"You now know how to forge a Frostbane."})
		end	
	end)
}