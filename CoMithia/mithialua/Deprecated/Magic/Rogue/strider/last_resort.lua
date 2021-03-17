last_resort = {
	cast=function(player,target)
	local d={}
	local e={}
	local m=player.m
	local x=player.x
	local y=player.y
	local calc=(player.health+player.magic/2)*(player.might+player.grace)/250
	local calc2=player.health*0.5

	if(player.registry["currentspecialization"]~=1) then
		player:sendMinitext("Only Striders may use this ability")
		return
	end

	if(player.magic<60) then
		player:sendMinitext("You do not have enough Mana.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	if(player.registry["lastbackstab"]>=os.time() and player.pvp==true) then
		player:sendMinitext("You are still exhausted from your last backstab ["..player.registry["lastbackstab"]-os.time().." seconds remaining.]")
		return
	end
	if(player.side==0) then y=y-1 end
	if(player.side==1) then x=x+1 end
	if(player.side==2) then y=y+1 end
	if(player.side==3) then x=x-1 end

	d=player:getObjectsInCell(m,x,y,BL_MOB)
	e=player:getObjectsInCell(m,x,y,BL_PC)
	local alive = {}
	if(#e>0) then
		for z=1,#e do
			if(e[z].state~=1) then
				table.insert(alive,""..e[z].ID.."")
			end
		end
	end
	if(#d>0) then
		if(d[1].blType==BL_MOB) then
			player:addMana(-player.magic)
			player:removeHealth(calc2)
			player:sendAction(1,50)
			d[1]:sendAnimation(68)
			player:playSound(85)
			d[1].attacker=player.ID
			d[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			player:sendMinitext("You cast Last resort.")
			player:talk(2,"This is my last resort!")
		end
	end
	if(#e>0 and #alive>0) then
			if(player.pvp==true) then
				player:addMana(-player.magic)
				player:playSound(85)
				for z=1,#alive do
					Player(alive[z]):sendMinitext(player.name .." casts Last resort on you.")
					Player(alive[z]):sendAnimation(68)
					Player(alive[z]).attacker=player.ID
					Player(alive[z]):removeHealthExtend(calc, 1, 1, 1, 1, 0)
				end
				player:removeHealth(player.health/2)
			else
				
				e[1]:sendAnimation(68)
				player:playSound(85)
				
			end
			player:talk(2,"This is my last resort!")
			
	end
	player:setAether("last_resort",14000)
	player:sendAction(1,50)	
	end,
	requirements=function(player)
		local l=54
		local i={0,357}
		local ia={2500,1}
		local d={"Last resort\n\nStrider spell\n\nGather and use your remaining strengths into a deadly assault","You shall have to sacrifice (1) Treasure map and 2500 coins to learn this ability."}
		return l,i,ia,d
		
	end
}
