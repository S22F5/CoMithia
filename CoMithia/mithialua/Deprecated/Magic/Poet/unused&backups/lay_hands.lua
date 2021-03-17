lay_hands = {
	cast=function(player,target)



	player:sendMinitext("This spell has been deprecated and does not exist anymore")
	return



--[[	local d={}
	local m=player.m
	local x=player.x
	local y=player.y
	if(player.magic<90) then
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
			player:addMana(-90)
			player:sendAction(6,40)
			player:playSound(22)
			d[1]:sendAnimation(65)
			d[1]:addHealth(300)
			d[1]:sendMinitext(player.name .." casts Lay hands on you.")
		     	player:sendMinitext("You cast Lay hands.")
		else
			player:sendMinitext("Something went wrong.")			
		end
	else
		player:sendMinitext("There is no target to heal!")
	end
]]--
	end,
	requirements=function(player)
		local l=17
		local i={0,5,207,66}
		local ia={400,50,5,1}
		local d={"Lay hands\n\nLay your hands upon a target to heal it","You shall sacrifice (50) Chestnut, (5) Petrified root, (1) Amethyst and 400 coins to learn this ability."}
		return l,i,ia,d
		
	end
}
