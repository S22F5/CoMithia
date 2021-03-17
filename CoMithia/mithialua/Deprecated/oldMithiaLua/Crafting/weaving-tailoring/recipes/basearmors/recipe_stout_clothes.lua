recipe_stout_clothes = {
	use = async(function(player)
	local opts = { }
	table.insert(opts,"Yes")
	table.insert(opts,"No")

	local t={graphic=convertGraphic(3052,"item"),color=10}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color


	if(player.registry["recipestoutclothes"]==1) then
			player:sendMinitext("You already know how to tailor Stout Clothes.")
			return
	end

	player:dialogSeq({t,"Stout Clothes:\n\nstandard mage Clothes.",t,"Requires:\n\n-2 Wool fabric\n-25 coins\n\nto be tailored."},1)
	local choice=player:menuString2("Do you wish to learn how to tailor Stout Clothes?\n((This action is definitive and will consume your recipe))",opts)
		if(choice=="Yes") then
			player.registry["recipestoutclothes"]=1
			player.registry["totalrecipenumber"]=player.registry["totalrecipenumber"]+1
			player.registry["recipetailoring"]=player.registry["recipetailoring"]+1
			player:removeItem(278,1)
			player:dialogSeq({t,"You now know how to tailor Stout Clothes."})
		end	
	end)
}