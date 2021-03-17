pot = {
cast = function(player)
	player:setDuration("pot",30000)
end,

while_cast_250 = function(player)
	pot.health(player)
	pot.mana(player)
	--Post portion
end,

health = function(player)
	local health = player.health
	local mHealth = player.maxHealth
	local vRA = player.vRegenAmount / 4
	local vcount = 0
	
	if (health >= mHealth) then
		player.registry["pot_vRA"] = 0
		return
	end
	--Vita portion
	if (player.registry["pot_vRA"] >= 1000) then
		repeat
			player.registry["pot_vRA"] = player.registry["pot_vRA"] - 1000
			vcount = vcount + 1
		until player.registry["pot_vRA"] < 1000
	end
	
	if (vRA < 1) then
		player.registry["pot_vRA"] = player.registry["pot_vRA"] + (vRA * 1000)
	else
		repeat
			vRA = vRA - 1
			vcount = vcount + 1
		until vRA < 1
		player.registry["pot_vRA"] = player.registry["pot_vRA"] + (vRA * 1000)
		if (player.registry["pot_vRA"] >= 1000) then
			player.registry["pot_vRA"] = player.registry["pot_vRA"] - 1000
			vcount = vcount + 1
		end
	end
	
	if (vcount >= 0) then
		player:addHealth2(vcount)
	end
	--player:talk(0,"vcount = "..vcount..", vRA = "..vRA.." pot_vRA = "..player.registry["pot_vRA"])
end,

mana = function(player)
	local magic = player.magic
	local mMagic = player.maxMagic
	local mRA = player.mRegenAmount / 4
	local mcount = 0
	
	if (magic >= mMagic) then
		player.registry["pot_mRA"] = 0
		return
	end
	--Mana portion
	if (player.registry["pot_mRA"] >= 1000) then
		repeat
			player.registry["pot_mRA"] = player.registry["pot_mRA"] - 1000
			mcount = mcount + 1
		until player.registry["pot_mRA"] < 1000
	end
	
	if (mRA < 1) then
		player.registry["pot_mRA"] = player.registry["pot_mRA"] + (mRA * 1000)
	else
		repeat
			mRA = mRA - 1
			mcount = mcount + 1
		until mRA < 1
		player.registry["pot_mRA"] = player.registry["pot_mRA"] + (mRA * 1000)
		if (player.registry["pot_mRA"] >= 1000) then
			player.registry["pot_mRA"] = player.registry["pot_mRA"] - 1000
			mcount = mcount + 1
		end
	end
	
	if (mcount >= 0) then
		player:addMagic(mcount)
	end
	--player:talk(0,"mcount = "..mcount..", mRA = "..mRA.." pot_mRA = "..player.registry["pot_mRA"])
end,


uncast=function(player)
	player:sendMinitext("The effect has worn off.")
end
}