templar_walker = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(1013,"monster"),color=0}
	        local opts = { }

		player.npcGraphic=t.graphic
		player.npcColor=t.color
		local classcheck=6
		

		table.insert(opts,"Buy")
		table.insert(opts,"Sell")
		table.insert(opts,"Learn spell")
		table.insert(opts,"Abandon")


		if(player.registry["subpathlevel"]==3) then
			table.insert(opts,"Promote")
			table.insert(opts,"Demote")
			table.insert(opts,"Step down")
			table.insert(opts,"Exile walker")
			table.insert(opts,"Elder sage")
		end

		


		local menuOption=player:menuString("Hello, how may I help you?",opts)
					

			if(menuOption=="Buy") then
				-- buy menu
			elseif(menuOption=="sell") then
				--sell menu
			elseif(menuOption=="Learn spell") then
				learnSpellSub.run(player)
			elseif(menuOption=="Abandon") then
				if(player.class==classcheck) then
					if(player.registry["subpathlevel"]==3) then
						player:dialogSeq({t,"As the Elder, you cannot abandon your own path"})
						return
					end
					player.registry["subpathlevel"]=0
					player.registry["boardname266"]=0
					player.registry["boardname267"]=0
					player.registry["board267write"]=0
					player:warp(9,4,6)
					player.class=1
					player:removeLegendbyName("subpathguide")
					player:sendStatus()
				end
			elseif(menuOption=="Exile walker" and player.class==classcheck and player.registry["subpathlevel"]==3) then
				player:dialogSeq({t,"Hello Master, this will allow you to Exile one of your walkers."},1)
				local nameofPlayer=player:input("Who should be exiled?")
				if(string.lower(nameofPlayer)==string.lower(player.name)) then
					player:dialogSeq({t,"You cannot do that."})
					return
				end
				if(Player(nameofPlayer).registry["subpathlevel"]<=2 and Player(nameofPlayer).class==classcheck) then
					Player(nameofPlayer):sendMinitext("You have been exiled!")
					player:sendMinitext(""..nameofPlayer.." has been exiled.")
					Player(nameofPlayer).registry["subpathlevel"]=0
					Player(nameofPlayer).registry["boardname266"]=0
					Player(nameofPlayer).registry["boardname267"]=0
					Player(nameofPlayer).registry["board267write"]=0
					Player(nameofPlayer).class=1
					Player(nameofPlayer):removeLegendbyName("subpathguide")
					Player(nameofPlayer):warp(9,4,6)
					Player(nameofPlayer):sendStatus()
				end
			elseif(menuOption=="Elder sage" and player.class==classcheck and player.registry["subpathlevel"]==3) then
				player:dialogSeq({t,"Hello Master, this tool will allow you to learn Elder sage."},1)
				player:addSpell("elder_sage")
			elseif(menuOption=="Promote" and player.class==classcheck and player.registry["subpathlevel"]==3) then
				local checkplayer = {}
				local check=0
				player:dialogSeq({t,"Hello Master, this will allow you to promote one of your Walkers as a Guide. The player must be present in the room"},1)
				local nameofPlayer=player:input("Who should become one of your Guides?")
				if(string.lower(nameofPlayer)==string.lower(player.name)) then
					player:dialogSeq({t,"You cannot do that."})
					return
				end

				checkplayer=player:getObjectsInArea(BL_PC)
				if(#checkplayer>0) then
					for x=1,#checkplayer do
						if(string.lower(checkplayer[x].name)==string.lower(nameofPlayer)) then
							if(checkplayer[x].class~=classcheck) then
								player:dialogSeq({t,""..nameofPlayer.." does not walk your path."})
								return
							end
							if(checkplayer[x].registry["subpathlevel"]>=2) then
								player:dialogSeq({t,""..nameofPlayer.." is already a guide."})
								return
							end
							
							Player(nameofPlayer).registry["subpathlevel"]=2
							Player(nameofPlayer).registry["boardname266"]=4
							Player(nameofPlayer).registry["boardname267"]=4
							Player(nameofPlayer).registry["board267write"]=1
							Player(nameofPlayer):removeLegendbyName("subpathguide")
							Player(nameofPlayer):addLegend("Guide of the Templars (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","subpathguide",42,128)
							Player(nameofPlayer):sendMinitext("You have been ascended to Guideship, congratulations.")
							player:sendMinitext(""..nameofPlayer.." has been ascended.")
							check=1
							return
						end
					end
					if(check==0) then
						player:dialogSeq({t,""..nameofPlayer.." is not around."})
						return
					end
				end



			elseif(menuOption=="Demote" and player.class==classcheck and player.registry["subpathlevel"]==3) then
				player:dialogSeq({t,"Hello Master, this will allow you to demote one of your Guides as a walker."},1)
				local nameofPlayer=player:input("Which Guide should be demoted?")
				if(string.lower(nameofPlayer)==string.lower(player.name)) then
					player:dialogSeq({t,"You cannot do that."})
					return
				end
				if(Player(nameofPlayer).registry["subpathlevel"]>=2 and Player(nameofPlayer).class==classcheck) then
					Player(nameofPlayer):sendMinitext("Your Guideship has been rescinded")
					player:sendMinitext(""..nameofPlayer.." has been demoted.")
					Player(nameofPlayer).registry["subpathlevel"]=1
					Player(nameofPlayer).registry["boardname266"]=0
					Player(nameofPlayer).registry["boardname267"]=0
					Player(nameofPlayer).registry["board267write"]=0
					Player(nameofPlayer):removeLegendbyName("subpathguide")
				end
			elseif(menuOption=="Step down" and player.class==classcheck and player.registry["subpathlevel"]==3) then
				local checkplayer = {}
				local check=0
				player:dialogSeq({t,"Hello Master, this will allow you to step down from your position and promote someone as the new Elder. Player must already be a Guide and be in the room","Only proceed if you have absolutely sure of your decision"},1)
				local nameofPlayer=player:input("Who should become the next Elder")
				if(string.lower(nameofPlayer)==string.lower(player.name)) then
					player:dialogSeq({t,"You cannot do that."})
					return
				end

				checkplayer=player:getObjectsInArea(BL_PC)
				
				if(#checkplayer>0) then
				
					for x=1,#checkplayer do
						if(string.lower(checkplayer[x].name)==string.lower(nameofPlayer)) then
							if(checkplayer[x].class~=classcheck) then
								player:dialogSeq({t,""..nameofPlayer.." does not walk your path."})
								return
							end
							if(checkplayer[x].registry["subpathlevel"]<2) then
								player:dialogSeq({t,""..nameofPlayer.." is not a guide."})
								return
							end
							
							Player(nameofPlayer).registry["subpathlevel"]=3
							Player(nameofPlayer).registry["boardname266"]=3
							Player(nameofPlayer).registry["boardname267"]=3
							Player(nameofPlayer).registry["board267write"]=1
							Player(nameofPlayer).registry["board266del"]=1
							Player(nameofPlayer).registry["board267del"]=1
							Player(nameofPlayer):removeLegendbyName("subpathguide")
							Player(nameofPlayer):addLegend("Elder of the Templars (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","subpathguide",42,128)
							Player(nameofPlayer):sendMinitext("You have been ascended to Eldership, congratulations.")

							player.registry["subpathlevel"]=1
							player.registry["boardname266"]=0
							player.registry["boardname267"]=0
							player.registry["board267write"]=0
							player.registry["board266del"]=0
							player.registry["board267del"]=0
							player:removeLegendbyName("subpathguide")
							player:removeSpell("elder_sage")
							player:sendMinitext("It is done.")
							check=1
							return
						end
					end
					if(check==0) then
						player:dialogSeq({t,""..nameofPlayer.." is not around."})
						return
					end
				end
			end
	
        end)
}