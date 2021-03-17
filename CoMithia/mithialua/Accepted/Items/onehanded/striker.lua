striker = {
	on_hit = function(player,target)
		local x=math.random(1,10)
		local y=math.random(1,30)
		local z=math.random(15,40)
		local w=x*0.5*player.rage*player.invis*player.enchant
		local v=y*0.8*player.rage*player.invis*player.enchant

		if(player.class==1 and x==1) then
				player:sendMinitext("You lunge forward to perform a crushing blow.")
				target:sendAnimation(128)
				player:playSound(30)
				target:removeHealthExtend(w, 1, 1, 1, 1, 0)
		elseif(player.class==2 and y==1) then
				player:sendMinitext("You flex your muscles and quickly lunge at the target.")
				target:sendAnimation(128)
				player:playSound(30)
				target:removeHealthExtend(v, 1, 1, 1, 1, 0)

		end

			
		

	end
}