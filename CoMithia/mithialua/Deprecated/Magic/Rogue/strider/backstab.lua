backstab = {
	cast=function(player,target)
	local d={}
	local e={}
	local m=player.m
	local x=player.x
	local y=player.y
	local calc=player.health*0.5*player.grace/130
	local calc2=player.magic*0.1
	local calc3=player.maxMagic*0.5

	if(player.registry["currentspecialization"]~=1) then
		player:sendMinitext("Only Striders may use this ability")
		return
	end

	if(player.magic<calc3) then
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

	if(player:hasDuration("suggestion")) then
		calc2=player.magic*0.05
	end

	if(player:hasDuration("suggestion")) then
		player:setAether("backstab",4000)
		player.registry["lastbackstab"]=os.time()+4
	else
		player:setAether("backstab",6000)
		player.registry["lastbackstab"]=os.time()+6
	end

	if(player.side==0) then y=y-1 end
	if(player.side==1) then x=x+1 end
	if(player.side==2) then y=y+1 end
	if(player.side==3) then x=x-1 end

	d=player:getObjectsInCell(m,x,y,BL_MOB)
	e=player:getObjectsInCell(m,x,y,BL_PC)
	local alive={}
	if(#e>0) then
		for z=1,#e do
			if(e[z].state~=1) then
				table.insert(alive,""..e[z].ID.."")
			end
		end
	end
	if(#d>0) then
		if(d[1].blType==BL_MOB) then
			if(player.side==d[1].side) then
			player:sendMinitext("You cast Backstab.")
			player:addMana(-calc2)
			player:sendAction(1,50)
			d[1]:sendAnimation(89)
			player:playSound(88)
			d[1].attacker=player.ID
			d[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			player:talk(2,"Your end is near!")
			else
				player:sendMinitext("You have to stand in the back of your victim!")
			end
		end
		return
	end
	if(#e>0 and #alive>0) then
			if(player.pvp==true) then
				
				player:addMana(-calc2)
				player:playSound(88)
				for z=1,#alive do
					if(Player(alive[z]).side==player.side) then
						Player(alive[z]):sendMinitext(""..player.name.." Backstabs you!")
						Player(alive[z]):sendAnimation(89)
						Player(alive[z]).attacker=player.ID
						Player(alive[z]):removeHealthExtend(calc, 1, 1, 1, 1, 0)
						player:talk(2,"Your end is near!")
					end
				end
			else
				if(e[1].side==player.side) then
					e[1]:sendAnimation(89)
					player:playSound(88)
					player:talk(2,"Your end is near!")
				end
				
			end
			
	end
	player:sendAction(1,50)	
	end
}
