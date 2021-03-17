healing_ray = {
	cast=function(player,target)

	player:sendMinitext("This spell has been deprecated and does not exist anymore")
	return


--[[		local gMember
		local x         
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

			for _,gID in pairs(player.group) do
			local gMember=Player(gID)
			if(gMember.state~=1) then
				if(gMember.m==player.m) then
					gMember:addHealth(500)
					gMember:sendAnimation(66)
						if(gMember.ID~=player.ID) then
							gMember:sendMinitext(player.name .." casts Healing ray on you.")
						end
				end
			end
			end							
			player:playSound(22)
			player:addMana(-210)
			player:setAether("healing_ray",8000)
			player:sendMinitext("You cast Healing ray.")
                        player:sendAction(6,35)
]]--
        end,
	requirements=function(player)
		local l=42
		local i={0,5,15,66}
		local ia={1700,70,5,2}
		local d={"Healing Ray\n\nHeal your group wounds with great magic","You shall sacrifice (70) Chestnut, (5) Control rune, (2) Amethyst and 1700 coins to learn this ability"}
		return l,i,ia,d
	end     
}