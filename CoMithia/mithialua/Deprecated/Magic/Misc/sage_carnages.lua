sage_carnages = {
		cast=function(player,target)
		if(player.m>=2002 and player.m<=2999) then
			local a
			a=player.question
			player:sendAction(6,22)
				for x=2003,2100 do
					player:broadcast(x,"[Host "..player.name.."]:"..player.question)
				end
		else
			player:sendMinitext("You may not use Carnages Sage outside of Carnages")
		end	
                end 
}



