recipe_durable_plate_dress = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=0}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

	if(player.registry["armorer"]<840) then
			player:sendMinitext("You are not skilled enough to learn this recipe [Accomplished Armorer Required].")
			return
	end
	if(player.registry["recipedurableplatedress"]==1) then
			player:sendMinitext("You already how to forge a Durable Plate Dress.")
			return
	end

	player:dialogSeq({t,"Durable Plate Dress:\n\nA standard female warrior Plate Dress.",t,"Requires:\n\n-Accomplished Armorer\n-12 Tin bars\n-6 Bronze bars\n-1000 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to forge a Durable Plate Dress?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipedurableplatedress"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipearmorsmith"]=player.registry["recipearmorsmith"]+1
			player:removeItem("recipe_durable_plate_dress",1)
			player:dialogSeq({t,"You now know how to forge a Durable Plate Dress."})
		end	
	end)
}