shield_slam = {
	cast=function(player,target)
	local d={}
	local e={}
	local m=player.m
	local x=player.x
	local y=player.y

	if(player.magic<math.floor(player.maxMagic/15)) then
		player:sendMinitext("Your do not have enough Mana to cast this ability")
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

	if(player.registry["currentspecialization"]~=2) then
		player:sendMinitext("Only Champions may use this ability.")
		return
	end

	local item=player:getEquippedItem(EQ_SHIELD)

	if(item==nil) then
		player:sendMinitext("You must wear a shield to cast this ability")
		return
	end

	if(player.health<player.maxHealth/10) then
		player:sendMinitext("You are too weak to use this ability")
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

			player:removeHealth(player.maxHealth/10)
			player:sendAction(1,50)
			d[1]:sendAnimation(424)
			player:playSound(102)

			local threatcalcamount=0
			threatcalcamount=(player.health/2)

			if(d[1].sleep~=0) then
				threatcalcamount=threatcalcamount*player.sleep
			end

			threatcalcamount=threatcalcamount*(d[1].deduction)
			
			if(d[1].ac<=-85) then
				threatcalcamount=threatcalcamount+(threatcalcamount*-85*0.01)
			else
				threatcalcamount=threatcalcamount+(threatcalcamount*player.ac*0.01)
			end


			player:addThreat(d[1].ID,threatcalcamount)
			d[1].attacker=player.ID
			d[1]:removeHealthExtend(player.health/2, 1, 1, 1, 1, 0)


		end
	end
	if(#e>0 and #alive>0) then
			if(player.pvp==true) then
				player:playSound(102)
				for z=1,#alive do
					Player(alive[z]):sendMinitext(player.name .." casts Shield slam on you.")
					Player(alive[z]):sendAnimation(424)
					Player(alive[z]).attacker=player.ID
					Player(alive[z]):removeHealthExtend(player.health/2, 1, 1, 1, 1, 0)
				end
				player:removeHealth(player.maxHealth/10)
			else
				e[1]:sendAnimation(424)
				player:playSound(102)
				
			end			
	end

	player:talk(2,"~Slam!~")
	player:addMana(-math.floor(player.maxMagic/15))
	player:sendAction(1,50)
	player:sendMinitext("You cast Shield Slam.")
	player:setAether("shield_slam",12000)	

	end,
	requirements=function(player)
		local l=25
		local i={0,"chestnut","fox_fur"}
		local ia={500,50,1}
		local d={"Shield slam\n\nChampion ability\n\nSlams a foe with your shield, generating high amounts of threat.","You shall have to sacrifice (50) Chestnut, (1) Fox fur and 500 coins to learn this ability."}
		return l,i,ia,d
		
	end
}
