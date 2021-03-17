recipe_cursed_spire = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=14}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["carpenter"]<220) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Apprentice Carpenter Required].")
			return
	end
	if(player.registry["recipecursedspire"]==1) then
			player:sendMinitext("You already know how to carve a Cursed Spire.")
			return
	end

	player:dialogSeq({t,"Cursed Spire:\n\nA magically cursed Spire.",t,"Requires:\n\n-Apprentice Carpenter\n-10 Ash board\n-1 Chrysocolla\n-100 coins\n\nto be carved."},1)
	local choice=player:menuString2("Do you wish to learn how to Carve a Cursed Spire?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			if(player:hasItem("recipe_cursed_spire",1)) then
			player.registry["recipecursedspire"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipecarpenting"]=player.registry["recipecarpenting"]+1
			player:removeItem("recipe_cursed_spire",1)
			player:dialogSeq({t,"You now know how to carve a Cursed Spire."})
			end
		end	
	end)
}