freeze = {

       cast=function(player,target)
            local calc             
            local r
            	if(player.state==1) then
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

            
		if(player.magic<100) then
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

           local calc=math.random(1,30)
           if(player.will<30) then
           	if(player.will>calc) then
                     player:sendAction(6,35)
        	    		target:sendAnimation(91)
			    target.paralyzed=true
                     target:setDuration("freeze",10000)
                     player:setAether("freeze",7000)
                      player:sendMinitext("You cast Freeze.")
                      player:playSound(735)
            else
			 player:sendMinitext("You didn't focus enough.")
            end
           else
			r=math.random(1,85)
	           if(r<=85) then
                       player:sendAction(6,35)
        	    		target:sendAnimation(91)
			 	target.paralyzed=true
                        target:setDuration("freeze",10000)
                        player:setAether("freeze",7000)
                        player:sendMinitext("You cast Freeze.")
                        player:playSound(735)
			else
				 player:sendMinitext("You didn't focus enough.")
                  end
           end
           
           player:addMana(-70)
         
         end,
         uncast=function(player)
	 player.paralyzed=false
         end,
         recast=function(player)
         player.paralyzed=true
         end,
         requirements=function(player)
		local l=12
		local i={0,5,7,14}
		local ia={100,50,50,1}
		local d={"Freeze\n\nParalyzes your enemmy for a short period of time","You shall sacrifice (50) Chestnut, (50) Peas, (1) Helm of Control, and 100 coins to learn this ability"}
		return l,i,ia,d
	 end       
}