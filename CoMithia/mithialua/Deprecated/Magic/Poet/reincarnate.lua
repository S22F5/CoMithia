reincarnate = {
	cast=function(player,target)         
                if(player.state~=1) then
			player:sendMinitext("You are not dead!")
			return
		end
		for x=2000,2100 do
			if(player.m==x) then
				player:sendMinitext("You may not use Reincarnate on Carnages related maps.")
				return
			end
		end
		player:setAether("reincarnate",1200000)
		player.state=0
		player:addHealth(player.maxHealth/2)
		player:updateState()
		player:sendAnimation(387)
                player:playSound(112)
                player:sendAction(6,35)               
        end      
}