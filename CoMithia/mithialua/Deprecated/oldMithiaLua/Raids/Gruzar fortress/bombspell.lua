bomb_spell = {
	while_cast=function(player)
		player:sendAnimation(48)
		player:talk(2,"I have the bomb!!!")
	end,
	uncast=function(player)
		local check = {}
		player:sendAnimation(19)
		player.attacker=player.ID
		if(player.state~=1) then
			player:removeHealth(18000)
		end
		player:addMana(-player.magic/2)
		if(player.m~=20002) then
			return
		end
		for x=-3,3 do
			for y=-3,3 do
				check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
				if(#check>0) then
					for z=1,#check do
						if(check[z].ID~=player.ID and check[z].state~=1) then
							check[z].attacker=player.ID
							check[z]:sendAnimation(19)
							check[z]:removeHealthExtend(1000000, 1, 1, 1, 1, 0)
						end
					end
				end
			end
		end
		player:broadcast(player.m,"-"..player.name.." explodes!-")
	end
}