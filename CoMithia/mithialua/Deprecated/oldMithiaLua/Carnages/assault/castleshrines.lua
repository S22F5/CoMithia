assaultfirstshrine = {
	click=function(player,npc)
		local distx=math.abs(player.x-npc.x)
		local disty=math.abs(player.y-npc.y)
		local dist=distx+disty

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(dist>1) then
			player:sendMinitext("You are to far to capture this Shrine")
			return
		end

		if(player.mapRegistry["assaultroundstart"]==0) then
			player:sendMinitext("The round hasn't started yet!")
			return
		end

		if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
			if(player.mapRegistry["firstshrineunderattack"]==1) then
				player.mapRegistry["firstshrineunderattack"]=0
				player.mapRegistry["firstshrineattacktime"]=0
				player:broadcast(player.m,"-"..player.name.." stops the attack on the First Shrine!")
				return
			else
				if(player.mapRegistry["firstshrinecaptured"]==0) then
					player:sendMinitext("This Shrine is not under attack!")
					return
				else
					player:sendMinitext("This Shrine has already been captured, it is too late.")
					return
				end
			end
		end

		if(player.armorColor==player.mapRegistry["attackteamcolor"]) then

			if(player.mapRegistry["firstshrinecaptured"]==1) then
				player:sendMinitext("This Shrine has already been captured!")
				return
			end
			if(player.mapRegistry["firstshrineunderattack"]==1 and os.time()<=player.mapRegistry["firstshrineattacktime"]) then
				player:sendMinitext("This Shrine is already under attack!")
				player:sendMinitext(""..player.mapRegistry["firstshrineattacktime"]-os.time().." seconds remaining.")
				return
			end
			if(player.mapRegistry["firstshrineattacktime"]==0) then
				player.mapRegistry["firstshrineattacktime"]=os.time()+30
				player.mapRegistry["firstshrineunderattack"]=1
				player:broadcast(player.m,"-"..player.name.." launches an attack on the First Shrine ; 30 seconds remaining to intervene!")
				return
			end

			if(os.time()>player.mapRegistry["firstshrineattacktime"] and player.mapRegistry["firstshrineattacktime"]~=0) then
				player.mapRegistry["firstshrineattacktime"]=0
				player.mapRegistry["firstshrineunderattack"]=0
				player.mapRegistry["firstshrinecaptured"]=1
				player:broadcast(player.m,"The First Shrine has been captured!")
				return
			end

		end
	
		

	end
}
















assaultsecondshrine = {
	click=function(player,npc)
		local distx=math.abs(player.x-npc.x)
		local disty=math.abs(player.y-npc.y)
		local dist=distx+disty

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(dist>1) then
			player:sendMinitext("You are to far to capture this Shrine")
			return
		end

		if(player.mapRegistry["assaultroundstart"]==0) then
			player:sendMinitext("The round hasn't started yet!")
			return
		end

		if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
			if(player.mapRegistry["secondshrineunderattack"]==1) then
				player.mapRegistry["secondshrineunderattack"]=0
				player.mapRegistry["secondshrineattacktime"]=0
				player:broadcast(player.m,"-"..player.name.." stops the attack on the Second Shrine!")
				return
			else
				if(player.mapRegistry["secondshrinecaptured"]==0) then
					player:sendMinitext("This Shrine is not under attack!")
					return
				else
					player:sendMinitext("This Shrine has already been captured, it is too late.")
					return
				end
			end
		end

		if(player.armorColor==player.mapRegistry["attackteamcolor"]) then
			if(player.mapRegistry["firstshrinecaptured"]==0) then
				player:sendMinitext("The First Shrine has not been captured yet, this attack is premature!")
				return
			end
			if(player.mapRegistry["secondshrinecaptured"]==1) then
				player:sendMinitext("This Shrine has already been captured!")
				return
			end
			if(player.mapRegistry["secondshrineunderattack"]==1 and os.time()<=player.mapRegistry["secondshrineattacktime"]) then
				player:sendMinitext("This Shrine is already under attack!")
				player:sendMinitext(""..player.mapRegistry["secondshrineattacktime"]-os.time().." seconds remaining.")
				return
			end
			if(player.mapRegistry["secondshrineattacktime"]==0) then
				player.mapRegistry["secondshrineattacktime"]=os.time()+30
				player.mapRegistry["secondshrineunderattack"]=1
				player:broadcast(player.m,"-"..player.name.." launches an attack on the Second Shrine ; 30 seconds remaining to intervene!")
				return
			end
			if(os.time()>player.mapRegistry["secondshrineattacktime"] and player.mapRegistry["secondshrineattacktime"]~=0) then
				player.mapRegistry["secondshrineattacktime"]=0
				player.mapRegistry["secondshrineunderattack"]=0
				player.mapRegistry["secondshrinecaptured"]=1
				player:broadcast(player.m,"The Second Shrine has been captured!")
				return
			end

		end
	
		

	end
}








