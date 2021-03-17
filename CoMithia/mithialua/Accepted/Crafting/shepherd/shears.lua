shears = {
on_hit = function(player, target)
	if (target and target.blType == BL_MOB and target.mobID >= 1000200 and target.mobID <= 1000209) then
		player:flushDuration(1)
	end
end

--[[on_equip = function(player)
		local craftlevel="Beginner"
		if(player.registry["shepherd"]>=1 and player.registry["shepherd"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["shepherd"]>=25 and player.registry["shepherd"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["shepherd"]>=220 and player.registry["shepherd"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["shepherd"]>=840 and player.registry["shepherd"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["shepherd"]>=2200 and player.registry["shepherd"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["shepherd"]>=6400 and player.registry["shepherd"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["shepherd"]>=18000 and player.registry["shepherd"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["shepherd"]>=50000 and player.registry["shepherd"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["shepherd"]>=124000 and player.registry["shepherd"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["shepherd"]>=237000 and player.registry["shepherd"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["shepherd"]>=400000 and player.registry["shepherd"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["shepherd"]>=680000) then
			craftlevel="Legendary"
		end
end,

on_swing = function(player)
	local npcCheck
	if(player.side == 0) then
		npcCheck=player:getObjectsInCell(player.m,player.x,(player.y)-1,BL_MOB)
		--player:talk(0,"NPC CHECK SET UP")
	elseif(player.side == 1) then
		npcCheck=player:getObjectsInCell(player.m,(player.x)+1,player.y,BL_MOB)
		--player:talk(0,"NPC CHECK SET RIGHT")
	elseif(player.side == 2) then
		npcCheck=player:getObjectsInCell(player.m,player.x,(player.y)+1,BL_MOB)
		--player:talk(0,"NPC CHECK SET DOWN")
	elseif(player.side == 3) then
		npcCheck=player:getObjectsInCell(player.m,(player.x)-1,player.y,BL_MOB)
		--player:talk(0,"NPC CHECK SET LEFT")
	end
	if(#npcCheck>0) then
		if(npcCheck[1].mobID == 1000200) then --valley sheep
				npcCheck[1]:removeHealth(10)
				if(math.random(0,2) == 0) then
					player:addItem("wool", 1)
					player.registry["shepherd"] = player.registry["shepherd"] + math.random(0,1)
				end
		end
		
		if(npcCheck[1].mobID == 1000201) then --golden valley sheep
			if(player.registry["shepherd"]>=220) then
				npcCheck[1]:removeHealth(10)
				if(math.random(0,2) == 0) then
					player:addItem("golden_wool", 1)
					player.registry["shepherd"] = player.registry["shepherd"] + math.random(0,1)
				end
			else
				player:sendMinitext("You are not experienced enough to shear a golden valley sheep.")
			end
		end
	end
end]]--
}