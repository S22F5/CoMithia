absolve = {
cast = function(player, target)
	local magicCost = 60
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That cannot save them now.")
		return
	end
	
	player:sendAction(6, 20)
	player:playSound(108)
	target:sendAnimation(169, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Absolve.")
	
	if (target:hasDuration("afflict")) then
		target:setDuration("afflict", 0)
	end
	
	if (target:hasDuration("curse")) then
		target:setDuration("curse", 0)
	end
	
	if (target:hasDuration("plague")) then
		target:setDuration("plague", 0)
	end
	
	if (target:hasDuration("leech_trap")) then
		target:setDuration("leech_trap", 0)
	end
	
	if (target:hasDuration("viper_trap")) then
		target:setDuration("viper_trap", 0)
	end
	
	if (target:hasDuration("cobra_trap")) then
		target:setDuration("cobra_trap", 0)
	end
	
	if ((target:getDuration("sly_fox_venom") / 2) > 2000) then
		target:setDuration("sly_fox_venom", (target:getDuration("sly_fox_venom") / 2))
	elseif ((target:getDuration("sly_fox_venom") - 1000) > 1100) then
		target:setDuration("sly_fox_venom", (target:getDuration("sly_fox_venom") - 1000))
	end
	
	if ((target:getDuration("fox_ball_poison") / 2) > 2000) then
		target:setDuration("fox_ball_poison", (target:getDuration("fox_ball_poison") / 2))
	elseif ((target:getDuration("fox_ball_poison") - 1000) > 1100) then
		target:setDuration("fox_ball_poison", (target:getDuration("fox_ball_poison") - 1000))
	end

	if (target:getDuration("sly_fox_debuff") > 1500) then
		target:setDuration("sly_fox_debuff", (target:getDuration("sly_fox_debuff") - 1000))
	end

	if (target:hasDuration("fox_ball_flash")) then
		target:setDuration("fox_ball_flash", 0)
	end

	if (target:hasDuration("fox_ball_freezing")) then
		target:setDuration("fox_ball_freezing", 0)
	end	
	
	
	if (target.blType == BL_PC) then
		target:sendMinitext(player.name.." absolves you.")
	end
end,

requirements = function(player)
	local level = 15
	local items = {}
	local itemAmounts = {}
	local description = {"Removes negative affects from a target"}
	return level, items, itemAmounts, description
end
}