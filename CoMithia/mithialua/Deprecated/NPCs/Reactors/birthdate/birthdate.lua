hid000804 = {
	click = async(function(player)
		if player.registry["tut1"]==0 then
			player.registry["tut1"]=1
			player.registry["bday"]=player:curDay()
			player.registry["byear"]=player:curYear()
			player:addLegend("Born in Year " .. player:curYear() .. ", " .. player:getCurSeason() .. ".","bornin",0,128)
			player:dialogSeq({"Welcome to Chronicles of Mithia ALPHA!\n\nPlease keep in mind all all your characters will be wiped once we hop on to beta stage. Many bugs are still present and should be reported."})
			
		end
	end)
}
hid000904 = {
	click = async(function(player)
		if player.registry["tut1"]==0 then
			player.registry["tut1"]=1
			player.registry["bday"]=player:curDay()
			player.registry["byear"]=player:curYear()
			player:addLegend("Born in Year " .. player:curYear() .. ", " .. player:getCurSeason() .. ".","bornin",0,128)
			player:dialogSeq({"Welcome to Chronicles of Mithia ALPHA!\n\nPlease keep in mind all all your characters will be wiped once we hop on to beta stage. Many bugs are still present and should be reported."})
			
		end
	end)
}