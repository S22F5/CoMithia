hypnotize = {

	cast=function(player,target)

	player:sendMinitext("This spell has been deprecated and does not exist anymore")
	return	

--[[	local calc             
        local r
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

            
		if(player.magic<150) then
			player:sendMinitext("You do not have enough mana.")
			return
		end	

                if(target.blType~=BL_MOB) then
			player:sendMinitext("Something went wrong.")
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
                
		player:sendMinitext("You cast Hypnotize.")
                player:addMana(-150)
                target:setDuration("hypnotize",18000)
                player:setAether("hypnotize",42000)
                target:sendAnimation(251)
                player:playSound(77)
                target.sleep=1.2]]--
                end,

         	uncast=function(player)
	 			player.sleep=0		
		end,

         	recast=function(player)
         	player.sleep=1.2
         	end,

			fix=function(player)
         	player.sleep=1.2
         	end,

	        while_cast=function(player)
                player:sendAnimation(251)
                end,

		on_takedamage=function(target)
			target:setDuration("hypnotize",0)
			target.sleep=0
                end,
           
	requirements=function(player)
		local l=38
		local i={0,15,66,167}
		local ia={1500,10,5,1}
		local d={"Hypnotize\n\nHypotnizes your ennemy. Charm is broken if ennemy is hit.","You shall sacrifice (10) Control Rune, (5) Amethyst, (1) Tainted leaf and 1500 coins to learn this ability"}
		return l,i,ia,d
	end      
}