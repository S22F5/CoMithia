domination_referee = {
	move = function(mob,target)
		if(mob.mapRegistry["dominationroundstart"]==0) then
			return
		end
		
		local t = os.date('*t')

		if(os.time()>=mob.mapRegistry["shrinetopleftcapture"]+15 and mob.mapRegistry["shrinetopleftcapture"]~=0) then
				if(mob.mapRegistry["shrinetopleftcapturecolor"]==60) then
					mob.mapRegistry["totalblack"]=mob.mapRegistry["totalblack"]+1
				elseif(mob.mapRegistry["shrinetopleftcapturecolor"]==61) then
					mob.mapRegistry["totalwhite"]=mob.mapRegistry["totalwhite"]+1
				elseif(mob.mapRegistry["shrinetopleftcapturecolor"]==63) then
					mob.mapRegistry["totalred"]=mob.mapRegistry["totalred"]+1
				elseif(mob.mapRegistry["shrinetopleftcapturecolor"]==65) then
					mob.mapRegistry["totalblue"]=mob.mapRegistry["totalblue"]+1
				end
		end
		if(os.time()>=mob.mapRegistry["shrinetoprightcapture"]+15 and mob.mapRegistry["shrinetoprightcapture"]~=0) then
				if(mob.mapRegistry["shrinetoprightcapturecolor"]==60) then
					mob.mapRegistry["totalblack"]=mob.mapRegistry["totalblack"]+1
				elseif(mob.mapRegistry["shrinetoprightcapturecolor"]==61) then
					mob.mapRegistry["totalwhite"]=mob.mapRegistry["totalwhite"]+1
				elseif(mob.mapRegistry["shrinetoprightcapturecolor"]==63) then
					mob.mapRegistry["totalred"]=mob.mapRegistry["totalred"]+1
				elseif(mob.mapRegistry["shrinetoprightcapturecolor"]==65) then
					mob.mapRegistry["totalblue"]=mob.mapRegistry["totalblue"]+1
				end
		end
		if(os.time()>=mob.mapRegistry["shrinecentercapture"]+15 and mob.mapRegistry["shrinecentercapture"]~=0) then
				if(mob.mapRegistry["shrinecentercapturecolor"]==60) then
					mob.mapRegistry["totalblack"]=mob.mapRegistry["totalblack"]+1
				elseif(mob.mapRegistry["shrinecentercapturecolor"]==61) then
					mob.mapRegistry["totalwhite"]=mob.mapRegistry["totalwhite"]+1
				elseif(mob.mapRegistry["shrinecentercapturecolor"]==63) then
					mob.mapRegistry["totalred"]=mob.mapRegistry["totalred"]+1
				elseif(mob.mapRegistry["shrinecentercapturecolor"]==65) then
					mob.mapRegistry["totalblue"]=mob.mapRegistry["totalblue"]+1
				end
		end
		if(os.time()>=mob.mapRegistry["shrinebottomleftcapture"]+15 and mob.mapRegistry["shrinebottomleftcapture"]~=0) then
				if(mob.mapRegistry["shrinebottomleftcapturecolor"]==60) then
					mob.mapRegistry["totalblack"]=mob.mapRegistry["totalblack"]+1
				elseif(mob.mapRegistry["shrinebottomleftcapturecolor"]==61) then
					mob.mapRegistry["totalwhite"]=mob.mapRegistry["totalwhite"]+1
				elseif(mob.mapRegistry["shrinebottomleftcapturecolor"]==63) then
					mob.mapRegistry["totalred"]=mob.mapRegistry["totalred"]+1
				elseif(mob.mapRegistry["shrinebottomleftcapturecolor"]==65) then
					mob.mapRegistry["totalblue"]=mob.mapRegistry["totalblue"]+1
				end
		end
		if(os.time()>=mob.mapRegistry["shrinebottomrightcapture"]+15 and mob.mapRegistry["shrinebottomrightcapture"]~=0) then
				if(mob.mapRegistry["shrinebottomrightcapturecolor"]==60) then
					mob.mapRegistry["totalblack"]=mob.mapRegistry["totalblack"]+1
				elseif(mob.mapRegistry["shrinebottomrightcapturecolor"]==61) then
					mob.mapRegistry["totalwhite"]=mob.mapRegistry["totalwhite"]+1
				elseif(mob.mapRegistry["shrinebottomrightcapturecolor"]==63) then
					mob.mapRegistry["totalred"]=mob.mapRegistry["totalred"]+1
				elseif(mob.mapRegistry["shrinebottomrightcapturecolor"]==65) then
					mob.mapRegistry["totalblue"]=mob.mapRegistry["totalblue"]+1
				end
		end

		if((t.sec==0 or t.sec==30) and mob.mapRegistry["scorebroadcast"]==0) then
				mob.mapRegistry["scorebroadcast"]=1
				target:broadcast(mob.m,"-Current Score Display = Black : "..mob.mapRegistry["totalblack"]..", White : "..mob.mapRegistry["totalwhite"]..", Red : "..mob.mapRegistry["totalred"]..", Blue: "..mob.mapRegistry["totalblue"]..".")
		end
		if(t.sec~=0 and t.sec~=30 and mob.mapRegistry["scorebroadcast"]==1) then
				mob.mapRegistry["scorebroadcast"]=0
		end


		if(mob.mapRegistry["totalblack"]>=2000 or mob.mapRegistry["totalred"]>=2000 or mob.mapRegistry["totalwhite"]>=2000 or mob.mapRegistry["totalblue"]>=2000) then
				target:broadcast(mob.m,"-A team has reached 2000 points ! Round ends.")			
				target:broadcast(mob.m,"-Final Score Display = Black : "..mob.mapRegistry["totalblack"]..", White : "..mob.mapRegistry["totalwhite"]..", Red : "..mob.mapRegistry["totalred"]..", Blue: "..mob.mapRegistry["totalblue"]..".")
				if(mob.mapRegistry["totalblack"]>=2000) then
					target:broadcast(mob.m,"-The Black team wins the round!")
				end
				if(mob.mapRegistry["totalwhite"]>=2000) then
					target:broadcast(mob.m,"-The White team wins the round!")
				end
				if(mob.mapRegistry["totalred"]>=2000) then
					target:broadcast(mob.m,"-The Red team wins the round!")
				end
				if(mob.mapRegistry["totalblue"]>=2000) then
					target:broadcast(mob.m,"-The Blue team wins the round!")
				end
				mob.mapRegistry["dominationroundstart"]=0
		end







 
						
	end
	
}
