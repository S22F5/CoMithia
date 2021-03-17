ruins2_barrel = {

	check = function(player)
		local x = player.x
		local y = player.y
		
		local b1 = {6,4}
		local b2 = {4,6}
		local b3 = {14,5}
		local b4 = {13,9}
		local b5 = {5,12}
		local b6 = {10,14}
		local b7 = {14,17}
		local b8 = {4,19}
		local b9 = {12,21}
		local b10 = {6,23}
		--check for barrel one.
		if(((x == b1[1]-1 and y == b1[2]) or (x == b1[1] and y == b1[2])  or (x == b1[1]+1 and y == b1[2])  or (x == b1[1]+2 and y == b1[2])  
			or (x == b1[1] and y == b1[2]-1) or (x == b1[1]+1 and y == b1[2]-1) or (x == b1[1] and y == b1[2]+1) or (x == b1[1]+1 and y == b1[2]+1))
			and getObject(player.m,b1[1],b1[2]) == 7480) then
			ruins2_barrel.trigger(player, b1)
		elseif(((x == b2[1]-1 and y == b2[2]) or (x == b2[1] and y == b2[2])  or (x == b2[1]+1 and y == b2[2])  or (x == b2[1]+2 and y == b2[2])  
			or (x == b2[1] and y == b2[2]-1) or (x == b2[1]+1 and y == b2[2]-1) or (x == b2[1] and y == b2[2]+1) or (x == b2[1]+1 and y == b2[2]+1))
			and getObject(player.m,b2[1],b2[2]) == 7480) then
			ruins2_barrel.trigger(player, b2)
		elseif(((x == b3[1]-1 and y == b3[2]) or (x == b3[1] and y == b3[2])  or (x == b3[1]+1 and y == b3[2])  or (x == b3[1]+2 and y == b3[2])  
			or (x == b3[1] and y == b3[2]-1) or (x == b3[1]+1 and y == b3[2]-1) or (x == b3[1] and y == b3[2]+1) or (x == b3[1]+1 and y == b3[2]+1))
			and getObject(player.m,b3[1],b3[2]) == 7480) then
			ruins2_barrel.trigger(player, b3)
		elseif(((x == b4[1]-1 and y == b4[2]) or (x == b4[1] and y == b4[2])  or (x == b4[1]+1 and y == b4[2])  or (x == b4[1]+2 and y == b4[2])  
			or (x == b4[1] and y == b4[2]-1) or (x == b4[1]+1 and y == b4[2]-1) or (x == b4[1] and y == b4[2]+1) or (x == b4[1]+1 and y == b4[2]+1))
			and getObject(player.m,b4[1],b4[2]) == 7480) then
			ruins2_barrel.trigger(player, b4)
		elseif(((x == b5[1]-1 and y == b5[2]) or (x == b5[1] and y == b5[2])  or (x == b5[1]+1 and y == b5[2])  or (x == b5[1]+2 and y == b5[2])  
			or (x == b5[1] and y == b5[2]-1) or (x == b5[1]+1 and y == b5[2]-1) or (x == b5[1] and y == b5[2]+1) or (x == b5[1]+1 and y == b5[2]+1))
			and getObject(player.m,b5[1],b5[2]) == 7480) then
			ruins2_barrel.trigger(player, b5)
		elseif(((x == b6[1]-1 and y == b6[2]) or (x == b6[1] and y == b6[2])  or (x == b6[1]+1 and y == b6[2])  or (x == b6[1]+2 and y == b6[2])  
			or (x == b6[1] and y == b6[2]-1) or (x == b6[1]+1 and y == b6[2]-1) or (x == b6[1] and y == b6[2]+1) or (x == b6[1]+1 and y == b6[2]+1))
			and getObject(player.m,b6[1],b6[2]) == 7480) then
			ruins2_barrel.trigger(player, b6)
		elseif(((x == b7[1]-1 and y == b7[2]) or (x == b7[1] and y == b7[2])  or (x == b7[1]+1 and y == b7[2])  or (x == b7[1]+2 and y == b7[2])  
			or (x == b7[1] and y == b7[2]-1) or (x == b7[1]+1 and y == b7[2]-1) or (x == b7[1] and y == b7[2]+1) or (x == b7[1]+1 and y == b7[2]+1))
			and getObject(player.m,b7[1],b7[2]) == 7480) then
			ruins2_barrel.trigger(player, b7)
		elseif(((x == b8[1]-1 and y == b8[2]) or (x == b8[1] and y == b8[2])  or (x == b8[1]+1 and y == b8[2])  or (x == b8[1]+2 and y == b8[2])  
			or (x == b8[1] and y == b8[2]-1) or (x == b8[1]+1 and y == b8[2]-1) or (x == b8[1] and y == b8[2]+1) or (x == b8[1]+1 and y == b8[2]+1))
			and getObject(player.m,b8[1],b8[2]) == 7480) then
			ruins2_barrel.trigger(player, b8)
		elseif(((x == b9[1]-1 and y == b9[2]) or (x == b9[1] and y == b9[2])  or (x == b9[1]+1 and y == b9[2])  or (x == b9[1]+2 and y == b9[2])  
			or (x == b9[1] and y == b9[2]-1) or (x == b9[1]+1 and y == b9[2]-1) or (x == b9[1] and y == b9[2]+1) or (x == b9[1]+1 and y == b9[2]+1))
			and getObject(player.m,b9[1],b9[2]) == 7480) then
			ruins2_barrel.trigger(player, b9)
		elseif(((x == b10[1]-1 and y == b10[2]) or (x == b10[1] and y == b10[2])  or (x == b10[1]+1 and y == b10[2])  or (x == b10[1]+2 and y == b10[2])  
			or (x == b10[1] and y == b10[2]-1) or (x == b10[1]+1 and y == b10[2]-1) or (x == b10[1] and y == b10[2]+1) or (x == b10[1]+1 and y == b10[2]+1))
			and getObject(player.m,b10[1],b10[2]) == 7480) then
			ruins2_barrel.trigger(player, b10)
		end
	end,
	
	trigger = function(player, b)
		setObject(player.m,b[1],b[2],0)
		setObject(player.m,b[1]+1,b[2],0)
		player:sendAnimationXY(352,b[1],b[2],1)
		player:sendAnimationXY(352,b[1]+1,b[2],1)
	end
}