hosts_barricade = {
	cast=function(player,target)
	if((player.m~=2005) and (player.m<2010 or player.m>2100)) then
		player:sendMinitext("You may only use this ability on Carnage maps.")
		return
	end
	if(player.armorColor~=15) then
		player:sendMinitext("Host dye is required.")
		return
	end
	local x=player.x
	local y=player.y

	if(player.side==0) then y=y-1 end
	if(player.side==1) then x=x+1 end
	if(player.side==2) then y=y+1 end
	if(player.side==3) then x=x-1 end

	local bar=player:getObjectsInCell(player.m,x,y,BL_MOB)
	local count=0
	local check=0
	local delete=0
	if(#bar>0) then
		for z=1,#bar do
			if(string.lower(bar[z].name)=="barricade") then
				bar[z].attacker=player.ID
				bar[z]:removeHealth(3000000000)
				delete=1
			end
		end
	end
	if(delete==0) then
		local barcheck=player:getObjectsInCell(player.m,player.x,player.y,BL_MOB)
			if(#barcheck>0) then
				return
			end
		player:spawn(76,player.x,player.y,1)
	end
		
	



	end
}