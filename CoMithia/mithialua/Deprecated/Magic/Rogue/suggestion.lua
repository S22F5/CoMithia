suggestion = {
	cast=function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.magic<50) then
		player:sendMinitext("You do not have enough mana.")
		return
	end
	if(target:hasDuration("suggestion")) then
		player:sendMinitext("Suggestion is already in effect.")
		return
	end
	if(target.state==1 or target.blType==BL_MOB or target.blType==BL_NPC) then
		player:sendMinitext("Something went wrong.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end

		player:sendMinitext("You cast Suggestion.")
		player:sendAction(6,35)
		target:sendAnimation(15)
		player:playSound(30)
		player:addMana(-50)
		target:setDuration("suggestion",180000)
		player:setAether("suggestion",180000)
		player:sendStatus()
	end,
	recast=function(player,target)
		player:sendStatus()
	end,
	uncast=function(player,target)
		player:sendStatus()
	end,
	fix=function(player)
		player:sendStatus()
	end
}