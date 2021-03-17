share_knowledge = {
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
                player:setAether("share_knowledge",15000)
                end,
		
		requirements=function(player)
		local l=90
		local i={0}
		local ia={1000000}
		local d={"Sage\n\nShares your feelings with the world.","You shall have to sacrifice 1000000 coins to learn this ability"}
		return l,i,ia,d
	end       
}



