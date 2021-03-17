tile_thrower = {

	on_spawn = function(mob)
		
		mob.side = 1
		mob:sendSide()
		local x = math.random(1,15)
		local y = math.random(0,13)
		mob:warp(mob.m,x,y)
		local players = mob:getObjectsInArea(BL_PC)
		if(#players > 0) then
			mob:throw(players[1].x, players[1].y, 2221, 16, 2)
			
			setTile(mob.m,mob.x,mob.y,27887)
			if (getTile(mob.m,mob.x,mob.y-1) == 27887) then
				setTile(mob.m,mob.x,mob.y,27888)
			else
				setTile(mob.m,mob.x,mob.y,27887)
			end
			
			if (getTile(mob.m,mob.x,mob.y+1) == 27887) then
				setTile(mob.m,mob.x,mob.y+1,27888)
			elseif (getTile(mob.m,mob.x,mob.y-1) == 27888) then
				setTile(mob.m,mob.x,mob.y+1,27887)
			end
		end
		mob:warp(mob.m,0,0)
		mob:warp(1,0,0)
		mob:removeHealth(mob.health)
	end
	

}