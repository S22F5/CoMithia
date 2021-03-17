purge_infection = {

		cast=function(player,target)

			if(player.state==1) then
				player:sendMinitext("Spirits can't do that.")
				return
			end
			if(player.state==3) then
				player:sendMinitext("You can not cast this spell on a mount.")
				return
			end

			if(not target:hasDuration("infection")) then
				target:sendAnimation(57)
				target:playSound(25)
				player:sendAction(6,22)
                                return
                        end
                       
			if(player.magic<40) then
				target:sendMinitext("You do not have enough mana.")
				return
			end

			target:sendAnimation(57)
			target:playSound(25)
                        target:setDuration("infection",0)
                        player:addMana(-40)
			player:sendMinitext("You cast Purge Infection.")
                        player:setAether("purge_infection",3000)
			player:sendAction(6,35)
                        
		end,

		requirements=function(player)
		local l=51
		local i={0}
		local ia={1000000}
		local d={"Purge Infection\n\nRemoves Infection from target.","You shall have to sacrifice 1000000 coins to learn this ability"}
		return l,i,ia,d
           	
		end       
}