recipe_golden_helm = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=0}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color


	if(player.registry["recipegoldenhelm"]==1) then
			player:sendMinitext("You already how to forge a Golden helmet.")
			return
	end

	player:dialogSeq({t,"Golden helm:\n\nA magical helm.",t,"Requires:\n\n-Accomplished Armorer\n-40 Tin bars\n-5 Tiger's eye\n-1 Burning rum\n-1000 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to forge a Golden helm?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipegoldenhelm"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipearmorsmith"]=player.registry["recipearmorsmith"]+1
			player:removeItem("recipe_golden_helm",1)
			player:dialogSeq({t,"You now know how to forge a Golden helm."})
		end	
	end)
}