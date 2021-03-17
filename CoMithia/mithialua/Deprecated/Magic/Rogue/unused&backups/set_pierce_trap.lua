set_pierce_trap = {
	cast=function(player,target)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		if(player.magic<420) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		player:addMana(-420)
		player:sendAction(6,35)
		player:addNPC("set_pierce_trap",player.m,player.x,player.y)
		player:setAether("set_pierce_trap",3000)
	end,
	click=function(target,npc)
			if(target.pvp==true) then			
				if(target.health>2300) then
					target:removeHealth2(2300)
				end
			target:sendAnimation(89)
			target:playSound(8)
			npc:delete()
			else
				if(target.blType==BL_MOB) then			
					if(target.health>2300) then
						target:removeHealth2(2300)
					end
					target:sendAnimation(89)
					target:playSound(8)
				end
			npc:delete()
			end		
	end,
	requirements=function(player)
		local l=77
		local i={0}
		local ia={1000000}
		local d={"Set Pierce trap\n\nDeals heavy damage to the target","You l sacrifice 1000000 coins to learn this ability."}
		return l,i,ia,d
	end

}