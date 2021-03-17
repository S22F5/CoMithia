cursed_soul = { 
on_break = function(player)
	if (player.state ~= 1) then
		player:sendAction(12, 80)
	end
end,

on_takedamage = function(player, attacker)
	if (attacker == nil) then
		return
	end
	
	local chance = math.random(100000)
	if (chance <= 5000) then--5% chance
		local amount = 500 + math.random(15) + (player.will / 10)
		if (player.magic + amount >= player.maxMagic) then
			return
		end
		player:addMagic(amount)
		player:sendMinitext("Your cursed soul gathers you "..amount.." mana.")
	end
end
}