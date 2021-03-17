crippling_arrow_spell = {

		uncast=function(player,target)

			if(player.blType==BL_MOB) then
				player.newMove=0
			end

			
			if(player.blType==BL_PC) then
				player.speed=player.speed-50
				player:updateState()
			end


		end
		
}



poison_arrow_spell = {

		while_cast=function(player,caster)

			if(caster.magic<(caster.maxMagic/100)) then
				return
			end



			caster:addMana(-caster.maxMagic/100)


			local damage=((caster.maxHealth*0.5)+(caster.maxMagic))
			damage=damage+(damage*caster.dam/100)
			

			player.attacker=caster.ID
			player:sendAnimation(289)
			player:removeHealthExtend(damage/8, 1, 1, 1, 1, 0)
			
			

		end
		
}