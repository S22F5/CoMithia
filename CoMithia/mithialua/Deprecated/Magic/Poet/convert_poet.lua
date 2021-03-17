convert_poet = {
         cast=function(player,target)
                local v=player.health
                local w=player.maxHealth
                local m=player.maxMagic
                local n=player.magic
                local calc
                local calc2
                local calc3
                local calc4
                
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
	        end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

                if(player.magic<30) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		

		  	 player:sendAnimation(121)
                   	 player:addMana(10000000)
                   	 calc=m-n
			 calc=0.33*calc
                                 if(v-calc<=100) then
                        		 player:addHealth2(-v+100)
                                 else 
					 player:addHealth2(-calc)
                                 end
                        player:sendMinitext("You cast Convert.")
                        player:playSound(26)
			if(player:hasDuration("suggestion")) then
				player:setAether("convert_poet",12000)
			else
				player:setAether("convert_poet",20000)
			end
			player:sendAction(6,40)
          end,
          uncast=function(player)
      	  end,
          recast = function(player)
          end,
          requirements=function(player)
		local l=11
		local i={0,5,6}
		local ia={100,50,1}
		local d={"Convert\n\nConverts some of your vitality into energy","You shall have to sacrifice (50) Chestnut, (1) Squirrel's fur and 100 coins to learn this ability"}
		return l,i,ia,d
	        end       
}