templarentrance1799141 = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(1013,"monster"),color=0}
	        local opts = { }
		local check = { }
		local count = 0
		local name
		table.insert(opts,"Initiate Walker")
		table.insert(opts,"Enter Circle")



                player.npcGraphic=t.graphic
		player.npcColor=t.color

		if(player.registry["subpathlevel"]>=2 and player.class==6) then
			local choice=player:menuString2("What do you wish to do?",opts)
				if(choice=="Enter Circle") then
					player:warp(30001,9,18)
				elseif(choice=="Initiate Walker" and player.registry["subpathlevel"]>=2) then
					player:dialogSeq({"Greetings, this will allow you to add a player to your subpath. The player must be present and around. Only proceed if you are certain of your decision."},1)
					name=player:input("Who do you wish to initiate?")
					if(string.lower(name)~=string.lower(player.name)) then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(name)) then
										if(check[z].class~=1) then
											player:dialogSeq({t,""..check[z].name.." is already part of another path."})
											return
										end
										check[z].registry["popupsubpathadd"]=player.ID
										templarentrance1799141.walkerinvite(Player(name),npc)
									end
								end
							end
						end
					end
					else
						player:dialogSeq({"You are already part of the subpath!"})
					end
				end
		elseif(player.registry["subpathlevel"]==1 and player.class==6) then
			player:warp(30001,9,18)
		end
										
	end),

	walkerinvite=async(function(player,npc)

			local t={graphic=convertGraphic(1013,"monster"),color=0}
			local opts = {}
			local check = {}
			table.insert(opts,"Yes")
			table.insert(opts,"No")
                        player.npcGraphic=t.graphic
			player.npcColor=t.color

			local choice=player:menuString2(""..Player(player.registry["popupsubpathadd"]).name.." Wishes to initiate you to the Templar Subpath, do you accept?",opts)
				if(choice=="No") then
					Player(player.registry["popupsubpathadd"]):dialogSeq({""..player.name" has refused your offer."})
				elseif(choice=="Yes") then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(Player(player.registry["popupsubpathadd"]).name)) then
										check[z]:sendMinitext(""..player.name.." has accepted your offer.")
										player.class=6
										player.registry["subpathlevel"]=1
										player:sendStatus()
										player:sendMinitext("You are now a member of the Templars.")
									end
								end
							end
						end
					end
				end
	end)

}


templarentrance17100141 = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(1013,"monster"),color=0}
	        local opts = { }
		local check = { }
		local count = 0
		local name
		table.insert(opts,"Initiate Walker")
		table.insert(opts,"Enter Circle")



                player.npcGraphic=t.graphic
		player.npcColor=t.color

		if(player.registry["subpathlevel"]>=2 and player.class==6) then
			local choice=player:menuString2("What do you wish to do?",opts)
				if(choice=="Enter Circle") then
					player:warp(30001,10,18)
				elseif(choice=="Initiate Walker" and player.registry["subpathlevel"]>=2) then
					player:dialogSeq({"Greetings, this will allow you to add a player to your subpath. The player must be present and around. Only proceed if you are certain of your decision."},1)
					name=player:input("Who do you wish to initiate?")
					if(string.lower(name)~=string.lower(player.name)) then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(name)) then
										if(check[z].class~=1) then
											player:dialogSeq({t,""..check[z].name.." is already part of another path."})
											return
										end
										check[z].registry["popupsubpathadd"]=player.ID
										templarentrance17100141.walkerinvite(Player(name),npc)
									end
								end
							end
						end
					end
					else
						player:dialogSeq({"You are already part of the subpath!"})
					end
				end
		elseif(player.registry["subpathlevel"]==1 and player.class==6) then
			player:warp(30001,10,18)
		end
										
	end),

	walkerinvite=async(function(player,npc)

			local t={graphic=convertGraphic(1013,"monster"),color=0}
			local opts = {}
			local check = {}
			table.insert(opts,"Yes")
			table.insert(opts,"No")
                        player.npcGraphic=t.graphic
			player.npcColor=t.color

			local choice=player:menuString2(""..Player(player.registry["popupsubpathadd"]).name.." Wishes to initiate you to the Templar Subpath, do you accept?",opts)
				if(choice=="No") then
					Player(player.registry["popupsubpathadd"]):dialogSeq({""..player.name" has refused your offer."})
				elseif(choice=="Yes") then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(Player(player.registry["popupsubpathadd"]).name)) then
										check[z]:sendMinitext(""..player.name.." has accepted your offer.")
										player.class=6
										player:sendStatus()
										player.registry["subpathlevel"]=1
										player:sendMinitext("You are now a member of the Templars.")
									end
								end
							end
						end
					end
				end
	end)

}