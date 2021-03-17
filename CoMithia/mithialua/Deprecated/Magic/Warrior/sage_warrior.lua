sage_warrior = {
		cast=function(player,target)
		if(player.magic<30) then
			player:sendMinitext("You do not have enough mana.")
                        return
		end

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		local a
		a=player.question
		player:sendAction(6,22)
		player:broadcast(-1,"["..player.name.."]:"..player.question)
                player:setAether("sage_warrior",300000)
                end,
		
		requirements=function(player)
		local l=90
		local i={0,466}
		local ia={25000,10}
		local d={"Sage\n\nShares your feelings with the world.","You shall have to sacrifice (10) Bottled rum and 25000 coins to learn this ability"}
		return l,i,ia,d
	end       
}



