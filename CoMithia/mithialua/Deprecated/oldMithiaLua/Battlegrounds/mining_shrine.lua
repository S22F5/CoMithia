mining_shrine = {
	click = function(player,npc)

		local x=math.abs(player.x-npc.x)
		local y=math.abs(player.y-npc.y)
		local t = os.date('*t')

		if(t.hour==1 or t.hour==2 or t.hour==4 or t.hour==5 or t.hour==7 or t.hour==8 or t.hour==10 or t.hour==11 or t.hour==13 or t.hour==14 or t.hour==16 or t.hour==17 or t.hour==19 or t.hour==20 or t.hour==22 or t.hour==23) then
			player:sendMinitext("Shrines can only be captured during 15 minutes every 3 hours")
			return
		end
		if(t.min>15) then
			player:sendMinitext("Shrines can only be captured during 15 minutes every 3 hours")
			return
		end
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if((x+y)>1) then
			player:sendMinitext("You are too far to activate the Shrine.")
			return
		end
		if(t.hour==0 and player.mapRegistry["miningshrinecomplete"]==24) then
			player.mapRegistry["miningshrinecomplete"]=0
		end
		if(player.mapRegistry["miningshrinecomplete"]>t.hour and player.mapRegistry["miningshrinecompday"]==t.day) then
			player:sendMinitext("The Shrine has already been captured")
			return
		end

		if(os.time()>player.mapRegistry["miningshrinelastgrabtime"]+60*20 and player.mapRegistry["miningshrinedefenseclan"]==player.clan) then
				player.mapRegistry["miningshrinelastgrab"]=9999
		end

		player.paralyzed=true
		player:setDuration("mining_shrine_capture",18000)
		player.registry["miningshrinestart"]=os.time()
		


		
        end

}

hid32013534 = {
	click=function(player,npc)
		local t = os.date('*t')


		if(player.mapRegistry["miningshrinedefenseclan"]==player.clan and player.mapRegistry["miningshrinecomplete"]>t.hour and player.mapRegistry["miningshrinecompday"]==t.day) then
			player:warp(3201,31,30)
		else
			player:sendMinitext("The Shrine does not currently belong to your clan!")
			player:warp(3201,36,35)
		end
	end

}

