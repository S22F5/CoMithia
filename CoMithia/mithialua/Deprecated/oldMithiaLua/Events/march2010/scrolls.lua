scroll_of_replenishment = {
	use = function(player)
		if(player.state==1 or player.state==3) then
			player:sendMinitext("You can't do that.")
			return
		end

		convert.cast(player)
       
		player:removeItem("scroll_of_replenishment",1) 
  end
}

scroll_of_wrath = {
	use = function(player)
		if(player.state==1 or player.state==3) then
			player:sendMinitext("You can't do that.")
			return
		end
		if(player:hasSpell("scroll_of_wrath")) then
			player:sendMinitext("You already know that spell.")
			return
		end

		player:addSpell("scroll_of_wrath")
		player:sendMinitext("Your mind expands as you learn Scroll of Wrath.")
       
		player:removeItem("scroll_of_wrath",1) 
	end,

	cast=function(player,target)
		local calc
		local calc3
		local calc4
		local calc5
                local calc6
                local calc7
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

		if(player.magic<100) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		if(target.blType==BL_MOB) then
		calc=player.magic*1.8
		calc6=player.health*0.1
		calc7=calc6+calc
		calc3=player.magic*0.1
		calc4=player.magic
		calc5=player.health
		player:sendAction(6,35)
		player:playSound(81)
		target:sendAnimation(198)
		player:sendMinitext("You cast Thor's wrath.")
		target.attacker=player.ID
		target:removeHealthExtend(calc7, 1, 1, 1, 1, 0)
		player:addMana(calc3-calc4)
		
		if(player.health<calc3) then
			player:addHealth2(100-calc5)
		else
			player:removeHealth2(calc3)
		end
		end

		if(target.blType==BL_PC) then
			if(player.pvp==true) then
				calc=player.magic*1.8
				calc6=player.health*0.1
				calc7=calc6+calc
				calc3=player.magic*0.1
				calc4=player.magic
				calc5=player.health
				target.attacker=player.ID
				target:sendMinitext(player.name .. " casts Scroll of Wrath on you.")
				player:sendAction(6,35)
				player:playSound(81)
                		target:sendAnimation(198)
				player:sendMinitext("You cast Scroll of Wrath.")
				target:removeHealthExtend(calc7, 1, 1, 1, 1, 0)
				player:addMana(calc3-calc4)
				if(player.health<calc3) then
					player:addHealth2(100-calc5)
				else
					player:removeHealth2(calc3)
				end
			else
				player:sendMinitext("Something went wrong.")
			end
		end
		player:removeSpell("scroll_of_wrath")
		player:sendMinitext("The scroll of wrath vanishes from your spellbook")
	end 

}

scroll_of_power = {
	use = function(player)
		if(player.state==1 or player.state==3) then
			player:sendMinitext("You can't do that.")
			return
		end

		blade_rush.cast(player)
       
		player:removeItem("scroll_of_power",1) 
  end
}

scroll_of_quickness = {
	use = function(player)
		if(player.state==1 or player.state==3) then
			player:sendMinitext("You can't do that.")
			return
		end

		dancing_edge.cast(player)
       
		player:removeItem("scroll_of_quickness",1) 
  end
}

scroll_of_vitality = {
	use = function(player)
		if(player.state==1 or player.state==3) then
			player:sendMinitext("You can't do that.")
			return
		end

		player:addHealth(player.maxHealth)
		player:addMana(player.maxMagic)
                player:sendAnimation(165)
                player:playSound(83)
       
		player:removeItem("scroll_of_vitality",1) 
  end
}

scroll_of_immortals = {
	use = function(player)
		if(player.state==1 or player.state==3) then
			player:sendMinitext("You can't do that.")
			return
		end

		mind_explosion.cast(player)
       
		player:removeItem("scroll_of_immortals",1) 
  end
}

scroll_of_mithia = {
	use = function(player)
		if(player.state==1) then 
			player:sendMinitext("You can't do that.")
			return
		end
		if(player.state==3) then 
			player:sendMinitext("You can't do that.")
			return
		end
		if(player.state==4) then 
			player:sendMinitext("You can't do that.")
			return
		end
		if(player:hasDuration("scroll_of_mithia")) then 
			player:sendMinitext("You can't do that.")
			return
		end


		player:setDuration("scroll_of_mithia",180000)
		player.rage=player.rage*2
		player:sendAnimation(158)
		player.state=4
		player.disguise=220
		player.disguiseColor=31
		player:updateState()	
		player:removeItem("scroll_of_mithia",1) 
  	end,
	

	uncast = function(player)
		player.rage=player.rage/2
		if(player.state~=1) then
			player.state=0
		end
		player.disguise=0
		player:updateState()
	end
}


scroll_of_curse = {
	use = function(player)
		local area= {}
		if(player.state==1 or player.state==3) then
			player:sendMinitext("You can't do that.")
			return
		end
		
		area=player:getObjectsInArea(BL_MOB)
		
		if(#area>0) then
			for x=1,#area do
				if(area[x]:hasDuration("hex")) then
					--nothing
				else					
					hex.cast(player,area[x])					
				end
			end
		end
       
		player:removeItem("scroll_of_curse",1) 
  end
}


