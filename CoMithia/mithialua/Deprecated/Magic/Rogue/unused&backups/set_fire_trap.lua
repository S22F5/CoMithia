set_fire_trap = {
	cast=function(player,target)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.magic<300) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		player:addMana(-300)
		player:sendAction(6,35)
		player:addNPC("set_fire_trap",player.m,player.x,player.y)
		player:setAether("set_fire_trap",3000)
	end,
	click=function(target,npc)
			if(target.pvp==true) then			
				if(target.health>1000) then
					target:removeHealth2(1000)
				end
			target:sendAnimation(48)
			target:playSound(63)
			npc:delete()
			else
				if(target.blType==BL_MOB) then			
					if(target.health>1000) then
						target:removeHealth2(1000)
					end
					target:sendAnimation(48)
					target:playSound(63)
				end
			npc:delete()
			end		
	end,
	requirements=function(player)
		local l=52
		local i={0}
		local ia={1000000}
		local d={"Set Fire trap\n\nDeals Fire damage to the target","You l sacrifice 1000000 coins to learn this ability."}
		return l,i,ia,d
	end

}