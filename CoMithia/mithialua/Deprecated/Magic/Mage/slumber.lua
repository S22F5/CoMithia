slumber = {

       cast=function(player,target)
            local calc             
            local r
	    local m
            	if(player.state==1) then
		        player:sendMinitext("Spirits can't do that.")	
                        return
		end
		if(target.state==1) then
			player:sendMinitext("Something went wrong.")
			return
		end
            
		if(player.magic<300) then
			player:sendMinitext("You do not have enough mana.")
			return
		end	

          	if(target:hasDuration("hypnotize")) then
	 	        player:sendMinitext("Hypnotize is already in effect.")
			return
		end
		if(target:hasDuration("slumber")) then
		        player:sendMinitext("Slumber is already in effect.")
			return
                end
                

		m=37-(player.will/32)
		if(target.blType==BL_MOB) then
			player:sendMinitext("You cast Slumber.")
                	player:addMana(-300)
                	calc=((player.will/6))*1000
			target:setDuration("Slumber",calc)
                	if(player.will>90 and player.will<110) then
				player:setAether("slumber",34000)
                	elseif(player.will>=110) then
                        	player:setAether("slumber",28000)
                	else
                        	player:setAether("slumber",37000)
                	end
                target:sendAnimation(130)
		player:sendAction(6,35)
                player:playSound(305)
                target.sleep=1.6
		end
		if(target.blType==BL_PC) then
			if(player.pvp==true) then
				player:sendMinitext("You cast Slumber.")
				target:sendMinitext(player.name .." casts Slumber on you.")
                		player:addMana(-300)
                		calc=((player.will/6))*1000
				target:setDuration("Slumber",calc)
                		if(player.will>90 and player.will<110) then
					player:setAether("slumber",34000)
                		elseif(player.will>=110) then
                       			player:setAether("slumber",28000)
               			else
             	          		player:setAether("slumber",37000)
                		end
                		target:sendAnimation(130)
                		player:playSound(305)
				player:sendAction(6,35)
               			target.sleep=1.6
			else
				player:sendMinitext("Something went wrong.")
			end
		end		
                end,

         	uncast=function(player)
	 			player.sleep=0
         	end,

         	recast=function(player)
			player.sleep=1.6
      		end,

		fix=function(player)
			player.sleep=1.6
      		end,

	        while_cast=function(player)
                player:sendAnimation(130)
                end,

		on_takedamage=function(target)
			target:setDuration("slumber",0)
			target.sleep=0
			--target:talk(0,"debug")
                end,
           
                requirements=function(player)
		local l=84
		local i={0,350}
		local ia={5000,5}
		local d={"Slumber\n\nDozes your ennemy, preventing him from moving and making it easier to hit. Duration and Aether depends on will","You shall sacrifice (5) Snake meat and 5000 coins to learn this ability"}
		return l,i,ia,d
	        end       
}