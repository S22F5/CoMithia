skull_bash = {
	cast=function(player,target)

	local d={}
	local e={}
	local m=player.m
	local x=player.x
	local y=player.y

	local calc=player.health*1.50*player.might/130

	local calc2=math.floor(player.health*0.75)

	if calc2==1 then calc2=0 end


	if(player.magic<player.maxMagic/10) then
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

		
		local mobhealth=d[1].health

		local damagecalc = calc
		
		if(d[1].sleep>0) then
			damagecalc = damagecalc*d[1].sleep
		end

		if(d[1].ac<=(-95)) then
			damagecalc = damagecalc*0.05
		else
			damagecalc = damagecalc + (damagecalc * d[1].ac *0.01)
		end

		if(damagecalc<=mobhealth) then

			d[1]:sendAnimation(105)
			player:playSound(84)
			d[1].attacker=player.ID
			d[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			player:talk(2,"~Bash!~")
		else

			-- Starting the calculation of raw damage necessary to kill the monster, and therefore remaining available damage for overflow

			local rawdamage= mobhealth

			if(d[1].ac<=(-95)) then
				rawdamage = rawdamage/0.05

			elseif(d[1].ac<=0 and d[1].ac>(-95)) then
				rawdamage = rawdamage / (1-math.abs(d[1].ac*0.01))
		
			elseif(d[1].ac>0) then
				rawdamage = rawdamage / (1+(d[1].ac*0.01))

			end

			if(d[1].sleep)>0 then
				rawdamage = rawdamage/d[1].sleep
			end

			local overflowdamage=calc-rawdamage

			-- Ending the calculation of raw damage necessary to kill the monster, and therefore remaining available damage for overflow

			if(overflowdamage<0) then
				player:talk(0,"debug")
				return
			end


			d[1]:sendAnimation(105)
			player:playSound(84)
			d[1].attacker=player.ID
			d[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			player:talk(2,"I'll bash your head in!")


			local checkup = player:getObjectsInCell(m,x,y-1,BL_MOB)
			local checkright = player:getObjectsInCell(m,x+1,y,BL_MOB)
			local checkdown = player:getObjectsInCell(m,x,y+1,BL_MOB)
			local checkleft = player:getObjectsInCell(m,x-1,y,BL_MOB)

			local overflowcount = 0
			
			if(#checkup>0) then overflowcount=overflowcount+1 end
			if(#checkright>0) then overflowcount=overflowcount+1 end
			if(#checkdown>0) then overflowcount=overflowcount+1 end
			if(#checkleft>0) then overflowcount=overflowcount+1 end

			if(#checkup>0) then
				checkup[1]:sendAnimation(68)
				checkup[1].attacker=player.ID
				checkup[1]:removeHealthExtend((overflowdamage/overflowcount), 1, 1, 1, 1, 0)
			end

			if(#checkright>0) then
				checkright[1]:sendAnimation(68)
				checkright[1].attacker=player.ID
				checkright[1]:removeHealthExtend((overflowdamage/overflowcount), 1, 1, 1, 1, 0)
			end

			if(#checkdown>0) then
				checkdown[1]:sendAnimation(68)
				checkdown[1].attacker=player.ID
				checkdown[1]:removeHealthExtend((overflowdamage/overflowcount), 1, 1, 1, 1, 0)
			end		

			if(#checkleft>0) then
				checkleft[1]:sendAnimation(68)
				checkleft[1].attacker=player.ID
				checkleft[1]:removeHealthExtend((overflowdamage/overflowcount), 1, 1, 1, 1, 0)
			end	

		end
	end

	if(#e>0 and #alive>0) then
			if(player.pvp==true) then
				player:playSound(84)
				for z=1,#alive do
					Player(alive[z]):sendMinitext(player.name .." casts Skull bash on you.")
					Player(alive[z]):sendAnimation(105)
					Player(alive[z]).attacker=player.ID
					Player(alive[z]):removeHealthExtend(calc, 1, 1, 1, 1, 0)
					player:talk(2,"I'll bash your head in, "..Player(alive[z]).name.." !")
				end
				player:removeHealth(calc2)
			else
				player:talk(2,"I'll bash your head in!")
				e[1]:sendAnimation(105)
				player:playSound(84)
				
			end			
	end

	if(#d>0 or #alive>0) then
		player:removeHealth(math.floor(player.health*0.75))
	end

	player:addMana(-player.maxMagic/10)
	player:sendAction(9,30)
	player:sendMinitext("You cast Skull bash.")

	if(player:hasDuration("manipulate")) then
		player:setAether("skull_bash",23000)
	else
		player:setAether("skull_bash",28000)
	end
	
	end,

	requirements=function(player)
		local l=99
		local i={0,"battle_horn"}
		local ia={7500,1}
		local d={"Skull bash\n\nReaver ability\n\nBash your enemies so strong that the shockwave could hit others.","You shall have to sacrifice (1) Battle horn and 7500 coins to learn this ability."}
		return l,i,ia,d
		
	end
}
