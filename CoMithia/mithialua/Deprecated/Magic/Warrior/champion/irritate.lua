irritate = {
	cast=function(player,target)

	if(player.magic<math.floor(player.maxMagic/10)) then
		player:sendMinitext("You do not have enough Mana.")
		return
	end


	if(player.registry["currentspecialization"]==1) then
		player:sendMinitext("Reavers may not use this ability.")
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


	player:addMana(-(math.floor(player.maxMagic/10)))

	if(target.ID==player.ID) then
		player:sendMinitext("You slap yourself.")
		player:sendAnimation(127)
		player:playSound(30)
		player:setAether("irritate",8000)
		return
	end
		if(target.blType==BL_MOB) then
				local threatcalc = threat.getThreatTable(target)

				if(#threatcalc>0) then
					local playercheck = threat.getThreatID(target,threatcalc[1])

					if(playercheck.ID==player.ID and threatcalc[1]~=0) then

						player:sendMinitext("This is already your own target!")

					elseif(playercheck.ID==player.ID and threatcalc[1]==0) then
						
						player:setThreat(target.ID,100)

					else
						local threatcalcamount=threatcalc[1]*1.1
						player:setThreat(target.ID,threatcalcamount)
					end
				else
					target.target=player.ID
				end

				player:sendAction(6,35)
				target:sendAnimation(127)
				player:playSound(30)
				target.state=MOB_HIT
				target.attacker=player.ID
				target:removeHealthExtend(30, 1, 1, 1, 1, 0)
				player:setAether("irritate",8000)
				player:talk(2,"Hey you!")
		else
				player:sendAction(6,35)
				target:sendAnimation(127)
				player:playSound(30)
				player:talk(2,"Hey you!")
				target:sendMinitext(player.name .. " casts Irritate on you.")
				player:setAether("irritate",8000)
		end
	end,

	recast=function(player)
	end,
	uncast=function(player)
	end,
	fix=function(player)
	end,
	requirements=function(player)
		local l=7
		local i={0,5}
		local ia={100,50}
		local d={"Irritate\n\nTaunt an ennemy to get his attention.","You shall sacrifice (50) Chestnut and 100 coins to learn this ability."}
		return l,i,ia,d
	end
}