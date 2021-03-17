backup_holy_hands = {
	cast=function(player,target)
	local d={}
	local m=player.m
	local x=player.x
	local y=player.y
	if(player.magic<320) then
		player:sendMinitext("You do not have enough mana.")
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

	if(player.side==0) then y=y-1 end
	if(player.side==1) then x=x+1 end
	if(player.side==2) then y=y+1 end
	if(player.side==3) then x=x-1 end

	d=player:getObjectsInCell(m,x,y,BL_PC)
	if(#d>0) then
		if(d[1].blType==BL_PC) then
			if(d[1].state==1) then
				player:sendMinitext("The injuries are too deep to be healed this way.")
				return
			end
			player:addMana(-320)
			player:sendAction(6,40)
			player:playSound(22)
			d[1]:sendAnimation(65)
			d[1]:addHealth(2500)
			d[1]:sendMinitext(player.name .." casts Holy hands on you.")
		     	player:sendMinitext("You cast Holy hands.")
		else
			player:sendMinitext("Something went wrong.")			
		end
	else
		player:sendMinitext("There is no target to heal!")
	end
	player:setAether("holy_hands",2000)

	end,
	requirements=function(player)
		local l=74
		local i={0,58,244}
		local ia={4200,2,10}
		local d={"Holy hands\n\nLay your hands upon a target to heal serious wounds","You shall sacrifice (2) Tiger's eye, (10) Vial of blood and 4200 coins to learn this ability."}
		return l,i,ia,d
		
	end
}
