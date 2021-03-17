pandemic = {
	cast=function(player,target)
		
                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
                end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
		if(target.state==1) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(player.registry["currentspecialization"]~=2) then
			player:sendMinitext("Only Valkyrs may use this ability.")
			return
		end
                
                if(player.magic<player.maxMagic/8) then
			player:sendMinitext("You do not have enough mana.")
			return
                end

		if(target:hasDuration("pandemic")==true or target:hasDuration("infection")==true) then
			player:sendMinitext("The target is already infected")
			return
		end

		if(target.blType==BL_PC and player.pvp==false) then
			player:sendMinitext("Something went wrong")
			return
		end

		player:setAether("pandemic",14000-(player.will/30*1000))

                target:sendAnimation(293)
                player:playSound(67)
                player:addMana(-player.maxMagic/8)
		player:sendAction(6,35)

                target:setDuration("pandemic",10000,player.ID)

                player:sendMinitext("You cast Pandemic.")
			if(target.blType==BL_PC) then
				target:sendMinitext(player.name .." casts Pandemic on you.")
			end
		target:sendStatus()                        
	
        end,

	while_cast = function(player,caster)

		local anim=293

		--Checking PC targets

		if(player.pvp==true) then

		local targetcheckleft=player:getObjectsInCell(player.m,player.x-1,player.y,BL_PC)
		local targetcheckright=player:getObjectsInCell(player.m,player.x+1,player.y,BL_PC)
		local targetcheckup=player:getObjectsInCell(player.m,player.x,player.y-1,BL_PC)
		local targetcheckdown=player:getObjectsInCell(player.m,player.x,player.y+1,BL_PC)


		if(#targetcheckleft>0) then
			for x=1,#targetcheckleft do
				if(targetcheckleft[x]:hasDuration("pandemic")==false and targetcheckleft[x]:hasDuration("infection")==false and targetcheckleft[x].state~=1) then
					targetcheckleft[x]:setDuration("infection",5000,caster.ID)
					targetcheckleft[x]:sendAnimation(293)
				end
			end
		end


		if(#targetcheckright>0) then
			for x=1,#targetcheckright do
				if(targetcheckright[x]:hasDuration("pandemic")==false and targetcheckright[x]:hasDuration("infection")==false and targetcheckright[x].state~=1) then
					targetcheckright[x]:setDuration("infection",5000,caster.ID)
					targetcheckright[x]:sendAnimation(293)
				end
			end
		end


		if(#targetcheckup>0) then
			for x=1,#targetcheckup do
				if(targetcheckup[x]:hasDuration("pandemic")==false and targetcheckup[x]:hasDuration("infection")==false and targetcheckup[x].state~=1) then
					targetcheckup[x]:setDuration("infection",5000,caster.ID)
					targetcheckup[x]:sendAnimation(293)
				end
			end
		end

		if(#targetcheckdown>0) then
			for x=1,#targetcheckdown do
				if(targetcheckdown[x]:hasDuration("pandemic")==false and targetcheckdown[x]:hasDuration("infection")==false and targetcheckdown[x].state~=1) then
					targetcheckdown[x]:setDuration("infection",5000,caster.ID)
					targetcheckdown[x]:sendAnimation(293)
				end
			end
		end

		end

		
		--Checking Mob Targets

		targetcheckleft=player:getObjectsInCell(player.m,player.x-1,player.y,BL_MOB)
		targetcheckright=player:getObjectsInCell(player.m,player.x+1,player.y,BL_MOB)
		targetcheckup=player:getObjectsInCell(player.m,player.x,player.y-1,BL_MOB)
		targetcheckdown=player:getObjectsInCell(player.m,player.x,player.y+1,BL_MOB)



		if(#targetcheckleft>0) then
			for x=1,#targetcheckleft do
				if(targetcheckleft[x]:hasDuration("pandemic")==false and targetcheckleft[x]:hasDuration("infection")==false) then
					targetcheckleft[x]:setDuration("infection",5000,caster.ID)
					targetcheckleft[x]:sendAnimation(293)
				end
			end
		end


		if(#targetcheckright>0) then
			for x=1,#targetcheckright do
				if(targetcheckright[x]:hasDuration("pandemic")==false and targetcheckright[x]:hasDuration("infection")==false) then
					targetcheckright[x]:setDuration("infection",5000,caster.ID)
					targetcheckright[x]:sendAnimation(293)
				end
			end
		end


		if(#targetcheckup>0) then
			for x=1,#targetcheckup do
				if(targetcheckup[x]:hasDuration("pandemic")==false and targetcheckup[x]:hasDuration("infection")==false) then
					targetcheckup[x]:setDuration("infection",5000,caster.ID)
					targetcheckup[x]:sendAnimation(293)
				end
			end
		end

		if(#targetcheckdown>0) then
			for x=1,#targetcheckdown do
				if(targetcheckdown[x]:hasDuration("pandemic")==false and targetcheckdown[x]:hasDuration("infection")==false) then
					targetcheckdown[x]:setDuration("infection",5000,caster.ID)
					targetcheckdown[x]:sendAnimation(293)
				end
			end
		end


		local damage= caster.maxMagic * .0325
		damage = damage * 1.2
		caster:setAether("pandemic",14000-(caster.will/30*1000))

		if(player.blType==BL_MOB and caster.m~=player.m) then
			return
		end

		player.attacker=caster.ID
		player:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		player:sendAnimation(293)

	end,






	requirements=function(player)
		local l=42
		local i={0,"ghoulish_essence"}
		local ia={1000,3}
		local d={"Pandemic\n\nValkyr Spell\n\nInfects a foe which will transmit the disease","You shall have to sacrifice (3) Ghoulish essence and 2000 coins to learn this ability"}
		return l,i,ia,d
	end       
}







infection = {

	while_cast = function(player,caster)


		local damage= caster.maxMagic * .05
		damage = damage / 10

		if(player.blType==BL_MOB and caster.m~=player.m) then
			return
		end

		player.attacker=caster.ID
		player:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		player:sendAnimation(289)

	end
}



