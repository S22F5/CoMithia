set_doze_trap = {
	cast=function(player,target)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.magic<420) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		player:addMana(-420)
		player:sendAction(6,35)
		player:addNPC("set_doze_trap",player.m,player.x,player.y)
		player:setAether("set_doze_trap",5000)
	end,
	click=function(target,npc)
			if(target.pvp==true) then			
				if(target.paralyzed==false) then
					target.paralyzed=true
					target:setDuration("slumber",23000)
				end
			target:sendAnimation(130)
			target:playSound(130)
			npc:delete()
			else
				if(target.blType==BL_MOB) then			
					if(target.paralyzed==false) then
						target.paralyzed=true
						target:setDuration("slumber",23000)
					end
					target:sendAnimation(130)
					target:playSound(130)
				end
			npc:delete()
			end		
	end,
	requirements=function(player)
		local l=92
		local i={0}
		local ia={1000000}
		local d={"Set Doze trap\n\nA trap that will doze who set it off.","You l sacrifice 1000000 coins to learn this ability."}
		return l,i,ia,d
	end

}