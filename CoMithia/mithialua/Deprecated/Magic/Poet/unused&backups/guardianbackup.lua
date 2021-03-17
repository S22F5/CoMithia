guardianBACKUP = {
	cast=function(player,target)
                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.magic<1000) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		

		if(player.group==nil) then
			if(player:hasDuration("runic") or player:hasDuration("empower") or player:hasDuration("evade") or player:hasDuration("will") or player:hasDuration("ice_ward") or player:hasDuration("magical_ward") or player:hasDuration("minor_shielding") or player:hasDuration("holy_protection")) then
					player:sendMinitext("Single buffs are already running.")
					return
			end
			if(player:hasDuration("guardian")) then
					player:setDuration("guardian",500000,0,1)
					--player:sendAnimation(378)
					player:setAether("guardian",10000)
					player:addMana(-1000)
					player:sendMinitext("Guardian duration refreshed.")
					return
			else

		     		player.grace=player.grace+16
			     	player.might=player.might+16
			     	player.will=player.will+16
				player.deduction=0.5
				player.ac=player.ac-5
				player:sendAnimation(378)
				player:playSound(77)
				player:addMana(-1000)
				player:sendMinitext("You cast Guardian.")
				player:setDuration("guardian",500000)
				player:setAether("guardian",10000)
				player:sendStatus()
				return
			end
		end

			local check=0
			for x=1,#player.group do
				if(Player(player.group[x]):hasDuration("guardian") and Player(player.group[x]).state~=1 and Player(player.group[x]).m==player.m) then
					Player(player.group[x]):setDuration("guardian",500000,0,1)
					Player(player.group[x]):sendMinitext(player.name.." refreshes your Guardian protection.")
					--Player(player.group[x]):sendAnimation(378)

				elseif(Player(player.group[x]):hasDuration("runic") or Player(player.group[x]):hasDuration("empower") or Player(player.group[x]):hasDuration("evade") or Player(player.group[x]):hasDuration("will") or Player(player.group[x]):hasDuration("ice_ward") or Player(player.group[x]):hasDuration("magical_ward") or Player(player.group[x]):hasDuration("holy_protection") or Player(player.group[x]):hasDuration("minor_shielding") or Player(player.group[x]):hasDuration("guardian")) then
					--blabla
				elseif(Player(player.group[x]).state~=1 and Player(player.group[x]).m==player.m) then
						Player(player.group[x]):setDuration("guardian",500000)
		     				Player(player.group[x]).grace=Player(player.group[x]).grace+16
		     				Player(player.group[x]).might=Player(player.group[x]).might+16
		     				Player(player.group[x]).will=Player(player.group[x]).will+16
						Player(player.group[x]).deduction=0.5
						Player(player.group[x]).ac=Player(player.group[x]).ac-5
						Player(player.group[x]):sendMinitext(player.name .." casts Guardian on you.")
						Player(player.group[x]):sendAnimation(378)
						Player(player.group[x]):sendStatus()
				end
			end

			player:playSound(77)
			player:addMana(-1000)
			player:setAether("guardian",10000)
			player:sendMinitext("You cast Guardian.")
                        player:sendAction(6,45)               
        end,

	uncast=function(player)
		player.grace=player.grace-16
		player.will=player.will-16
		player.might=player.might-16
		player.deduction=0
		player.ac=player.ac+5
		player:sendStatus()
		
	end,
	recast=function(player)
		player.grace=player.grace+16
		player.will=player.will+16
		player.might=player.might+16
		player.deduction=0.5
		player.ac=player.ac-5
		player:sendStatus()
	end,
	fix=function(player)
		player.grace=player.grace+16
		player.will=player.will+16
		player.might=player.might+16
		player.deduction=0.5
		player.ac=player.ac-5
		player:sendStatus()
	end     
}