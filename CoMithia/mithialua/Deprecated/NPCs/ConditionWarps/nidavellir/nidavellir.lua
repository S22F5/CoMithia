hid281315 = {
	click=async(function(player)
		local opts = {}
		table.insert(opts,"Yes")
		table.insert(opts,"No")


		if(player.level>=92) then
			player:dialogSeq({t,"As you lean on the well, you can see light coming from the bottom. You could dive and see what it is."},1)
			local choice=player:menuString2("Do you wish to dive?",opts)
			if(choice=="Yes") then
				player:sendMinitext("As you reach the bottom, you follow the light and eventually find a Cave complex.")
				player:warp(4001,2,48)
			else
				player:warp(28,13,17)
			end
		else 
                        player:warp(28,13,17)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end)
}

hid281415 = {
	click=async(function(player)
		local opts = {}
		table.insert(opts,"Yes")
		table.insert(opts,"No")

		if(player.level>=92) then
			player:dialogSeq({t,"As you lean on the well, you can see light coming from the bottom. You could dive and see what it is."},1)
			local choice=player:menuString2("Do you wish to dive?",opts)
			if(choice=="Yes") then
				player:sendMinitext("As you reach the bottom, you follow the light and eventually find a Cave complex.")
				player:warp(4001,3,48)
			else
				player:warp(28,14,17)
			end
		else 
                        player:warp(28,14,17)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end)
}