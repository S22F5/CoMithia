recovery = {
cast = function(player,target)
	local cost = (math.floor((player.level*1.75) + (player.might * 2)))*2
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end	
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end	
	if(player:hasDuration("recovery")) then
		player:sendMinitext("You already cast that.")
		return
	end
	if(player.regenTime <= 28500)then
		player:sendMinitext("You may not use this spell at your current state.")
		return
	end
	
	if(player.magic>=cost) then
		player:sendAction(6,35)
		player:sendMinitext("You cast Recovery.")
		player:addMana(-cost)
		player:setDuration("recovery",6000)
		player:setAether("recovery",4000)
		player:sendAnimation(5)
		player:playSound(61)
	else
		player:sendMinitext("You don't have enough Mana.")
	end
end,

while_cast = function(player)
	local duration = player:getDuration("recovery")
	local amt
	local duraSec = math.floor(duration/1000)	

	if (duraSec >= 3) then
		amt = math.floor(player.level*1.75) + (player.might * 2)
	elseif ((duraSec < 3) and (player:hasAether("recovery"))) then
		amt = math.floor(player.level*1.25) + (player.might * 1.2)
	else
		local multiplier = (3 - duraSec)*0.25
		amt = math.floor((multiplier)* (math.ceil(player.level*1.5) + (player.might * 2)))
	end
	
	player:addHealth(amt)
end,


uncast=function(player)
end,

passive_on_takedamage = function(player,attacker)
	if (player:hasAether("recovery")) then
		--do nothing
	else
		if (player:hasDuration("recovery")) then
			player.registry["no_uncast_recovery"] = 0
		else
			player.registry["no_uncast_recovery"] = 1
			player:setDuration("recovery",3000)
			player:setAether("recovery",9000)
		end
	end
end,

on_takedamage_while_cast = function(player,attacker)
	if (player.registry["no_uncast_recovery"] == 0) then
		player:setDuration("recovery",0)
	end
end

}