climhazzard = {
	cast=function(player,target)
	local d={}
	local e={}
	local m=player.m
	local x=player.x
	local y=player.y
	local calc=player.health*0.75*player.might/140
	local calc2=math.floor(player.health*0.75)
	if calc2==1 then calc2=0 end
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
			player:removeHealth(calc2)
			player:sendAction(1,50)
			d[1]:sendAnimation(60)
			player:playSound(102)
			d[1].attacker=player.ID
			d[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)

			player:talk(2,"Take this!")
		end
	end
	if(#e>0 and #alive>0) then
			if(player.pvp==true) then
				player:addMana(-120)
				player:playSound(102)
				for z=1,#alive do
					Player(alive[z]):sendMinitext(player.name .." casts Climhazzard on you.")
					Player(alive[z]):sendAnimation(60)
					Player(alive[z]).attacker=player.ID
					Player(alive[z]):removeHealthExtend(calc, 1, 1, 1, 1, 0)
					player:talk(2,"Take this, "..Player(alive[z]).name.." !")
				end
				player:removeHealth(calc2)
			else
				player:talk(2,"Take this, " .. e[1].name .. " !")
				e[1]:sendAnimation(60)
				player:playSound(102)
				
			end			
	end
	player:sendAction(1,50)
	player:sendMinitext("You cast Climhazzard.")
	player:setAether("climhazzard",15000)	
	end,
	requirements=function(player)
		local l=84
		local i={0,430}
		local ia={5000,1}
		local d={"Climhazzard\n\nReaver ability\n\nA powerful yet exhausting attack.","You shall have to sacrifice (1) Frostbane and 5000 coins to learn this ability."}
		return l,i,ia,d
		
	end
}
