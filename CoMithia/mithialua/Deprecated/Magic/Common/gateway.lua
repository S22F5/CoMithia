gateway = {
	cast=function(player,target)
		local t=string.lower(player.question)
                local m=player.m
                local r
		local rax=math.random(1,3)
		local ray=math.random(1,3)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
                r=math.random(1,12) 
                if(m==17) then
		player:sendMinitext("You cast City Portal")
                   if(t=="e") then
			if(r==1) then
                        player:warp(17,133,88)
                        elseif(r==2) then
                        player:warp(17,134,88)
                        elseif(r==3) then
                        player:warp(17,135,88)
                        elseif(r==4) then
                        player:warp(17,133,89)
                        elseif(r==5) then
                        player:warp(17,134,89)
                        elseif(r==6) then
                        player:warp(17,135,89)
                        elseif(r==7) then
                        player:warp(17,133,90)
                        elseif(r==8) then
                        player:warp(17,134,90)
                        elseif(r==9) then
                        player:warp(17,135,90)
                        elseif(r==10) then
                        player:warp(17,133,91)
                        elseif(r==11) then
                        player:warp(17,134,91)
                        elseif(r==12) then
                        player:warp(17,135,91)
		        end
                   elseif(t=="w") then
			if(r==1) then
                        player:warp(17,7,90)
                        elseif(r==2) then
                        player:warp(17,8,90)
                        elseif(r==3) then
                        player:warp(17,9,90)
                        elseif(r==4) then
                        player:warp(17,7,91)
                        elseif(r==5) then
                        player:warp(17,8,91)
                        elseif(r==6) then
                        player:warp(17,9,91)
                        elseif(r==7) then
                        player:warp(17,7,92)
                        elseif(r==8) then
                        player:warp(17,8,92)
                        elseif(r==9) then
                        player:warp(17,9,92)
                        elseif(r==10) then
                        player:warp(17,7,93)
                        elseif(r==11) then
                        player:warp(17,8,93)
                        elseif(r==12) then
                        player:warp(17,9,93)
                        end
                   elseif(t=="n") then
			if(r==1) then
                        player:warp(17,73,22)
			elseif(r==2) then
                        player:warp(17,73,23)
                        elseif(r==3) then
                        player:warp(17,73,24)
                        elseif(r==4) then
                        player:warp(17,74,22)
                        elseif(r==5) then
                        player:warp(17,74,23)
                        elseif(r==6) then
                        player:warp(17,74,24)
                        elseif(r==7) then
                        player:warp(17,75,22)
                        elseif(r==8) then
                        player:warp(17,75,23)
                        elseif(r==9) then
                        player:warp(17,75,24)
                        elseif(r==10) then
                        player:warp(17,76,22)
                        elseif(r==11) then
                        player:warp(17,76,23)
                        elseif(r==12) then
                        player:warp(17,76,24)
                        end
                   elseif(t=="s") then
			if(r==1) then
                        player:warp(17,72,142)
			elseif(r==2) then
                        player:warp(17,72,143)
                        elseif(r==3) then
                        player:warp(17,72,144)
                        elseif(r==4) then
                        player:warp(17,73,142)
                        elseif(r==5) then
                        player:warp(17,73,143)
                        elseif(r==6) then
                        player:warp(17,73,144)
                        elseif(r==7) then
                        player:warp(17,74,142)
                        elseif(r==8) then
                        player:warp(17,74,143)
                        elseif(r==9) then
                        player:warp(17,74,144)
                        elseif(r==10) then
                        player:warp(17,75,142)
                        elseif(r==11) then
                        player:warp(17,75,143)
                        elseif(r==12) then
                        player:warp(17,75,144)
                        end
                   else player:sendMinitext("Invalid Gate")     
                   end
	          player:sendAction(6,35)
                  player:playSound(22)
		  elseif(player.m==45 and player.registry["hinterlandsportal"]==6) then
                   if(t=="e") then
			player:warp(45,95+rax,48+ray)
			player:sendMinitext("You cast Portal")   
                   elseif(t=="s") then
			player:warp(45,23+rax,95+ray)
			player:sendMinitext("You cast Portal")
                   elseif(t=="w") then
			player:warp(45,0+rax,48+ray)
			player:sendMinitext("You cast Portal")   
                   elseif(t=="n") then
			player:warp(45,12+rax,2+ray)
                        player:sendMinitext("You cast Portal") 
                   else player:sendMinitext("Invalid Gate")
     
                   end
		   	player:sendAction(6,35)
                   	player:playSound(22)
                  else player:sendMinitext("You don't know how to use that spell in here.")
                  end
	end
}