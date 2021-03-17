tutorial_bird = {
on_spawn = function(mob)
	mob.side = 2
	mob:sendSide()
end,

move = function(mob)
	if (mob.y == 1) then
		mob:talk(0, "Birdie: Wait! I didn't get to thank you.")
	elseif (mob.y == 2) then
		if (mob.x == 4) then
			mob:talk(0, "Birdie: Argh no! It's a storm!")
			mob.side = 3
			mob.sendSide()
			mob:move()
			mob:sendAnimationXY(4, 4, 3, 0)--ignite***
		elseif (mob.x == 3) then
			mob.side = 2
			mob.sendSide()
			mob:move()
			return
		end
	elseif (mob.y == 3) then
		mob:talk(0, "Birdie: It almost hit me!")
	end
	
	mob.side = 2
	mob.sendSide()
	mob:move()
		
	if (mob.y == 4) then
		mob:talk(0, "Birdie: Argh, escape!")
		mob:sendAnimationXY(4, mob.x, 5, 0)--ignite***
		mob.attacker = mob.ID
		mob:removeHealth(mob.health)
		return
	end
end
}