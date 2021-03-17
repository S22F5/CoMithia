magical_roots = {
	cast=function(player,target)

                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
                end
		if(player.state==3) then
			player:sendMinitext("You cannot cast this spell on a mount.")
			return
		end
		if(target.state==1) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Sorcerers may use this ability.")
			return
		end

		if(target:hasDuration("magical_roots")==true or target:hasDuration("magical_roots_aether")==true) then
			player:sendMinitext("The spell is already active or has been cast on that target too recently")
			return
		end

		if(target.blType==BL_PC) then
			player:sendMinitext("Something went wrong")
			return
		end
		if(player.magic<=player.maxMagic/5) then
			player:sendMinitext("You do not have enough Mana.")
			return
		end


		target:setDuration("magical_roots",2000,player.ID)
		target:setDuration("magical_roots_aether",6000,player.ID)



        	player:sendAction(6,35)

	        player:playSound(48)
	        player:addMana(-player.maxMagic/5)
	        player:setAether("magical_roots",8000)


        end,

	uncast=function(player,caster)

		player:sendAnimation(196)
		local damage = caster.maxMagic * 0.125



		local targetcheckleft=player:getObjectsInCell(player.m,player.x-1,player.y,BL_MOB)
		local targetcheckright=player:getObjectsInCell(player.m,player.x+1,player.y,BL_MOB)
		local targetcheckup=player:getObjectsInCell(player.m,player.x,player.y-1,BL_MOB)
		local targetcheckdown=player:getObjectsInCell(player.m,player.x,player.y+1,BL_MOB)


		if(#targetcheckleft>0) then
			if(targetcheckleft[1]:hasDuration("magical_roots")==false and targetcheckleft[1]:hasDuration("magical_roots_aether")==false) then

				targetcheckleft[1]:setDuration("magical_roots",2000,caster.ID)
				targetcheckleft[1]:setDuration("magical_roots_aether",6000,caster.ID)

			end
		end


		if(#targetcheckleft>0) then
			if(targetcheckright[1]:hasDuration("magical_roots")==false and targetcheckright[1]:hasDuration("magical_roots_aether")==false) then

				targetcheckright[1]:setDuration("magical_roots",2000,caster.ID)
				targetcheckright[1]:setDuration("magical_roots_aether",6000,caster.ID)

			end
		end


		if(#targetcheckup>0) then
			if(targetcheckup[1]:hasDuration("magical_roots")==false and targetcheckup[1]:hasDuration("magical_roots_aether")==false) then

				targetcheckup[1]:setDuration("magical_roots",2000,caster.ID)
				targetcheckup[1]:setDuration("magical_roots_aether",6000,caster.ID)
	
			end
		end

		if(#targetcheckdown>0) then
			if(targetcheckdown[1]:hasDuration("magical_roots")==false and targetcheckdown[1]:hasDuration("magical_roots_aether")==false) then

				targetcheckdown[1]:setDuration("magical_roots",2000,caster.ID)
				targetcheckdown[1]:setDuration("magical_roots_aether",6000,caster.ID)

			end
		end


		if(player.blType==BL_MOB and caster.m~=player.m) then
			return
		end

		player.attacker=caster.ID
		player:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		

	end,

	while_cast = function(player,caster)

		player:sendAnimation(422)

	end,


	requirements=function(player)
		local l=57
		local i={0,376,377,6}
		local ia={2500,5,2,1}
		local d={"Magical roots\n\nSummon Magical roots to pierce ennemies. The roots will attach themselves on nearby monsters","You shall sacrifice (5) Bone, (2) Broken bones, (1) Squirrel fur and 2500 coins to learn this ability"}
		return l,i,ia,d
	end 
          
}

magical_roots_aether = {

-- This doesn't do anything, just declaring to make sure the spell can actually be cast.

}
