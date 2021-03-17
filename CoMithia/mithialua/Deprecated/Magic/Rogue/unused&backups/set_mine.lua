set_mine = {
	cast=function(player,target)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
	
		if(player.magic<200) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		player:addMana(-200)
		player:sendAction(6,35)
		player:addNPC("set_mine",player.m,player.x,player.y)
		player:setAether("set_mine",4000)
	end,
	click=function(target,npc)
			if(target.pvp==true) then			
			if(target.health>500) then
				target:removeHealth2(500)
			end
			target:sendAnimation(19)
			target:playSound(12)
			npc:delete()
			else
				if(target.blType==BL_MOB) then			
					if(target.health>500) then
						target:removeHealth2(500)
					end
					target:sendAnimation(19)
					target:playSound(12)
				end
			npc:delete()
			end		
	end,
	requirements=function(player)
		local l=34
		local i={0,5,222}
		local ia={1300,50,5}
		local d={"Set mine\n\nSet a rudimentary landmine with explosives","You shall sacrifice (50) Chestnut, (5) Ash board and 1300 coins to learn this ability."}
		return l,i,ia,d
	end

}