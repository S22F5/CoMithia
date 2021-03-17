recipe_reinforced_clothes = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=10}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color


	if(player.registry["recipereinforcedclothes"]==1) then
			player:sendMinitext("You already how to tailor Reinforced Clothes.")
			return
	end

	player:dialogSeq({t,"Reinforced Clothes:\n\nA standard mage armor.",t,"Requires:\n\n-6 Wool fabric\n-50 coins\n\nto be forged."},1)
	local choice=player:menuString2("Do you wish to learn how to tailor Reinforced Clothes?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipereinforcedclothes"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipetailoring"]=player.registry["recipetailoring"]+1
			player:removeItem("recipe_reinforced_clothes",1)
			player:dialogSeq({t,"You now know how to tailor Reinforced Clothes."})
		end	
	end)
}