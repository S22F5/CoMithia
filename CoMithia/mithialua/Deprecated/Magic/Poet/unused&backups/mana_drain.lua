mana_drain = {
	cast=function(player,target)  

	player:sendMinitext("This spell has been deprecated and does not exist anymore")
	return


       
--[[		local calc
		local m
		local gMember               

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
	             calc=0
		     for _,gID in pairs(player.group) do
	             gMember=Player(gID)
		    	if(gMember.state~=1) then
				if(gMember.m==player.m) then
					  if(gMember.ID~=player.ID) then
	               				gMember:sendAnimation(76)
						gMember:sendMinitext(player.name .." casts Mana drain on you.")
						m=gMember.magic*0.25
						gMember:addMana(-m)
						calc=calc+m
					  end
				end
			end
		     end
			player:sendAnimation(78)
			player:playSound(729)
			player:addMana(calc)
			player:setAether("mana_drain",24000)
			player:sendMinitext("You cast Mana drain.")
                        player:sendAction(6,35)
]]--
        end,
	requirements=function(player)
		local l=47
		local i={0,5,244,246}
		local ia={2000,80,2,1}
		local d={"Mana drain\n\nDrain energy from your group to yourself","You shall sacrifice (80) Chestnut, (2) Vial of blood, (1) Blue stinger and 2000 coins to learn this ability"}
		return l,i,ia,d
	end       
}