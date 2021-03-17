cross_cleave = {
	cast=function(player,target)
	local d={}
	local m=player.m
	local x=player.x
	local y=player.y
	--local calc=player.health*0.04+(11*player.might)
	local damage=(11*player.might)+(player.health*0.10*player.might/130)
	local calc2=(player.maxHealth*0.05)+100
	if(player.magic<120) then
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

	if(player.registry["currentspecialization"]~=1) then
		player:sendMinitext("Only Reavers may use this ability.")
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
			player:addMana(-120)
			player:removeHealth(player.maxHealth*0.05)
			d[1]:sendAnimation(128)
			d[1].attacker=player.ID
			d[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		end
	end
	if(#e>0 and #alive>0) then
			if(player.pvp==true) then
				player:addMana(-120)
				for z=1,#alive do
					Player(alive[z]):sendMinitext(player.name .." casts Cross cleave on you.")
					Player(alive[z]):sendAnimation(128)
					Player(alive[z]).attacker=player.ID
					Player(alive[z]):removeHealthExtend(damage, 1, 1, 1, 1, 0)
				end
				player:removeHealth(player.maxHealth*0.05)
			else
				e[1]:sendAnimation(128)
				
			end			
	end
	player:sendAction(1,50)
	player:sendMinitext("You cast Cross cleave.")
	player:setAether("cross_cleave",2000)
	end,
	requirements=function(player)
		local l=66
		local i={0,39,372}
		local ia={2500,5,1}
		local d={"Cross Cleave\n\nGather your strengths to attack a target","You shall sacrifice (5) Stolen coin, (1) Stolen money sack and 2500 coins to learn this ability."}
		return l,i,ia,d
	end
}