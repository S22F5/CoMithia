pinwheelshrinetopleft = {
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

		if(player.mapRegistry["dominationroundstart"]==0) then
			player:sendMinitext("The round hasn't started yet!")
			return
		end

		if(os.time()<player.mapRegistry["shrinetopleftcapture"]) then
			player:sendMinitext("You can only capture a Shrine every 5 seconds.")
			return
		end
		if(player.mapRegistry["shrinetopleftcapturecolor"]==player.armorColor) then
			player:sendMinitext("This Shrine already belongs to your team")
			return
		end

		player.mapRegistry["shrinetopleftcapture"]=os.time()+5
		player.mapRegistry["shrinetopleftcapturecolor"]=player.armorColor
		player:sendMinitext("Your team captures the shrine!")		

	end
}

pinwheelshrinetopright = {
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

		if(player.mapRegistry["dominationroundstart"]==0) then
			player:sendMinitext("The round hasn't started yet!")
			return
		end

		if(os.time()<player.mapRegistry["shrinetoprightcapture"]) then
			player:sendMinitext("You can only capture a Shrine every 5 seconds.")
			return
		end
		if(player.mapRegistry["shrinetoprightcapturecolor"]==player.armorColor) then
			player:sendMinitext("This Shrine already belongs to your team")
			return
		end

		player.mapRegistry["shrinetoprightcapture"]=os.time()+5
		player.mapRegistry["shrinetoprightcapturecolor"]=player.armorColor
		player:sendMinitext("Your team captures the shrine!")		

	end
}

pinwheelshrinecenter = {
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

		if(player.mapRegistry["dominationroundstart"]==0) then
			player:sendMinitext("The round hasn't started yet!")
			return
		end

		if(os.time()<player.mapRegistry["shrinecentercapture"]) then
			player:sendMinitext("You can only capture a Shrine every 5 seconds.")
			return
		end
		if(player.mapRegistry["shrinecentercapturecolor"]==player.armorColor) then
			player:sendMinitext("This Shrine already belongs to your team")
			return
		end

		player.mapRegistry["shrinecentercapture"]=os.time()+5
		player.mapRegistry["shrinecentercapturecolor"]=player.armorColor
		player:sendMinitext("Your team captures the shrine!")		

	end
}
pinwheelshrinebottomleft = {
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

		if(player.mapRegistry["dominationroundstart"]==0) then
			player:sendMinitext("The round hasn't started yet!")
			return
		end

		if(os.time()<player.mapRegistry["shrinebottomleftcapture"]) then
			player:sendMinitext("You can only capture a Shrine every 5 seconds.")
			return
		end
		if(player.mapRegistry["shrinebottomleftcapturecolor"]==player.armorColor) then
			player:sendMinitext("This Shrine already belongs to your team")
			return
		end

		player.mapRegistry["shrinebottomleftcapture"]=os.time()+5
		player.mapRegistry["shrinebottomleftcapturecolor"]=player.armorColor
		player:sendMinitext("Your team captures the shrine!")		

	end
}
pinwheelshrinebottomright = {
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

		if(player.mapRegistry["dominationroundstart"]==0) then
			player:sendMinitext("The round hasn't started yet!")
			return
		end

		if(os.time()<player.mapRegistry["shrinebottomrightcapture"]) then
			player:sendMinitext("You can only capture a Shrine every 5 seconds.")
			return
		end
		if(player.mapRegistry["shrinebottomrightcapturecolor"]==player.armorColor) then
			player:sendMinitext("This Shrine already belongs to your team")
			return
		end

		player.mapRegistry["shrinebottomrightcapture"]=os.time()+5
		player.mapRegistry["shrinebottomrightcapturecolor"]=player.armorColor
		player:sendMinitext("Your team captures the shrine!")		

	end
}