r2_s_grandma = {
click = async(function(player,npc)
end),





action = function(npc, player)
	local str = {""..npc.name..": Need to be careful these days, those wolves have started chasing after me for some reason.",
	""..npc.name..": I remember the old days, when sheep could roam freely.",
	""..npc.name..": Someone needs to do something about those wolves.",
	""..npc.name..": This? This is all hair... What? You can see the wool!?"
	}
	
	local rstr = math.random(#str)
	if (math.random(20) == 8) then
		npc:talk(0,""..str[rstr])
	end
end
}