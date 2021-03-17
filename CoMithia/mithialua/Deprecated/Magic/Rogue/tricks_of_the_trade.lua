tricks_of_the_trade = {
	cast=function(player,target)
	local d={}
	local m=player.m
	local x=player.x
	local y=player.y
	if(player.magic<220) then
		player:sendMinitext("Your do not have enough mana.")
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
	if(#d==0) then
		player:sendMinitext("No possible target")
		return
	end
	if(#d>0) then
		if(d[1]:hasDuration("examine")) then
			player:sendMinitext("Examine is already running.")
			return
		end
		if(d[1]:hasDuration("expose_armor")) then
			player:sendMinitext("Expose armor is already running.")
			return
		end
	end
	local r={}
	local countrogues=0
	local check=0
	if(#d>0) then
		if(d[1]:hasDuration("tricks_of_the_trade_one")) then
			check=1
		end
		if(d[1]:hasDuration("tricks_of_the_trade_two")) then
			check=2
		end
		if(d[1]:hasDuration("tricks_of_the_trade_three")) then
			check=3
		end
		if(d[1]:hasDuration("tricks_of_the_trade_four")) then
			check=4
		end
		if(d[1]:hasDuration("tricks_of_the_trade_five")) then
			player:sendMinitext("Tricks of the Trade is already working at maximum capacity")
			return
		end
	end
	if(check==0) then
			d[1]:sendAnimation(215)
			player:playSound(505)
			player:sendAction(1,65)
			player:sendMinitext("You cast Tricks of the trade (1)")
			tricks_of_the_trade_one.cast(Mob(d[1].ID))
			player:setAether("tricks_of_the_trade",10000)
			player:addMana(-220)
			return
	elseif(check==1) then
			r=player:getObjectsInArea(BL_PC)
			if(#r>0) then
				for z=1,#r do
					if(r[z].class==2) then
						countrogues=countrogues+1
					end
				end	
			end
			if(countrogues<2) then
				player:sendMinitext("There must be at least two Rogues present to enhance.")
				return
			end
			d[1]:setDuration("tricks_of_the_trade_one",0)
			d[1]:sendAnimation(215)
			player:playSound(505)
			player:sendMinitext("You cast Tricks of the trade (2)")
			player:sendAction(1,65)
			tricks_of_the_trade_two.cast(Mob(d[1].ID))
			player:setAether("tricks_of_the_trade",10000)
			player:addMana(-220)
			return
	elseif(check==2) then
			r=player:getObjectsInArea(BL_PC)
			if(#r>0) then
				for z=1,#r do
					if(r[z].class==2) then
						countrogues=countrogues+1
					end
				end	
			end
			if(countrogues<3) then
				player:sendMinitext("There must be at least three Rogues present to enhance.")
				return
			end
			d[1]:setDuration("tricks_of_the_trade_two",0)
			d[1]:sendAnimation(215)
			player:playSound(505)
			player:sendAction(1,65)
			player:sendMinitext("You cast Tricks of the trade (3)")
			tricks_of_the_trade_three.cast(Mob(d[1].ID))
			player:setAether("tricks_of_the_trade",10000)
			player:addMana(-220)
			return
	elseif(check==3) then
			r=player:getObjectsInArea(BL_PC)
			if(#r>0) then
				for z=1,#r do
					if(r[z].class==2) then
						countrogues=countrogues+1
					end
				end	
			end
			if(countrogues<4) then
				player:sendMinitext("There must be at least four Rogues present to enhance.")
				return
			end
			d[1]:setDuration("tricks_of_the_trade_three",0)
			d[1]:sendAnimation(215)
			player:playSound(505)
			player:sendAction(1,65)
			player:sendMinitext("You cast Tricks of the trade (4)")
			tricks_of_the_trade_four.cast(Mob(d[1].ID))
			player:setAether("tricks_of_the_trade",10000)
			player:addMana(-220)
			return
	elseif(check==4) then
			r=player:getObjectsInArea(BL_PC)
			if(#r>0) then
				for z=1,#r do
					if(r[z].class==2) then
						countrogues=countrogues+1
					end
				end	
			end
			if(countrogues<5) then
				player:sendMinitext("There must be at least five Rogues present to enhance.")
				return
			end
			d[1]:setDuration("tricks_of_the_trade_four",0)
			d[1]:sendAnimation(205)
			player:sendAction(1,65)
			player:playSound(505)
			player:sendMinitext("You cast Tricks of the trade (5)")
			tricks_of_the_trade_five.cast(Mob(d[1].ID))
			player:setAether("tricks_of_the_trade",10000)
			player:addMana(-220)
			return
	end
	end
}

tricks_of_the_trade_one = {
	cast=function(player)
		player.ac=player.ac+10
		player:setDuration("tricks_of_the_trade_one",300000)
		player:sendStatus()
	end,
	uncast=function(player)
		player.ac=player.ac-10
	end
}

tricks_of_the_trade_two = {
	cast=function(player)
		player.ac=player.ac+20
		player:setDuration("tricks_of_the_trade_two",300000)
		player:sendStatus()
	end,
	uncast=function(player)
		player.ac=player.ac-20
	end
}

tricks_of_the_trade_three = {
	cast=function(player)
		player.ac=player.ac+30
		player:setDuration("tricks_of_the_trade_three",300000)
		player:sendStatus()
	end,
	uncast=function(player)
		player.ac=player.ac-30
	end
}

tricks_of_the_trade_four = {
	cast=function(player)
		player.ac=player.ac+40
		player:setDuration("tricks_of_the_trade_four",300000)
		player:sendStatus()
	end,
	uncast=function(player)
		player.ac=player.ac-40
	end
}

tricks_of_the_trade_five = {
	cast=function(player)
		player.ac=player.ac+50
		player:setDuration("tricks_of_the_trade_five",300000)
		player:sendStatus()
	end,
	uncast=function(player)
		player.ac=player.ac-50
	end
}
