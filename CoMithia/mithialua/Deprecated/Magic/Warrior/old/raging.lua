raging = {
cast = function(player,target)
	player:sendMinitext("This spell can not be cast.")
end,

passive_on_hit = function(player,target)
	player.registry["spell_raging"] = player.registry["spell_raging"] + 10
	local raging = player.registry["spell_raging"]
	local rageon = math.random(5,20)
	local aether = (math.floor(rageon*3/4))*1000
	local duration = (math.floor(rageon*1.5))*1000
	if (raging >= rageon) then
		if (player:hasAether("raging")) then
			--player:sendMinitext("You have not build enough rage to unleash it.")
		else
			if (player:hasDuration("raging")) then
				player.registry["spell_raging"] = raging + 1
				--player:talk(0,"before: "..player.damage)
				player.damage = player.damage * ((raging / 100)+1)
				--player:talk(2,"after: "..player.damage)
				target:sendAnimation(331)
				player.registry["spell_raging"] = player.registry["spell_raging"] * 0.75
				player:setAether("raging",1500)
			end
		end
	end
	if (player:hasDuration("raging")) then
	else
		player:setDuration("raging",duration)
		player:setAether("raging",aether)
	end
	--player:talk(0,"count: "..player.registry["spell_raging"]/100)
end,


passive_on_takedamage = function(player,attacker)
	local amt
	if (player:hasDuration("raging")) then
		amt = math.random(2,3)
	else
		local amtT = {1,1,1,1,1,1,1,2,2,2}
		amt = amtT[math.random(#amtT)]
	end
	--player:talk(0,"Amt: "..amt)
	player.registry["spell_raging"] = player.registry["spell_raging"] + amt
end,


while_passive = function(player)
	if (player.registry["spell_raging"] > 0) then
		local deduct
		if (player:hasDuration("raging")) then
			local amtT = {1,1,1,1,1,1,1,1,1,2,2}
			deduct = amtT[math.random(#amtT)]
		else
			deduct= math.random(3,7)
		end
		--player:talk(0,"Deduct: "..deduct)
		player.registry["spell_raging"] = player.registry["spell_raging"] - deduct
	end
end,


uncast=function(player)
	player.registry["spell_raging"] = math.floor(player.registry["spell_raging"]/2)
end,


while_cast = function(player)
end
}