mining_shrine_capture = {
		cast = function(player,target)

		end,
		while_cast=function(player)
			player.paralyzed=true
			player:sendAnimation(133)
		end,
		uncast = function(player)
			local t = os.date('*t')
			player.paralyzed=false
			if(player.m~=3201) then
				player:sendMinitext("You left the Battlefield before the Capture was complete.")
				return
			end
			if(player.mapRegistry["miningshrinecomplete"]>t.hour and player.mapRegistry["miningshrinecompday"]==t.day) then
				player:sendMinitext("The Shrine has already been captured")
				return
			end
			if(os.time()>=player.registry["miningshrinestart"]+15) then
					if(player.mapRegistry["miningshrinelastgrab"]~=player.clan) then
						if(os.time()>=player.mapRegistry["miningshrineaether"]+20) then
							player.mapRegistry["miningshrinespeech"]=0
							player.mapRegistry["miningshrineaether"]=os.time()
							player.mapRegistry["miningshrinedefensestart"]=os.time()
							player.mapRegistry["miningshrinetrigger"]=0
							player.mapRegistry["miningshrinelastgrabtime"]=os.time()
							player.mapRegistry["miningshrinelastgrab"]=player.clan
							player.mapRegistry["miningshrinelegend"]=player.ID
							player.mapRegistry["miningshrinedefenseclan"]=player.clan
							local clan="[Neutrals]"
							if(player.mapRegistry["miningshrinedefenseclan"]==0) then
								clan="[Neutrals]"
							elseif(player.mapRegistry["miningshrinedefenseclan"]==1) then
								clan="[Immortals]"
							elseif(player.mapRegistry["miningshrinedefenseclan"]==2) then
								clan="[Testers]"
							elseif(player.mapRegistry["miningshrinedefenseclan"]==3) then
								clan="[Alpha-Testers]"
							elseif(player.mapRegistry["miningshrinedefenseclan"]==4) then
								clan="[Heroes of Aesir]"
							elseif(player.mapRegistry["miningshrinedefenseclan"]==5) then
								clan="[Patriot]"
							elseif(player.mapRegistry["miningshrinedefenseclan"]==6) then
								clan="[Avalanche]"
							end
							player:broadcast(player.m,"-"..player.name.." of "..clan.." has captured the Mining Shrine. It must be defended for 3 minutes.")
							return
						else
							player:sendMinitext("The Shrine can only be attacked every 20 seconds")
							return
						end
					else
							player:sendMinitext("Your clan is already defending this Shrine!")
							return
					end
			else
				player:sendMinitext("You were interrupted during the capture!")
				return
			end

		end
				
}
mining_ghost = {
	move = function(mob,target)
	
		local e= {}
		local f= {}
		local g= {}
		local h= {}
		e=target:getObjectsInCell(mob.m,mob.x+1,mob.y,BL_PC)
		f=target:getObjectsInCell(mob.m,mob.x,mob.y-1,BL_PC)
		g=target:getObjectsInCell(mob.m,mob.x-1,mob.y,BL_PC)
		h=target:getObjectsInCell(mob.m,mob.x,mob.y+1,BL_PC)

		if(#e>0) then
			for a=1,#e do
				if(e[a].state==1) then
					e[a]:warp(mob.m,mob.x+5,mob.y)
				end
			end
		end
		if(#f>0) then
			for a=1,#f do
				if(f[a].state==1) then
					f[a]:warp(mob.m,mob.x,mob.y-5)
				end
			end
		end
		if(#g>0) then
			for a=1,#g do
				if(g[a].state==1) then
					g[a]:warp(mob.m,mob.x-5,mob.y)
				end
			end
		end
		if(#h>0) then
			for a=1,#h do
				if(h[a].state==1) then
					h[a]:warp(mob.m,mob.x,mob.y+5)
				end
			end
		end



		local clan="[Neutrals]"
		if(mob.mapRegistry["miningshrinedefenseclan"]==0) then
			clan="[Neutrals]"
		elseif(mob.mapRegistry["miningshrinedefenseclan"]==1) then
			clan="[Immortals]"
		elseif(mob.mapRegistry["miningshrinedefenseclan"]==2) then
			clan="[Testers]"
		elseif(mob.mapRegistry["miningshrinedefenseclan"]==3) then
			clan="[Alpha-Testers]"
		elseif(mob.mapRegistry["miningshrinedefenseclan"]==4) then
			clan="[Heroes of Aesir]"
		elseif(mob.mapRegistry["miningshrinedefenseclan"]==5) then
			clan="[Patriot]"
		elseif(mob.mapRegistry["miningshrinedefenseclan"]==6) then
			clan="[Avalanche]"
		end
		
		local t = os.date('*t')
		if(os.time()>=mob.mapRegistry["miningshrinedefensestart"]+30 and mob.mapRegistry["miningshrinespeech"]==0) then
				mob:talk(0,"30 Seconds have passed")
				mob.mapRegistry["miningshrinespeech"]=1
		end
		if(os.time()>=mob.mapRegistry["miningshrinedefensestart"]+60 and mob.mapRegistry["miningshrinespeech"]==1) then
				mob:talk(0,"1 minute has passed")
				mob.mapRegistry["miningshrinespeech"]=2
		end
		if(os.time()>=mob.mapRegistry["miningshrinedefensestart"]+90 and mob.mapRegistry["miningshrinespeech"]==2) then
				mob:talk(0,"1 minute and 30 seconds have passed")
				mob.mapRegistry["miningshrinespeech"]=3
		end
		if(os.time()>=mob.mapRegistry["miningshrinedefensestart"]+120 and mob.mapRegistry["miningshrinespeech"]==3) then
				mob:talk(0,"2 minute have passed")
				mob.mapRegistry["miningshrinespeech"]=4
		end
		if(os.time()>=mob.mapRegistry["miningshrinedefensestart"]+150 and mob.mapRegistry["miningshrinespeech"]==4) then
				mob:talk(0,"2 minute and 30 seconds have passed")
				mob.mapRegistry["miningshrinespeech"]=5
		end
		if(os.time()>=mob.mapRegistry["miningshrinedefensestart"]+180 and mob.mapRegistry["miningshrinespeech"]==5) then
				mob:talk(0,"3 minutes have passed")
				mob.mapRegistry["miningshrinespeech"]=6
		end	
		if(mob.mapRegistry["miningshrinetrigger"]==0 and mob.mapRegistry["miningshrinespeech"]==6 and os.time()>=(mob.mapRegistry["miningshrinedefensestart"]+(180)) and os.time()<=(mob.mapRegistry["miningshrinedefensestart"]+(200)) and mob.mapRegistry["miningshrinedefensestart"]~=0) then
			mob.mapRegistry["miningshrinetrigger"]=1
			target:broadcast(-1,"-The Mining Shrine has been captured by "..clan..".")

			if(t.hour==0 or t.hour==1 or t.hour==2) then
				mob.mapRegistry["miningshrinecomplete"]=3
			elseif(t.hour==3 or t.hour==4 or t.hour==5) then
				mob.mapRegistry["miningshrinecomplete"]=6
			elseif(t.hour==6 or t.hour==7 or t.hour==8) then
				mob.mapRegistry["miningshrinecomplete"]=9
			elseif(t.hour==9 or t.hour==10 or t.hour==11) then
				mob.mapRegistry["miningshrinecomplete"]=12
			elseif(t.hour==12 or t.hour==13 or t.hour==14) then
				mob.mapRegistry["miningshrinecomplete"]=15
			elseif(t.hour==15 or t.hour==16 or t.hour==17) then
				mob.mapRegistry["miningshrinecomplete"]=18
			elseif(t.hour==18 or t.hour==19 or t.hour==20) then
				mob.mapRegistry["miningshrinecomplete"]=21
			elseif(t.hour==21 or t.hour==22 or t.hour==23) then
				mob.mapRegistry["miningshrinecomplete"]=24
			end
			mob.mapRegistry["miningshrinecompday"]=t.day

			Player(mob.mapRegistry["miningshrinelegend"]).registry["battlefieldcapturedshrines"]=Player(mob.mapRegistry["miningshrinelegend"]).registry["battlefieldcapturedshrines"]+1
			local count=Player(mob.mapRegistry["miningshrinelegend"]).registry["battlefieldcapturedshrines"]
			Player(mob.mapRegistry["miningshrinelegend"]):removeLegendbyName("capturedshrines")
			Player(mob.mapRegistry["miningshrinelegend"]):addLegend("Captured "..count.." shrines on the Battlefield","capturedshrines",7,16)
				
		end
			
		
	end
}