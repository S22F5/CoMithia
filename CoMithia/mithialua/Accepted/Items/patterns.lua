patterns = {
itemInfo = function(player, pattern)
	local item = Item(pattern)
	local popup = ""
	local aspdstr = ""
	
	if (item ~= nil) then
		if (item.attackSpeed < -24) then
			aspdstr = "Speedhacking"
		elseif (item.attackSpeed >= -24 and item.attackSpeed < -16) then
			aspdstr = "Extremely Fast"
		elseif (item.attackSpeed >= -16 and item.attackSpeed < -8) then
			aspdstr = "Very Fast"
		elseif (item.attackSpeed >= -8 and item.attackSpeed < 0) then
			aspdstr = "Fast"
		elseif (item.attackSpeed == 0) then
			aspdstr = "Normal"
		elseif (item.attackSpeed > 0 and item.attackSpeed <= 8) then
			aspdstr = "Slow"
		elseif (item.attackSpeed > 8 and item.attackSpeed <= 16) then
			aspdstr = "Very Slow"
		elseif (item.attackSpeed > 16 and item.attackSpeed <= 24) then
			aspdstr = "Extremely Slow"
		elseif (item.attackspeed > 24) then
			aspdstr = "Gooey"
		end
		popup = popup.."<b>"..item.name.."\n\nWeapon Damage: "..item.minDmg.." - "..item.maxDmg.."\nVita/Mana: "..item.vita.."/"..item.mana.."\nDurability: "..item.maxDura.."/"..item.maxDura.."\nHit/Damage: "..item.hit.."/"..item.dam
		popup = popup.."\nMight/Grace/Will: "..item.might.."/"..item.grace.."/"..item.will.."\nAC/MR: "..item.ac.."/".."\nProtection: "..item.protection.."\nWisdom: "..item.wisdom.."\nCon: "..item.con.."\nAttack Speed: "..aspdstr
		popup = popup.."\n\n<b>Requirements\n\nLevel: "..item.level.."\nClass: "..item.className.."\nVita/Mana: "..item.reqVita.."/"..item.reqMana.."\nMight/Grace/Will: "..item.reqMight.."/"..item.reqGrace.."/"..item.reqWill
		player:popUp(popup)
	else
		player:talk(0,"uh oh")
	end
end
}
pattern_cowhide = {
use = function(player)
	patterns.itemInfo(player, "cowhide")
end
}
pattern_bulwark = {
use = function(player)
	patterns.itemInfo(player, "bulwark")
end
}
pattern_studded_shield = {
use = function(player)
	patterns.itemInfo(player, "studded_shield")
end
}
pattern_sleighted_shield = {
use = function(player)
	patterns.itemInfo(player, "sleighted_shield")
end
}
pattern_starshine = {
use = function(player)
	patterns.itemInfo(player, "starshine")
end
}
pattern_fragment_of_time = {
use = function(player)
	patterns.itemInfo(player, "fragment_of_time")
end
}
pattern_preservative = {
use = function(player)
	patterns.itemInfo(player, "preservative")
end
}
pattern_balance = {
use = function(player)
	patterns.itemInfo(player, "balance")
end
}