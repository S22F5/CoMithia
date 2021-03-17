dancing_edge = {
	cast=function(player,target)
	local d={}
	local e={}
	local m=player.m
	local x=player.x
	local y=player.y
	local calc=((player.health*0.5)+(player.magic))*player.grace/150
	local crit=math.random(1,500)

	if(player.registry["currentspecialization"]~=1) then
		player:sendMinitext("Only Striders may use this ability")
		return
	end

	if(player.magic<1200) then
		player:sendMinitext("You do not have enough mana.")
		return
	end
	
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
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
	local checkalive=0
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
			player:addMana(-1200)
			d[1]:sendAnimation(164)
			player:playSound(503)
			d[1].attacker=player.ID
			if(player.grace>=crit) then
				d[1]:removeHealthExtend(calc*1.3, 1, 1, 1, 1, 0)
				player:talk(1,""..player.name..": I bet you didn't see that one coming!")
			else
				d[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
				player:talk(2,"See you in hell!")
			end
			player:removeHealth(player.health/2)
		end
	end
	if(#e>0 and #alive>0) then
			if(player.pvp==true) then
				player:addMana(-1200)
				player:playSound(503)
				for z=1,#alive do
					Player(alive[z]):sendMinitext(player.name .." casts Dancing Edge on you.")
					Player(alive[z]):sendAnimation(164)
					Player(alive[z]).attacker=player.ID
					if(player.grace>=crit) then
						player:talk(1,""..player.name..": I bet you didn't see that one coming!")
						Player(alive[z]):removeHealthExtend(calc*1.3, 1, 1, 1, 1, 0)
					else
						player:talk(2,"See you in hell!")
						Player(alive[z]):removeHealthExtend(calc, 1, 1, 1, 1, 0)
					end
				end
				player:removeHealth(player.health/2)
			else
				player:sendAction(1,50)
				e[1]:sendAnimation(164)
				player:playSound(503)
				
			end
			
	end
	player:sendAction(1,50)
	player:sendMinitext("You cast Dancing edge.")
	if(player:hasDuration("manipulate")) then
		player:setAether("dancing_edge",21000)
	else
		player:setAether("dancing_edge",26000)
	end
	end,
	requirements=function(player)
		local l=99
		local i={0}
		local ia={1000000}
		local d={"Dancing edge\n\nA powerful attack to assassinate you adversary.","You shall have to sacrifice 1000000 coins to learn this ability."}
		return l,i,ia,d
		
	end
}
