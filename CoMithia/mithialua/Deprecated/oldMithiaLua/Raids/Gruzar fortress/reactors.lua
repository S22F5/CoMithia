hid20006214 = {
	click=async(function(player,npc)
		player:dialogSeq({"Warning, by clicking Next you will move back to Endless Torture, but you will be prevented from accessing this room for a minimum of three minutes."},1)
		player.registry["gruzarout"]=os.time()+(60*3)
		player:warp(20005,7,7)
	end)
}

hid20006314 = {
	click=async(function(player,npc)
		player:dialogSeq({"Warning, by clicking Next you will move back to Endless Torture, but you will be prevented from accessing this room for a minimum of three minutes."},1)
		player.registry["gruzarout"]=os.time()+(60*3)
		player:warp(20005,8,7)
	end)
}
hid2000574 = {
	click=function(player,npc)
		if(os.time()>=player.registry["gruzarout"] and os.time()>=player.registry["lastrez"]+300) then
		local check=player:getObjectsInCell(20006,8,8,BL_MOB)
			if(#check>0) then
				if((check[1].health<check[1].maxHealth or check[1].name=="Gruzar, Lord of Darkness") and os.time()<player.registry["gruzarout"]+(60*10)) then
					player:warp(20005,7,8)
					player:sendMinitext("You can't enter the room while the encounter is in progress")
					return
				end
			end
			player:warp(20006,2,12)
		else
			player:sendMinitext("A Magical Aura prevents you from entering! (["..player.registry["gruzarout"]-os.time().."] seconds remaining)")
			player:warp(20005,7,8)
		end
	end

}
hid2000584 = {
	click=function(player,npc)
		if(os.time()>=player.registry["gruzarout"] and os.time()>=player.registry["lastrez"]+300) then
		local check=player:getObjectsInCell(20006,8,8,BL_MOB)
			if(#check>0) then
				if((check[1].health<check[1].maxHealth or check[1].name=="Gruzar, Lord of Darkness") and os.time()<player.registry["gruzarout"]+(60*10)) then
					player:warp(20005,8,8)
					player:sendMinitext("You can't enter the room while the encounter is in progress")
					return
				end
			end
			player:warp(20006,2,12)
		else
			player:sendMinitext("A Magical Aura prevents you from entering! (["..player.registry["gruzarout"]-os.time().."] seconds remaining)")
			player:warp(20005,8,8)
		end
	end



}
hid2000594 = {
	click=function(player,npc)
		if(os.time()>=player.registry["gruzarout"] and os.time()>=player.registry["lastrez"]+300) then
		local check=player:getObjectsInCell(20006,8,8,BL_MOB)
			if(#check>0) then
				if((check[1].health<check[1].maxHealth or check[1].name=="Gruzar, Lord of Darkness") and os.time()<player.registry["gruzarout"]+(60*10)) then
					player:warp(20005,9,8)
					player:sendMinitext("You can't enter the room while the encounter is in progress")
					return
				end
			end
			player:warp(20006,3,12)
		else
			player:sendMinitext("A Magical Aura prevents you from entering! (["..player.registry["gruzarout"]-os.time().."] seconds remaining)")
			player:warp(20005,9,8)
		end
	end



}
hid20000140 = {
	click=function(player,npc)
	local avacheck=0
	local sweep={}
	for x=0,20 do
		for y=0,20 do
			sweep=player:getObjectsInCell(20001,x,y,BL_MOB)
			if(#sweep>0) then
				for z=1,#sweep do
					if(string.lower(sweep[z].name)=="avatar of pain") then
						avacheck=avacheck+1
					end
				end
			end
		end
	end
	for x=0,20 do
		for y=0,20 do
			sweep=player:getObjectsInCell(20002,x,y,BL_MOB)
			if(#sweep>0) then
				for z=1,#sweep do
					if(string.lower(sweep[z].name)=="avatar of suffering") then
						avacheck=avacheck+1
					end
				end
			end
		end
	end
	for x=0,20 do
		for y=0,20 do
			sweep=player:getObjectsInCell(20003,x,y,BL_MOB)
			if(#sweep>0) then
				for z=1,#sweep do
					if(string.lower(sweep[z].name)=="avatar of agony") then
						avacheck=avacheck+1
					end
				end
			end
		end
	end
	for x=0,20 do
		for y=0,20 do
			sweep=player:getObjectsInCell(20004,x,y,BL_MOB)
			if(#sweep>0) then
				for z=1,#sweep do
					if(string.lower(sweep[z].name)=="avatar of misery") then
						avacheck=avacheck+1
					end
				end
			end
		end
	end
	if(avacheck>0) then
		player:sendMinitext("This entrance is magically protected by Gruzar's Avatars. You will need to defeat them before moving further in the Fortress")
		if(avacheck==1) then
			player:sendMinitext("The protection of One Avatar is still present.")
		elseif(avacheck==2) then
			player:sendMinitext("The protection of Two Avatars is still present.")
		elseif(avacheck==3) then
			player:sendMinitext("The protection of Three Avatars is still present.")
		elseif(avacheck==4) then
			player:sendMinitext("The protection of the entrance is complete.")
		end
		player:warp(20000,14,6)
		return
	else
		player:warp(20005,7,12)
		player:sendMinitext("Depleted of the Avatars' protection, you make your way through the Fortress.")
	end
	end

}

hid20000150 = {
	click=function(player,npc)
	local avacheck=0
	local sweep={}
	for x=0,20 do
		for y=0,20 do
			sweep=player:getObjectsInCell(20001,x,y,BL_MOB)
			if(#sweep>0) then
				for z=1,#sweep do
					if(string.lower(sweep[z].name)=="avatar of pain") then
						avacheck=avacheck+1
					end
				end
			end
		end
	end
	for x=0,20 do
		for y=0,20 do
			sweep=player:getObjectsInCell(20002,x,y,BL_MOB)
			if(#sweep>0) then
				for z=1,#sweep do
					if(string.lower(sweep[z].name)=="avatar of suffering") then
						avacheck=avacheck+1
					end
				end
			end
		end
	end
	for x=0,20 do
		for y=0,20 do
			sweep=player:getObjectsInCell(20003,x,y,BL_MOB)
			if(#sweep>0) then
				for z=1,#sweep do
					if(string.lower(sweep[z].name)=="avatar of agony") then
						avacheck=avacheck+1
					end
				end
			end
		end
	end
	for x=0,20 do
		for y=0,20 do
			sweep=player:getObjectsInCell(20004,x,y,BL_MOB)
			if(#sweep>0) then
				for z=1,#sweep do
					if(string.lower(sweep[z].name)=="avatar of misery") then
						avacheck=avacheck+1
					end
				end
			end
		end
	end
	if(avacheck>0) then
		player:sendMinitext("This entrance is magically protected by Gruzar's Avatars. You will need to defeat them before moving further in the Fortress")
		if(avacheck==1) then
			player:sendMinitext("The protection of One Avatar is still present.")
		elseif(avacheck==2) then
			player:sendMinitext("The protection of Two Avatars is still present.")
		elseif(avacheck==3) then
			player:sendMinitext("The protection of Three Avatars is still present.")
		elseif(avacheck==4) then
			player:sendMinitext("The protection of the entrance is complete.")
		end
		player:warp(20000,15,6)
		return
	else
		player:warp(20005,9,12)
		player:sendMinitext("Depleted of the Avatars' protection, you make your way through the Fortress.")
	end
	end

}
