Broseph = {
	click =function(player,npc)
		if(player.mapRegistry["brosephsay"]+5<=os.time()) then
			npc:talk(0,"Broseph: Ho ho ho!")
			player.mapRegistry["brosephsay"]=os.time()
		end
	end,

	say=async(function(player,npc)
	local t={graphic=convertGraphic(881,"monster"),color=0}

        player.npcGraphic=t.graphic
	player.npcColor=t.color

	local s=player.speech

	if(string.find(string.lower(s),"ho ho ho")~=nil) then
		player:dialogSeq({t,"That's what Santa says!"})
	end
	if(string.find(string.lower(s),"santa")~=nil) then
		player:dialogSeq({t,"Ho ho ho, Do you wish to visit Santa?!"},1)
		local choice=player:menuString2("Do you wish to travel to the north pole?",{"Yes","No"})
		if(choice=="Yes") then
			player:sendMinitext("You travel to the north pole!")
			player:warp(11001,8,23)
		else
			player:dialogSeq({t,"As you wish, another time maybe!"})
		end
	end
	end)
}

Santa = {

	click =async(function(player,npc)
		if(player.registry["xmas2008step"]==0) then
			player.registry["xmas2008step"]=1
		end
		local t={graphic=convertGraphic(191,"monster"),color=0}

       		player.npcGraphic=t.graphic
		player.npcColor=t.color

		player:dialogSeq({t,"The evil critters have stolen the spirit of christmas! Help me get it back and I'll give you a present!"},1)
		if(player:hasItem("christmas_spirit",10) == true) then
			if(player.registry["xmas2008legend"]>=0) then
				player:addLegend("Helped Santa retrieve the spirit of Christmas","xmas2008",138,68)
				player.registry["xmas2008legend"]=1
			end
			player:removeItem("christmas_spirit",10)
			player:addItem("christmas_present",1)
			player:dialogSeq({t,"Thanks a bunch! Take this present as a reward! Happy Christmas!"})
		else
			player:dialogSeq({t,"Come back once you have found the spirit! Be fast, for we must save Christmas!"})
		end	
	end)
}