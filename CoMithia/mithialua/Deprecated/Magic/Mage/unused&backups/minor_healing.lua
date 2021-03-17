minor_healing = {
	cast=function(player,target)

		player:sendMinitext("This spell has been deprecated and doesn't exist anymore")
		return


--[[		if(player.magic<200) then
			player:sendMinitext("You don't have enough Mana.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end        
                if(player.state~=1) then            
                  if(target.state~=1) then
                     target:addHealth(250)
                     target:sendAnimation(66)
                     player:playSound(92)
                     player:addMana(-200)  
                     player:sendMinitext("You cast Minor healing.")
                     player:sendAction(6,35)
                     player:setAether("minor_healing",5000)   
                   else player:sendMinitext("The injuries are too deep to be healed this way")
                   end
                else player:sendMinitext("Spirits can't do that.")
                end]]--
        end,
	requirements=function(player)
		local l=20
		local i={0,5,24,27}
		local ia={300,100,2,1}
		local d={"Minor healing\n\nA Minor healing spell to help allies","You shall have to sacrifice (100) Chestnut, (2) Spiked brew, (1) Magical powder and 300 coins to learn this ability"}
		return l,i,ia,d
	end       
}