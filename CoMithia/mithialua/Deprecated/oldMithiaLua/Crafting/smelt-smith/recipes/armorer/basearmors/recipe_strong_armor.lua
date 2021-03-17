recipe_strong_armor = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=0}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color


	if(player.registry["recipestrongarmor"]==1) then
			player:sendMinitext("You already how to forge a Strong Armor.")
			return
	end

	player:dialogSeq({t,"Strong Armor:\n\nA standard rogue armor.",t,"Requires:\n\n-4 Tin bars\n-35 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to forge a Strong Armor?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipestrongarmor"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipearmorsmith"]=player.registry["recipearmorsmith"]+1
			player:removeItem("recipe_strong_armor",1)
			player:dialogSeq({t,"You now know how to forge a Strong Armor."})
		end	
	end)
}