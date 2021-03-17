gatewaybackup = {
	cast=function(player,target)
		local t=player.question
                local m=player.m
                 if(m==17) then
                   if(t=="e") then
			player:warp(17,130,89)
			player:sendMinitext("You cast City Portal")
                   elseif(t=="w") then
                        player:warp(17,9,91)
			player:sendMinitext("You cast City Portal")
                   elseif(t=="n") then
                        player:warp(17,74,23)
			player:sendMinitext("You cast City Portal")
                   elseif(t=="s") then
                        player:warp(17,74,146)
                        player:sendMinitext("You cast City Portal")
                   else player:sendMinitext("n,s,e,w")     
                   end
	          player:sendAction(6,35)
                  player:playSound(22)
                  else player:sendMinitext("You're not in a City")
                  end
	end
}