assaultthirdshrine = {
	click=function(player,npc)
		local distx=math.abs(player.x-npc.x)
		local disty=math.abs(player.y-npc.y)
		local dist=distx+disty

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(dist>1) then
			player:sendMinitext("You are to far to capture this Shrine")
			return
		end

		if(player.mapRegistry["assaultroundstart"]==0) then
			player:sendMinitext("The round hasn't started yet!")
			return
		end

		if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
			if(player.mapRegistry["thirdshrineunderattack"]==1) then
				player.mapRegistry["thirdshrineunderattack"]=0
				player.mapRegistry["thirdshrineattacktime"]=0
				player:broadcast(player.m,"-"..player.name.." stops the attack on the Third Shrine!")
				return
			else
				if(player.mapRegistry["thirdshrinecaptured"]==0) then
					player:sendMinitext("This Shrine is not under attack!")
					return
				else
					player:sendMinitext("This Shrine has already been captured, it is too late.")
					return
				end
			end
		end

		if(player.armorColor==player.mapRegistry["attackteamcolor"]) then
			if(player.mapRegistry["secondshrinecaptured"]==0) then
				player:sendMinitext("The Second Shrine has not been captured yet, this attack is premature!")
				return
			end
			if(player.mapRegistry["thirdshrinecaptured"]==1) then
				player:sendMinitext("This Shrine has already been captured!")
				return
			end
			if(player.mapRegistry["thirdshrineunderattack"]==1 and os.time()<=player.mapRegistry["thirdshrineattacktime"]) then
				player:sendMinitext("This Shrine is already under attack!")
				player:sendMinitext(""..player.mapRegistry["thirdshrineattacktime"]-os.time().." seconds remaining.")
				return
			end
			if(player.mapRegistry["thirdshrineattacktime"]==0) then
				player.mapRegistry["thirdshrineattacktime"]=os.time()+30
				player.mapRegistry["thirdshrineunderattack"]=1
				player:broadcast(player.m,"-"..player.name.." launches an attack on the Third Shrine ; 30 seconds remaining to intervene!")
				return
			end
			if(os.time()>player.mapRegistry["thirdshrineattacktime"] and player.mapRegistry["thirdshrineattacktime"]~=0) then
				player.mapRegistry["thirdshrineattacktime"]=0
				player.mapRegistry["thirdshrineunderattack"]=0
				player.mapRegistry["thirdshrinecaptured"]=1
				player:broadcast(player.m,"The Third Shrine has been captured!")
				return
			end

		end
	
		

	end
}




assaultfourthshrine = {
	click=function(player,npc)
		local distx=math.abs(player.x-npc.x)
		local disty=math.abs(player.y-npc.y)
		local dist=distx+disty

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(dist>1) then
			player:sendMinitext("You are to far to capture this Shrine")
			return
		end

		if(player.mapRegistry["assaultroundstart"]==0) then
			player:sendMinitext("The round hasn't started yet!")
			return
		end

		if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
			if(player.mapRegistry["fourthshrineunderattack"]==1) then
				player.mapRegistry["fourthshrineunderattack"]=0
				player.mapRegistry["fourthshrineattacktime"]=0
				player:broadcast(player.m,"-"..player.name.." stops the attack on the Fourth Shrine!")
				return
			else
				if(player.mapRegistry["fourthshrinecaptured"]==0) then
					player:sendMinitext("This Shrine is not under attack!")
					return
				else
					player:sendMinitext("This Shrine has already been captured, it is too late.")
					return
				end
			end
		end

		if(player.armorColor==player.mapRegistry["attackteamcolor"]) then
			if(player.mapRegistry["thirdshrinecaptured"]==0) then
				player:sendMinitext("The Third Shrine has not been captured yet, this attack is premature!")
				return
			end
			if(player.mapRegistry["fourthshrinecaptured"]==1) then
				player:sendMinitext("This Shrine has already been captured!")
				return
			end
			if(player.mapRegistry["fourthshrineunderattack"]==1 and os.time()<=player.mapRegistry["fourthshrineattacktime"]) then
				player:sendMinitext("This Shrine is already under attack!")
				player:sendMinitext(""..player.mapRegistry["fourthshrineattacktime"]-os.time().." seconds remaining.")
				return
			end
			if(player.mapRegistry["fourthshrineattacktime"]==0) then
				player.mapRegistry["fourthshrineattacktime"]=os.time()+30
				player.mapRegistry["fourthshrineunderattack"]=1
				player:broadcast(player.m,"-"..player.name.." launches an attack on the Fourth Shrine ; 30 seconds remaining to intervene!")
				return
			end
			if(os.time()>player.mapRegistry["fourthshrineattacktime"] and player.mapRegistry["fourthshrineattacktime"]~=0) then
				player.mapRegistry["fourthshrineattacktime"]=0
				player.mapRegistry["fourthshrineunderattack"]=0
				player.mapRegistry["fourthshrinecaptured"]=1
				player:broadcast(player.m,"The Fourth Shrine has been captured!")
				local time=os.time()-player.mapRegistry["assaultroundstart"]
				local timemin=math.floor(time/60)
				local timesec=time-(timemin*60)
				player:broadcast(player.m,"The Assault round is over! The Offense team performed their attack in "..timemin.." minutes and "..timesec.." seconds.")
				player.mapRegistry["assaultroundstart"]=0
				return
			end

		end
	
		

	end
}