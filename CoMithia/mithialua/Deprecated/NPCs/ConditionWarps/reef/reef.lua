hid455052 = {
	click=function(player)
		if(player.level>=96) then
			player:warp(4101,4,28)
		else 
                        player:warp(45,50,53)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid455152 = {
	click=function(player)
		if(player.level>=96) then
			player:warp(4101,5,28)
		else 
                        player:warp(45,51,53)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid410898 = {
	click=async(function(player,npc)
		local t={graphic=convertGraphic(1018,"item"),color=30}
	        local opts = { }
		player.npcGraphic=t.graphic
		player.npcColor=t.color
		player:dialogSeq({t,"You will need 10 Reef beads to pass. Once on the other side, you will be able to summon your party.",t,"Pressing next will sacrifice your beads and teleport you, proceed only if you wish to be teleported."},1)
			if(player:hasItem("reef_bead",10)==true) then
				player:warp(4108,10,3)
				player:removeItem("reef_bead",10)
			else
				player:warp(4108,9,9)
				player:dialogSeq({t,"You do not have enough beads."})
			end
	end)
}

hid410893 = {
	click=async(function(player,npc)
		local t={graphic=convertGraphic(1018,"item"),color=30}
	        local opts = { }
		table.insert(opts,"Summon someone")
		table.insert(opts,"Move back to the other side")

		player.npcGraphic=t.graphic
		player.npcColor=t.color
		player:dialogSeq({t,"From here, you can summon someone on this side or decide to go back. Be careful however as you will need another set of 10 beads to come back here."},1)
			local menuOption=player:menuString2("What do you wish to do?",opts)
				if(menuOption=="Summon someone") then
					local summon=player:input("Who do you wish to summon? (the player must be online and on this map)")
					if string.lower(summon)==string.lower(player.name) then
						player:dialogSeq({t,"You may not summon yourself."})
						return
					end
					if(Player(summon).m==4108) then
						Player(summon):warp(4108,10,3)
						Player(summon):sendMinitext(""..player.name.." summons you on the other side")
						player:sendMinitext("If online and on this map, "..summon.." has been summoned.")
					end
				elseif(menuOption=="Move back to the other side") then
					player:dialogSeq({t,"Are you sure you wish to move back to the other side?"},1)
					player:warp(4108,9,9)
				end
	end)
}