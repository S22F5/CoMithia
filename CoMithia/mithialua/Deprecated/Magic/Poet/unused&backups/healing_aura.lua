healing_aura = {
	cast=function(player,target)         
		local gMember
		local calc
		local magic                

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
			gMember=Player(gID)
		     	if(gMember.state~=1) then
				if(gMember.m==player.m) then
					 if(gMember.ID~=player.ID) then
							gMember:sendAnimation(107)
							gMember:setDuration("healing_aura",10000)
							gMember:sendMinitext(player.name .." casts Healing Aura on you.")
					 end
				end
			end
		        end
			player:playSound(70)
			player:addMana(-210)
			player:setAether("healing_aura",280000)
			player:sendMinitext("You cast Healing Aura.")
                        player:sendAction(6,45)               
        end,
	while_cast=function(player)
		local vit
		
		player:sendAnimation(107)			
		vit=player.maxHealth/10
		player:addHealth2(vit)
	end,
	uncast=function(player)
	end,
requirements=function(player)
		local l=87
		local i={0}
		local ia={1000000}
		local d={"Healing Aura\n\nSlowly regenerates your whole group","You shall have to sacrifice 1000000 coins to learn this ability"}
		return l,i,ia,d
	end       
}