blade_rush = {
	cast=function(player,target)


	local d={}
	local e={}
	local up={}
	local right={}
	local down={}
	local left={}
	local p={}
	local m=player.m
	local x=player.x
	local y=player.y
	local xx=player.x
	local yy=player.y
	local damage=((player.health*1.75)+(player.magic*0.05))*player.might/150
	local stopduration=((math.ceil(player.will/30)+1)*1000)
	local calc3=player.maxHealth*0.15
	local c=0


	if(player.magic<600) then
		player:sendMinitext("Your will is too weak")
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
	if(player.health<calc3) then
		player:sendMinitext("You're exhausted.")
		player:setAether("blade_rush",28000)
		return
	end

	if(player.registry["currentspecialization"]~=2) then
		player:sendMinitext("Only Champions may use this ability.")
		return
	end


	if(player.side==0) then yy=y-1 end
	if(player.side==1) then xx=x+1 end
	if(player.side==2) then yy=y+1 end
	if(player.side==3) then xx=x-1 end	

	if(player.pvp==true) then
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
				d[1].attacker=player.ID
				player:addMana(-600)
				player:addHealth(-player.health*0.7)
				player:playSound(727)
				if(d[1].paralyzed==false) then
					d[1].paralyzed=true
					d[1]:setDuration("stop",stopduration)
				end
				player:sendStatus()
				player:sendAction(1,50)
				d[1]:sendAnimation(287)
				d[1]:sendAnimation(88)
				d[1].attacker=player.ID
				d[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				player:talk(2,"STOMP~~!")	
		end
		if(#e>0 and #alive>0) then
				player:addMana(-600)
				player:addHealth(-player.health*0.7)
				player:playSound(727)
				for z=1,#alive do
					Player(alive[z]).attacker=player.ID
					if(Player(alive[z]).paralyzed==false) then
						Player(alive[z]).paralyzed=true
						Player(alive[z]):setDuration("stop",stopduration)
					end
					Player(alive[z]):sendAnimation(287)
					Player(alive[z]):sendAnimation(88)
					Player(alive[z]):removeHealthExtend(damage, 1, 1, 1, 1, 0)
					Player(alive[z]):sendMinitext(player.name .. " casts Blade rush on you.")
				end
				player:talk(2,"STOMP~~!")
		end
		player:sendMinitext("You cast Blade Rush.")
		player:sendAction(1,50)
		if(player:hasDuration("manipulate")) then
			player:setAether("blade_rush",23000)
		else
			player:setAether("blade_rush",28000)
		end
	else
	if(player.side==0) then yy=y-1 end
	if(player.side==1) then xx=x+1 end
	if(player.side==2) then yy=y+1 end
	if(player.side==3) then xx=x-1 end

	p=player:getObjectsInCell(m,xx,yy,BL_PC)
	up=player:getObjectsInCell(m,x,y-1,BL_MOB)
        right=player:getObjectsInCell(m,x+1,y,BL_MOB)
        down=player:getObjectsInCell(m,x,y+1,BL_MOB)
        left=player:getObjectsInCell(m,x-1,y,BL_MOB)

		if(#up>0) then c=c+1    end
		if(#right>0) then c=c+1 end
		if(#down>0) then c=c+1  end
		if(#left>0) then c=c+1  end
		
		if(c~=0) then damage=damage/c end
		
		if(#up>0) then
			
				if(up[1].paralyzed==false) then
					up[1].paralyzed=true
					up[1]:setDuration("stop",stopduration)
				end
				up[1]:sendAnimation(287)
				up[1]:sendAnimation(88)
				up[1].attacker=player.ID
				up[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				
			
		end
		if(#right>0) then
			
				if(right[1].paralyzed==false) then
					right[1].paralyzed=true
					right[1]:setDuration("stop",stopduration)
				end
				right[1]:sendAnimation(287)
				right[1]:sendAnimation(88)
				right[1].attacker=player.ID
				right[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				
			
		end
		if(#down>0) then
			
				if(down[1].paralyzed==false) then
					down[1].paralyzed=true
					down[1]:setDuration("stop",stopduration)
				end
				down[1]:sendAnimation(287)
				down[1]:sendAnimation(88)
				down[1].attacker=player.ID
				down[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				
			
		end
		if(#left>0) then
			
				if(left[1].paralyzed==false) then
					left[1].paralyzed=true
					left[1]:setDuration("stop",stopduration)
				end
				left[1]:sendAnimation(287)
				left[1]:sendAnimation(88)
				left[1].attacker=player.ID
				left[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				
			
		end
		if(#p>0) then
			
				p[1]:sendAnimation(287)
				p[1]:sendAnimation(88)
			
		end
		player:addMana(-600)
		if(#up>0 or #down>0 or #right>0 or #left>0) then
				player:addHealth(-player.health*0.7)
		end
		player:playSound(727)
		if(player:hasDuration("manipulate")) then
			player:setAether("blade_rush",23000)
		else
			player:setAether("blade_rush",28000)
		end
		player:sendAction(1,50)
		player:talk(2,"STOMP~~!")
	end
	end,
	requirements=function(player)
		local l=99
		local i={0}
		local ia={1000000000000}
		local d={"Blade rush\n\nConcentrate and focus in a powerful attack that will stun if hits it's target.","You shall sacrifice 1000000 coins to learn this ability."}
		return l,i,ia,d
	end
}

