domination_res = {
		uncast=function(player,target)
			player.paralyzed=false
			if(player.state==1) then
			player.state=0
			player:addHealth(player.maxHealth)
			player:addMana(player.maxMagic)
			player:flushDuration()
			player:updateState()
			player:sendStatus()
			player:sendMinitext("You're once again ready for battle!")
			return
			end
			

		end

     
}



