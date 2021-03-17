fisherman = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(68,"monster"),color=23}
                local m
                local n
                local opts = { }
                table.insert(opts,"Yes")
                table.insert(opts,"No")
                player.npcGraphic=t.graphic
		player.npcColor=t.color


			if(player.level>=12 and player.registry["fishingquest"]==0) then
				player:dialogSeq({t,"Hi! I've seen you've watched me fish around here... Would you like to learn how to catch fish like I do ?",t,"I'll teach you if you do me a little favor.",t,"I haven't eaten in some time and I'm starting to get hungry, could you go grab me a plate of food? I can't risk going myself and possibly missng a life's catch!"},1)
				if(player:hasItem("food_plate",1) == true) then
						player:removeItem("food_plate",1)
						player.registry["fishingquest"]=1
						player:dialogSeq({t,"Well thank you! Delicious! Alright, as promised I'll teach you how to fish... But the first thing you're going to need is a fishing pole.",t,"I'll make one for you if you bring some boards to carve it, some fabric for the line and some metal to weight it."},1)
				end
			elseif(player.level>=12 and player.registry["fishingquest"]==1) then
				if(player:hasItem("ash_board",20) == true and player:hasItem("wool_fabric",8) == true and player:hasItem("tin_bar",2) == true and player:hasSpace("fishing_pole",1)) then
						player.registry["fishingquest"]=2
						player:removeItem("tin_bar",2)
						player:removeItem("ash_board",20)
						player:removeItem("wool_fabric",8)
						player:addItem("fishing_pole",1)
						player:addSpell("fishing")
						player:addLegend("Learned the art of fishing (Year " .. player:curYear() .. ", " .. player:getCurSeason() .. ")","fishingquest",11,128)
						player:giveXP(2000)
						player:dialogSeq({t,"Ah! you brought back everything... Here you go... a nice fishing pole!",t,"-The fisherman spends time with you to teach you the basic fish techniques-\n\nYou're ready now, good luck for your catchs!"})
				else
					player:dialogSeq({t,"I need material to make your fishing pole, ash boards for the pole, wool fabric for the line and tin metal to weight it, bring that back to me."})
				end
			elseif(player.level>=12 and player.registry["fishingquest"]>=2) then
						player:dialogSeq({t,"Howdy! Catch many fishes lately?"})
			end


         end)
}