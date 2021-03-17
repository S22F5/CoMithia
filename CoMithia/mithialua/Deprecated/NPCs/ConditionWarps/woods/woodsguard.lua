woodsguard = {

	click=async(function(player,npc)
		local t={graphic=convertGraphic(491,"monster"),color=4}
		local opts = { }
		table.insert(opts,"Yes")
		table.insert(opts,"No")
		if(player.registry["icelabyrinthquest"]>=7) then
			table.insert(opts,"Please escort me to the Labyrinth.")
		end
		


		if(player.level<63) then
			player:dialogSeq({t,"I'm sorry, but you don't appear to be strong enough to be let past those gates.",t,"If you want to help the city with the cleaning of the road bandits, come back when you are more experienced."})
		else
			player:dialogSeq({t,"Hey there, you want to help the city? Those roads are infested by bandits, and you seem strong enough to face them."},1)
			local menuOption=player:menuString2("Do you want to access the roads?",opts)
			if menuOption=="Yes" then
				player:warp(1601,3,38)
			elseif menuOption=="No" then
				player:dialogSeq({t,"If you want to help us contain them, come back anytime"})
			elseif menuOption=="Please escort me to the Labyrinth." then
				player:warp(1700,27,20)
			end
		end
	end)
}

woodsguard2 = {

	click=async(function(player,npc)
		local t={graphic=convertGraphic(491,"monster"),color=4}
		local opts = { }
		table.insert(opts,"Yes")
		table.insert(opts,"No")
		if(player.registry["icelabyrinthquest"]>=7) then
			table.insert(opts,"Please escort me to the Labyrinth.")
		end
		


		if(player.level<63) then
			player:dialogSeq({t,"I'm sorry, but you don't appear to be strong enough to be let past those gates.",t,"If you want to help the city with the cleaning of the road bandits, come back when you are more experienced."})
		else
			player:dialogSeq({t,"Hey there, you want to help the city? Those roads are infested by bandits, and you seem strong enough to face them."},1)
			local menuOption=player:menuString2("Do you want to access the roads?",opts)
			if menuOption=="Yes" then
				player:warp(1601,3,38)
			elseif menuOption=="No" then
				player:dialogSeq({t,"If you want to help us contain them, come back anytime"})
			elseif menuOption=="Please escort me to the Labyrinth." then
				player:warp(1700,27,20)
			end
		end
	end)
}