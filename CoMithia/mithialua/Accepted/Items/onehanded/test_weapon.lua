test_weapon = {
on_hit = function(player,target)
	local mM = player.maxMagic
	local m = player.magic
	local amt = mM - m

	if (mM > 0) then
		amt = amt / mM
		amt = (amt * mM/20) + 2
		player:addMagic(amt)
		--player:talk(0,"Total: "..amt)
	end
end
}