liberate = {
	cast=function(player,target)
		
                if(player.state==1) then
                    player:sendMinitext("Spirits can't do that.")
                    return
                end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
                
                if(player.magic<80) then
                    player:sendMinitext("You do not have enough mana.")
                    return
                end
               

		player:sendAction(6,22)
                target:sendAnimation(70)
                player:playSound(60)
                player:addMana(-80)
                if(target:hasDuration("stop")) then
			target:setDuration("stop",0)
		end
                player:sendMinitext("You cast Liberate.")                        
	
        end,

	requirements=function(player)
		local l=58
		local i={0,61}
		local ia={2500,5}
		local d={"Liberate\n\nFrees your target from Stop paralyzis","You shall have to sacrifice (5) Chrysocolla and 2500 coins to learn this ability"}
		return l,i,ia,d
	end       
}