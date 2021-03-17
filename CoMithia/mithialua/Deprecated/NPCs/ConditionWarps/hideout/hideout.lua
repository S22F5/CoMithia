hid435976 = {
	click=function(player)
		if(player.level>=86) then
			player:warp(1901,11,13)
		else 
                        player:warp(43,59,78)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid436076 = {
	click=function(player)
		if(player.level>=86) then
			player:warp(1901,12,13)
		else 
                        player:warp(43,60,78)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid435796 = {
	click=async(function(player)
		local opts = { }
		table.insert(opts,"Yes")
		table.insert(opts,"No")

		player.npcGraphic=0
		player.npcColor=0
	
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end	

		local choice=player:menuString2("Do you wish to return to the harbor?",opts)
			if(choice=="Yes") then
				player:warp(43,21,155)
				player:dialogSeq({"You use the boat and return to safety in the harbor"})
			else
				player:warp(43,57,95)
				player:dialogSeq({"Suit yourself"})
			end
	end)
}

hid19072912 = {
	click=function(player)

		player:sendMinitext("You fall down a slippery slope")
		player:warp(1908,1,12)

	end
}

hid1907294 = {
	click=function(player)

		player:sendMinitext("It's too slick to climb up!")

	end
}

hid190805 = {
	click=function(player)

		player:sendMinitext("You fall down a slippery slope")
		player:warp(1907,28,4)

	end
}

hid1908012 = {
	click=function(player)

		player:sendMinitext("It's too slick to climb up!")

	end
}