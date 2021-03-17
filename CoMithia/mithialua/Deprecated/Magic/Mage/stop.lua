stop = {

       cast=function(player,target)
            local calc             

                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
            
		if(player.magic<210) then
			player:sendMinitext("You do not have enough mana.")
			return
		end	

                if(target.blType~=BL_MOB) then
			player:sendMinitext("Something went wrong.")
			return
		end
			
		if(target:hasDuration("freeze")) then
			player:sendMinitext("Freeze is already in effect.")
			return
                end
                if(target:hasDuration("stop")) then
                        player:sendMinitext("Stop is already in effect.")
                        return     
                end
		if(target.paralyzed==true) then
			player:sendMinitext("The target is already paralyzed.")
			return
		end


                calc=((player.will/5)+10)*1000
                player:addMana(-210)
                player:sendAction(6,35)
        	target:sendAnimation(191)
		target.paralyzed=true
                target:setDuration("stop",calc)
                	if(player.will>74 and player.will<110) then
				if(player:hasDuration("suggestion")) then
					player:setAether("stop",3000)
				else                         
                			player:setAether("stop",4000)
				end
                	elseif(player.will>=110) then
				if(player:hasDuration("suggestion")) then
					player:setAether("stop",2000)
				else    
                		player:setAether("stop",3000)
				end
                	else
				if(player:hasDuration("suggestion")) then
					player:setAether("stop",5000)
				else    
                		player:setAether("stop",6000)
				end
                	end
                player:sendMinitext("You cast Stop.")
                player:playSound(735)
                       
               	end,
         	uncast=function(player)
		player.paralyzed=false
         	end,
         	recast=function(player)
			
         	player.paralyzed=true
         	end,
         	requirements=function(player)
		local l=64
		local i={0}
		local ia={1000000}
		local d={"Stop\n\nParalyzes your enemmy. Duration and aether depends on your will","You shall sacrifice 1000000 coins to learn this ability"}
		return l,i,ia,d
	 end       
}