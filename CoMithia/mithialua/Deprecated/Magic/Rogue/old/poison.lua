poison = {
cast = function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end

	local input = string.lower(player.question)
	
	if (input == "prepare") or (input == "pre") or (input == "p") then
		prepare.cast(player)
	elseif (input == "poison strike") or (input == "ps") or (input == "s") then
		poison_strike.cast(player)
	elseif (input == "crippling") then
		crippling_poison.cast(player)
	elseif (input == "mind-numbing") or (input == "mn") then
		mind_numbing_poison.cast(player)
	elseif (input == "deadly") then
		deadly_poison.cast(player)
	elseif (input == "wound") then
	else
		--if player req met then...
		player:sendMinitext("")
	end
end
}