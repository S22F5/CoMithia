Broseph2010 = {
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

Santa2010 = {

	click =async(function(player,npc)
		if(player.registry["xmas2010step"]==0) then
			player.registry["xmas2010step"]=1
		end
		local t={graphic=convertGraphic(191,"monster"),color=0}

       	player.npcGraphic=t.graphic
		player.npcColor=t.color

				
		if(player.registry["xmas2010step"]==1) then
			player:dialogSeq({t,"Help! Help!\n\nI've trapped an Evil Spirit in a Dream World, but he has found a way to send his minions in Mithia to ruin Christmas!","You'll need to slay them and bring me at least ten fragment of their souls and a Tourmaline.","Should you bring me the required items, I will be able fuse the souls to Tourmaline and this will let you enter the Dream World. I simply hope you'll be able to defeat this atrocity once and for all!"},1)
			if(player:hasItem("xmas2010_soulfragment",10) == true and player:hasItem("tourmaline",1) == true) then
				if(player:hasSpace("dreamland_portal",1)) then
					player.registry["xmas2010step"]=2
					player:removeItem("xmas2010_soulfragment",10)
					player:removeItem("tourmaline",1)
					player:addItem("dreamland_portal",1)
					player:dialogSeq({t,"Here you go, I've handed you the Portal. Be very careful, no one knows what's going on in there, I suggest you to bring friends for safety"})
				else
					player:dialogSeq({t,"Please free at least one space in your inventory"})
				end
			else
				player:dialogSeq({t,"Come back once you have found the fragments and the tourmaline! Be fast, for we must save Christmas!"})
			end		
		elseif(player.registry["xmas2010step"]==2 and player.registry["gredinchkill"]<2) then
			player:dialogSeq({t,"Now that you have the Dreamland Portal, you need to get rid of the evil within. Come back to me once you've managed to vanquish it and you'll get a present!"})
		elseif(player.registry["xmas2010step"]==2 and player.registry["gredinchkill"]==2) then
			player.registry["gredinchkill"]=1 -- 1 = no kill
			player:talk(0,""..player.registry["gredinchkill"])
			player.registry["xmas2010step"]=3
			player:addLegend("Saved Christmas from Gredinch","xmas2010",138,68)			
			player:addItem("christmas_present",1)
			player:dialogSeq({t,"You did it! I was starting to get worried. Take this present as a reward and Merry Christmas!\n\nHo Ho Ho."})
			player:sendStatus()		
		elseif(player.registry["xmas2010step"]==3 and player.registry["gredinchkill"]==2) then			
			player.registry["gredinchkill"]=1 -- 1 = no kill
			player:talk(0,""..player.registry["gredinchkill"])
			player:addItem("christmas_present",1)			
			player:dialogSeq({t,"Ho ho ho, I see you're a real daredevil. There you go, you deserve another present\n\nHo Ho Ho."})
			player:sendStatus()
		end
		
		
		
		
	end)
}