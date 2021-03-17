darken_soul = {
	cast=function(player,target)
		if(player.state~=1) then         
			target:setDuration("darken_soul",30000)
			target:sendAnimation(145)
                     if(player.ID~=target.ID) then
   			target:sendMinitext("Gruzar darkens your soul!")
		     end
		end                                 
        end,
 	
	while_cast=function(player)
		local check= {}
		local count=1
		for x=-1,1 do
			for y=-1,1 do
				local absx=math.abs(x)
				local absy=math.abs(y)
				if(absx+absy==1) then
					check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
					if(#check>0) then
						count=count+1
					end
				end
			end
		end
		if(count>=5) then
			count=4
		end
				
				

		dam=player.maxHealth*0.02
		for z=1,count do
			if(z~=1) then
				dam=dam*2
			end
		end
		player:removeHealth(dam)
		player:sendAnimation(343)
		--player:playSound(40)
	end
}