raphaella = {
	click=async(function(player,npc)

		local t={graphic=convertGraphic(946,"monster"),color=31}
		local opts = {}
		local optsdivorce ={}
		local bride = {}
		local groom = {}
		local groomloop=0
		local brideloop=0
                player.npcGraphic=t.graphic
	        player.npcColor=t.color
		if(player.registry["marriagecelebrant"]>0)  then
			table.insert(opts,"Celebrate Marriage")
			table.insert(opts,"Broadcast Marriage")
			table.insert(opts,"Community events yowl")
		end 
			table.insert(opts,"Buy")
			table.insert(opts,"Sell")
			table.insert(opts,"Divorce")
			table.insert(optsdivorce,"Yes")
			table.insert(optsdivorce,"No")
		if(player.state==1) then
			player:sendMinitext("Raphaella refuses to serve ghosts!")
			return
		end
		
		local menuChoice=player:menuString("Hello, how can I help you on this lovely day ?",opts)

			if(menuChoice=="Buy") then
				player:buyExtend("What do you wish to buy?",{460,461,42,462})
                        elseif(menuChoice=="Sell") then
                                player:sellExtend("What do you wish to sell?",{460,461})
                        elseif(menuChoice=="Divorce") then
                                if(player.spouse~=0) then
					if(player.registry["lastdivorce"]<=os.time()) then
						player:dialogSeq({t,"Love can be tough. If you want to be separated from your previously loved one, I hope you have Good reasons.",t,"Please proceed only if you are certain of your decision."},1)
						local choicedivorce=player:menuString2("Are you certain you want to divorce?",optsdivorce)
							if(choicedivorce=="Yes") then
								player.spouse=0	
								player:removeLegendbyName("marriage")
								player.registry["lastdivorce"]=os.time()+(60*60*24*60)
								player:dialogSeq({t,"You are now divorced."})
							else
								player:dialogSeq({t,"Very well, May you stay with your partner for eternity then."})
							end
					else
						amount=player.registry["lastdivorce"]-os.time()
						amount=math.ceil(amount/(60*60*24))
						player:dialogSeq({t,"I'm sorry, but divorces are limited to a maximum of one per month. You will have to wait "..amount.." more days to be granted a divorce."})
					end
				else
					player:dialogSeq({t,"You are not currently married."})
				end
			elseif(menuChoice=="Broadcast Marriage" and player.registry["marriagecelebrant"]>0) then
				player:dialogSeq({t,"Celebrant, this tool allows you to broadcast a marriage to other players. Press next to proceed"},1)
				player:broadcast(-1,"Celebrant "..player.name.." announces that a Marriage Ceremony is being celebrated in the Mithia Chapel")
			
			elseif(menuChoice=="Community events yowl" and player.registry["marriagecelebrant"]>0) then
				player:dialogSeq({t,"Celebrant, this tool allows you to broadcast a yowl inviting other players to read the community events bulletin. Press next to proceed"},1)
				player:broadcast(-1,"Celebrant "..player.name.." invites you to read the Community Events board")						

			elseif(menuChoice=="Celebrate Marriage" and player.registry["marriagecelebrant"]>0) then
				player:dialogSeq({t,"Celebrant, this tool allows you to celebrate a Marriage. Both the Groom and the Bride must be present in your Chapel. Press next to proceed."},1)
				local groomchoice=player:input("Please enter the name of the Groom")
				groomchoice=string.lower(groomchoice)
				if(groomchoice==string.lower(player.name)) then
					player:dialogSeq({t,"I'm sorry but you are not allowed to marry yourself, you will need the services of another Celebrant."})
				end
				for i=0,30 do
					for j=0,30 do
						groom=player:getObjectsInCell(player.m,i,j,BL_PC)
						if(#groom)>0 then
							for k=1,#groom do
								if(string.lower(groom[k].name)==groomchoice) then
									if(groom[k].sex==0) then
										if(groom[k].spouse==0) then
											groomloop=1
											player.registry["recordgroom"]=groom[k].ID
											groom[k].registry["marriedby"]=player.ID
										else
											player:dialogSeq({t,""..groom[k].name.." is already married!"})
										end
									else
										player:dialogSeq({t,""..groom[k].name.." is a woman!"})
									end
								end
							end
						end
					end
				end

				if(groomloop==0) then
					player:dialogSeq({t,"The Groom isn't in the room!"})
					return
				end

				
				local bridechoice=player:input("Please enter the name of the Bride")
				bridechoice=string.lower(bridechoice)
				if(bridechoice==string.lower(player.name)) then
					player:dialogSeq({t,"I'm sorry but you are not allowed to marry yourself, you will need the services of another Celebrant."})
				end
				for i=0,30 do
					for j=0,30 do
						bride=player:getObjectsInCell(player.m,i,j,BL_PC)
						if(#bride)>0 then
							for k=1,#bride do
								if(string.lower(bride[k].name)==bridechoice) then
									if(bride[k].sex==1) then
										if(bride[k].spouse==0) then
											brideloop=1
											player.registry["recordbride"]=bride[k].ID
											bride[k].registry["marriedby"]=player.ID
											bride[k].registry["groomtobe"]=Player(groomchoice).ID
											raphaella.bridecheck(Player(bridechoice),npc)
										else
											player:dialogSeq({t,""..groom[k].name.." is already married!"})
										end
									else
										player:dialogSeq({t,""..bride[k].name.." is a man!"})
									end
								end
							end
						end
					end
				end

				if(brideloop==0) then
					player:dialogSeq({t,"The Bride isn't in the room!"})
					return
				end

       
			end
	
	end),

	bridecheck=async(function(player,npc)
		local opts = {}
		local t={graphic=convertGraphic(946,"monster"),color=31}
		table.insert(opts,"Yes, very much so!")
		table.insert(opts,"No, I don't know that person enough!")
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

		local answer=player:menuString2("Celebrant "..Player(player.registry["marriedby"]).name.." whishes to Celebrate your marriage with "..Player(player.registry["groomtobe"]).name..", Do you wish to get married to him?",opts)
			if(answer=="No, I don't know that person enough!") then
					Player(player.registry["marriedby"]):dialogSeq({t,"The bride does not accept to get married to "..Player(player.registry["groomtobe"]).name.."."})
			elseif(answer=="Yes, very much so!") then
					Player(player.registry["groomtobe"]).registry["bridetobe"]=player.ID
					raphaella.groomcheck(Player(player.registry["groomtobe"]),npc)
			end
		
																				

		


	end),
	
	groomcheck=async(function(player,npc)
		local opts = {}
		local t={graphic=convertGraphic(946,"monster"),color=31}
		table.insert(opts,"Yes, very much so!")
		table.insert(opts,"No, I don't know that person enough!")
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

		local answer=player:menuString2("Celebrant "..Player(player.registry["marriedby"]).name.." whishes to Celebrate your marriage with "..Player(player.registry["bridetobe"]).name..", Do you wish to get married to her?",opts)
			if(answer=="No, I don't know that person enough!") then
					Player(player.registry["marriedby"]):dialogSeq({t,"The Groom does not accept to get married to "..Player(player.registry["bridetobe"]).name.."."})
			elseif(answer=="Yes, very much so!") then
					raphaella.marriage(Player(player.registry["marriedby"]),npc)
			end
		




	end),

	marriage=async(function(player,npc)
		local opts = {}
		local broadopts = {}
		local bride = {}
		local groom = {}
		local fireworks = { }
		local groomloop=0
		local brideloop=0
		local t={graphic=convertGraphic(946,"monster"),color=31}
                player.npcGraphic=t.graphic
	        player.npcColor=t.color

		table.insert(broadopts,"Do not broadcast")
		table.insert(broadopts,"Chapel")
		table.insert(broadopts,"Server")


		player:dialogSeq({t,"Both the Bride and the Groom wish to get married to each other. Press Next to finalize the Ceremony."},1)

				for i=0,30 do
					for j=0,30 do
						groom=player:getObjectsInCell(player.m,i,j,BL_PC)
						if(#groom)>0 then
							for k=1,#groom do
								if(string.lower(groom[k].name)==string.lower(Player(player.registry["recordgroom"]).name)) then
										groomloop=1
								end
							end
						end
					end
				end

				for i=0,30 do
					for j=0,30 do
						bride=player:getObjectsInCell(player.m,i,j,BL_PC)
						if(#bride)>0 then
							for k=1,#bride do
								if(string.lower(bride[k].name)==string.lower(Player(player.registry["recordbride"]).name)) then
										brideloop=1
								end
							end
						end
					end
				end

				if(groomloop==1 and brideloop==1) then

					Player(player.registry["recordgroom"]):removeLegendbyName("marriage")
					Player(player.registry["recordgroom"]):addLegend("Married to "..Player(player.registry["recordbride"]).name.." by Celebrant "..player.name.." in Year " .. player:curYear() .. ", " .. player:getCurSeason() .. "","marriage",6,1)
					Player(player.registry["recordgroom"]).spouse=Player(player.registry["recordbride"]).ID
					Player(player.registry["recordgroom"]):sendAction(14,200)

					player:playSound(512)

					Player(player.registry["recordbride"]):removeLegendbyName("marriage")
					Player(player.registry["recordbride"]):addLegend("Married to "..Player(player.registry["recordgroom"]).name.." by Celebrant "..player.name.." in Year " .. player:curYear() .. ", " .. player:getCurSeason() .. "","marriage",6,1)
					Player(player.registry["recordbride"]).spouse=Player(player.registry["recordgroom"]).ID
					Player(player.registry["recordbride"]):sendAction(14,200)

					player.registry["celebratedmarriages"]=player.registry["celebratedmarriages"]+1
					
					player:removeLegendbyName("celebrationcount")
					player:addLegend("Celebrated "..player.registry["celebratedmarriages"].." marriages","celebrationcount",6,128)

					for i=0,50 do
						for j=0,50 do
							fireworks=player:getObjectsInCell(player.m,i,j,BL_PC)
							if(#fireworks)>0 then
								for k=1,#fireworks do
									fireworks[k]:sendAnimation(337)
								end
							end
						end
					end



				
					local broad=player:menuString2("Broadcast the announcement of their marriage to :",broadopts)	
						if(broad=="Chapel") then
							player:broadcast(47,"== "..Player(player.registry["recordgroom"]).name.." and "..Player(player.registry["recordbride"]).name.." are now unified in Marriage! ==")
						elseif(broad=="Server") then
							player:broadcast(-1,"== "..Player(player.registry["recordgroom"]).name.." and "..Player(player.registry["recordbride"]).name.." are now unified in Marriage! ==")
						end

				elseif(brideloop==0 and groomloop==1) then
					player:dialogSeq({t,"The Bride has left the room!"})
				elseif(groomloop==0 and brideloop==1) then
					player:dialogSeq({t,"The Groom has left the room!"})
				elseif(groomloop==0 and brideloop==0) then
					player:dialogSeq({t,"Both the Bride and the Groom have left the room!"})
				end

	end)
}
