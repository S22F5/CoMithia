tackle = {
cast=function(player,target)
	local m = player.m
	local h, j, k, l, ani, oldx, oldy, i
	local x = player.x
	local y = player.y
	local x1 = player.x
	local y1 = player.y
	local x2 = player.x
	local y2 = player.x
	local startx = player.x
	local starty = player.y
	local check = 0
	local calc2=(player.maxHealth*0.05)+20--250
	local cd = 22000
	local calc3 = player.gmLevel/7
	local stopduration=math.abs(((math.ceil(((3*player.magic)/player.maxHealth)+((player.might-player.grace)/50)))*1000))
	local absx, absy
	local dist = 6

	if(player.magic<calc2) then
		player:sendMinitext("Your will is too weak")
		return
	end
	
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end

	if(player.state==3) then
		player:sendMinitext("You can not cast this spell while on a mount.")
		return
	end
	
	if	(player.x == target.x and player.y == target.y) then
		player:sendMinitext("You try to charge at yourself, but get nowhere fast.")
		return
	end
	
	player:lock()
	for i = 1, dist do
		if (distanceXY(player, target.x, target.y) <= 1) then
			player:sendMinitext("Can't charge from upclose.")
			player:unlock()
			return
		else
			if (distanceXY(player, target.x, target.y) == 2 and i <= dist - 1) then
				toXY(player, target.x, target.y)
				check = 1
				break
			elseif (distanceXY(player, target.x, target.y) > 1 and i == dist) then
				toXY(player, target.x, target.y)
				--player:refresh()
				--toXY(player, target.x, target.y)
				player:unlock()
			elseif (distanceXY(player, target.x, target.y) > 1) then
				toXY(player, target.x, target.y)
			else
				player:sendMinitext("Something went wrong.")
				player:unlock()
				return
			end
		end
	end
	player:refresh()
	player:sendAnimationXY (285, startx, starty) --take off
		
	if(check == 1) then
		--toXY(player, target.x, target.y)
		x = player.x
		y = player.y
		if (player.y > target.y) then
			player.side = 0
			player:sendSide()
			h = player:getObjectsInCell(m, x, y - 1, BL_PC)
			j = player:getObjectsInCell(m, x, y - 1, BL_MOB)
		end
		if (player.y < target.y) then
			player.side = 2
			player:sendSide()
			h = player:getObjectsInCell(m, x, y + 1, BL_PC)
			j = player:getObjectsInCell(m, x, y + 1, BL_MOB)
		end
		if (player.x > target.x) then
			player.side = 3
			player:sendSide()
			h = player:getObjectsInCell(m, x - 1, y, BL_PC)
			j = player:getObjectsInCell(m, x - 1, y, BL_MOB)
		end
		if (player.x < target.x) then
			player.side = 1
			player:sendSide()
			h = player:getObjectsInCell(m, x + 1, y, BL_PC)
			j = player:getObjectsInCell(m, x + 1, y, BL_MOB)
		end
		if(player.side==0) then y=y+1 end
		if(player.side==1) then x=x-1 end
		if(player.side==2) then y=y-1 end
		if(player.side==3) then x=x+1 end
		absx = math.abs(startx-x)
		absy = math.abs(starty-y)
		damage=(20*player.might)+(player.health*0.05*player.might/98)
		
		if (player.gmLevel < 50) then
			player:addMana(-calc2)
			player:setAether("tackle",cd)
		else
			player:addMana(-calc2)
			player:setAether("tackle",cd/calc3)
		end
		
		if (absx >= 2) or (absy >= 2)then
			ani = 300
		else
			ani = 331
		end
		
		if(player.health>damage*(2/3)) then
			player:talk(2,"Tackle!")
		else
			player:talk(2,"Body Slam~!")
			
			if(player.rage == 3) then
				ani = 332  --69 96rez 245 285vanished 300 301 331baseatk 332bigshock 424hugeshock
				damage=(20*player.might)+(player.health*1.75*player.might/98)+((player.magic*1.55)*player.might/145)--((player.health*1.70)+(player.magic*0.15))*player.might/145
				player.health = 1 + player.health - player.health
				player.attacker = player.ID
				player:removeHealthExtend(damage, 0, 1, 1, 1, 0)
				player:sendAnimationXY (96, player.x, player.y) --kamikaze
			else
				ani = 301
				damage=(20*player.might)+(player.health*0.05*player.might/98)+((player.magic*1.25)*(player.might/145))
				player.health = 1 + player.health - player.health
				player.attacker = player.ID
				player:removeHealthExtend(damage, 0, 1, 1, 1, 0)
				--player:sendAnimationXY (96, player.x, player.y) --kamikaze
			end
		end
		
		if(#j ~= 0) then
			target = j[1]
			target:sendAnimation(ani)
			target.attacker=player.ID
			player.attacker = player.ID
			player:sendMinitext("You rushed towards "..target.name..".")
			target:removeHealthExtend(damage, 0, 1, 1, 1, 0)
			player:removeHealthExtend(damage*2/3, 0, 1, 1, 1, 0)
			
			if (target.subType == 4) then
				stopduration = stopduration*(2/3)
			end
		elseif(#h ~= 0) then
			target = h[1]
			if(target.state ~= 1 and player.pvp > 0) then
				target:sendMinitext(player.name.." charges at you.")
				player:sendMinitext("You rushed towards "..target.name..".")
				target:sendAnimation(ani)
				target.attacker=player.ID
				player.attacker = player.ID
				target:removeHealthExtend(damage, 0, 1, 1, 1, 0)
				player:removeHealthExtend(damage*2/3, 0, 1, 1, 1, 0)
			else
				target:sendAnimation(ani)
				player:unlock()
				return
			end
		end
		
		if(target.paralyzed==false) then
			target.paralyzed=true
			target:setDuration("stop",stopduration)
		end
		--player:talk(0,'Pending fix directional blocks.')
		if(absx==2 or absy==2)then
			if(player.paralyzed==false) then
				player.paralyzed=true
				player:setDuration("stop", math.ceil(stopduration / 3))
				player:sendMinitext("You got hit by recoil.")
			end
		elseif(absx==3 or absy==3)then
			if(player.paralyzed==false) then
				player.paralyzed=true
				player:setDuration("stop", math.ceil(stopduration / 2.75))
				player:sendMinitext("You got hit by recoil.")
			end
		elseif(absx==4 or absy==4)then
			if(player.paralyzed==false) then
				player.paralyzed=true
				player:setDuration("stop", math.ceil(stopduration / 2.5))
				player:sendMinitext("You got hit by recoil.")
			end
		elseif(absx==5 or absy==5)then
			if(player.paralyzed==false) then
				player.paralyzed=true
				player:setDuration("stop", math.ceil(stopduration / 2.1))
				player:sendMinitext("You got hit by recoil.")
			end
		end
		player:unlock()
	end
end,
	
requirements=function(player)
	local l=95
	local i={0,803,537}
	local ia={25000,1,1}
	local d={"Tackle\n\nGather your strengths to tackle a target.","You shall sacrifice (1) Striker, (1) Amethyst Experience Gem and 25000 coins to learn this ability."}
	return l,i,ia,d
end
}
