examine = {
	cast=function(player,target)
	local d={}
	local e={}
	local m=player.m
	local x=player.x
	local y=player.y
	local calc=(player.grace/2)*1000
	local calc2=(200/player.grace)*1000
	if(player.magic<70) then
		player:sendMinitext("You do not have enough mana.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that")
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

	d=player:getObjectsInCell(m,x,y,BL_MOB)
	e=player:getObjectsInCell(m,x,y,BL_PC)
	if(#d>0) then
		if(d[1]:hasDuration("examine")) then
			player:sendMinitext("Examine is already running.")
			return
		end
		if(d[1]:hasDuration("expose_armor")) then
			player:sendMinitext("Expose armor is already running.")
			return
		end
		if(d[1]:hasDuration("tricks_of_the_trade_one")) then
			player:sendMinitext("Tricks of the trade is already running.")
			return
		end
		if(d[1]:hasDuration("tricks_of_the_trade_two")) then
			player:sendMinitext("Tricks of the trade is already running.")
			return
		end
		if(d[1]:hasDuration("tricks_of_the_trade_three")) then
			player:sendMinitext("Tricks of the trade is already running.")
			return
		end
		if(d[1]:hasDuration("tricks_of_the_trade_four")) then
			player:sendMinitext("Tricks of the trade is already running.")
			return
		end
		if(d[1]:hasDuration("tricks_of_the_trade_five")) then
			player:sendMinitext("Tricks of the trade is already running.")
			return
		end
	end
	if(#e>0) then
	if(e[1]:hasDuration("examine")) then
		player:sendMinitext("Examine is already running.")
		return
	end
	if(e[1]:hasDuration("expose_armor")) then
		player:sendMinitext("Expose armor is already running.")
		return
	end
	end
	if(#d>0) then
		if(d[1].blType==BL_MOB) then
			player:addMana(-70)
			player:sendAction(1,40)
			d[1]:sendAnimation(262)
			d[1].ac=d[1].ac+5
			d[1]:setDuration("examine",calc)
			player:playSound(55)
			player:sendMinitext("You cast Examine.")
			player:setAether("examine",10000)
		end
		return
	end
	if(#e>0) then
		if(player.pvp==true and e[1].state~=1) then

				player:addMana(-70)
				player:sendAction(1,40)
				e[1]:sendMinitext(player.name .." casts Examine on you.")
				e[1]:sendAnimation(262)
				e[1].ac=e[1].ac+5
				e[1]:setDuration("examine",calc)
				e[1]:sendStatus()
				player:playSound(55)
				player:sendMinitext("You cast Examine.")
				player:setAether("examine",10000)
		else
				player:sendAction(1,40)
				e[1]:sendAnimation(262)
				player:playSound(55)
				player:sendMinitext("You cast Examine.")
				player:setAether("examine",10000)
		end
		
	end	
	end,
	recast=function(player)
		player.ac=player.ac+5
		player:sendStatus()
	end,
	uncast=function(player)
		player.ac=player.ac-5
		player:sendStatus()
	end,
	fix=function(player)
		player.ac=player.ac+5
		player:sendStatus()
	end,
        while_cast=function(player)
		if(player.pvp==false) then
        		player:sendAnimation(34)
		end
        end,

	requirements=function(player)
		local l=17
		local i={0,6,66}
		local ia={250,1,1}
		local d={"Examine\n\nExamine an armor to expose weak spots for a short duration.","You shall sacrifice (1) Squirell's fur, (1) Amethyst and 250 coins to learn this ability"}
		return l,i,ia,d
	end       
}