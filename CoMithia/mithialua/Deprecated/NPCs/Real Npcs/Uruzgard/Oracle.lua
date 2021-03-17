oracle = {
	click=async(function(player,npc)
			local t={graphic=convertGraphic(656,"monster"),color=12}
                        local opts= { }
			if(player.level==5 and player.class==0) then
				table.insert(opts,"Choose your path")
			end
			if(player.class>0) then
				table.insert(opts,"Learn spell")
				table.insert(opts,"Remove spell")
			end
			if(#opts~=0) then
				player.npcGraphic=t.graphic
			        player.npcColor=t.color
                                local menuOption=player:menuString("How can I help you, young mortal?",opts);
				if (menuOption=="Choose your path") then 
					oracle.choose_path(player,npc)
				elseif(menuOption=="Learn spell") then
					oracle.learn_spell(player,npc)
				elseif(menuOption=="Remove spell") then
					oracle.remove_spell(player,npc)
				end
			end
	end),
	choose_path=function(player,npc)
		local opts = { }
		local t={graphic=convertGraphic(656,"monster"),color=12}	
				table.insert(opts,"Become a Warrior")
				table.insert(opts,"Become a Rogue")
				table.insert(opts,"Become a Mage")
				table.insert(opts,"Become a Poet")
			        player.npcGraphic=t.graphic
			        player.npcColor=t.color 
			
			if(#opts~=0) then
				local menuOption=player:menuString("What path shall you choose, mortal?",opts)
				print(menuOption)
				if menuOption=="Become a Warrior" then
			   		player.class=1
               			player:sendMinitext("You are now a Warrior!")
				elseif menuOption=="Become a Rogue" then
					player.class=2
					player:sendMinitext("You are now a Rogue!")
				elseif menuOption=="Become a Mage" then
					player.class=3
					player:sendMinitext("you are now a Mage!")
				elseif menuOption=="Become a Poet" then
					player.class=4
					player:sendMinitext("You are now a Poet!")
				end
			end
	end,
        learn_spell=function(player,npc)
                local t={graphic=convertGraphic(656,"monster"),color=12}
                player.npcGraphic=t.graphic
                player.npcColor=t.color
                learnSpell.run(player)
	end,
	remove_spell=function(player,npc)
		local t={graphic=convertGraphic(656,"monster"),color=12}
		player.npcGraphic=t.graphic
		player.npcColor=t.color
		learnSpell.remove_spell(player)
	end,

	say=async(function(player,npc)
        local t={graphic=convertGraphic(656,"monster"),color=12}
        local opts = { }
        local opts2 = { }
	local s=player.speech
        if(string.find(string.lower(s),"well")~=nil and player.registry["thewell"]<2) then
		table.insert(opts,"Noise come from beneath")
		table.insert(opts,"Maybe it's not special...")
		local menuOption=player:menuString("The well... young one, there are many wells.",opts)
			if(menuOption=="Maybe it's not special...") then
				player:dialogSeq({t,"You may be correct. The mind can play tricks on you."})
			elseif(menuOption=="Noise come from beneath") then
				table.insert(opts2,"If that's truly what you advise...")
				table.insert(opts2,"No, Oracle, I must continue with this!")
				local menuOption2=player:menuString("Oh I see... Young one that well is filled with quite agil, vile and evil beasts. Please reconsider your thirst for knowledge.",opts2)
					if(menuOption2=="No, Oracle, I must continue with this!") then
						player:dialogSeq({t,"I see... Young one, your bravery is admirable. But again, the warning stands, young one. The well holds secrets of a beast called Amattar. The name itself is terrible, and plagues have been causes by his hands.",t,"The story is told in whispers, but it's mark still scorns the townsfolk of Mithia. Even outside of these lands, the Amattar is considered a jotun among many, a beast of great power from the underworld of ice and fire.",t,"If this does not hold you back, then the underworld of the well is yours to enter. But to get in it, you will need to get some Rope. I think the local Blacksmith might be of help to you. Blessings on your journey, young one."},1)
						if(player.registry["thewell"]==0) then
						player.registry["thewell"]=1
						end
					end
			end
	end
	if(player.registry["thewell"]==6 and string.find(string.lower(s),"tainted leaf")~=nil) then
		if(player:hasItem("tainted_leaf",1) == true) then
				--if(not player:dialogSeq({t,"I see you've returned with Amattar's treasure.",t,"You see, the leaf, being an attractant to evil when tainted, was used to call upon great power in dire times. But, it can be purified."},1)) then
				--		return false
				--end
				table.insert(opts,"Yes")
				table.insert(opts,"No")
				local menuOption=player:menuString("I can purify the leaf but it will require a sacrifice of 20.000 experience. Do you wish to proceed?",opts)
					if(menuOption=="Yes") then
						if(player.exp>=20000 and player:hasItem("tainted_leaf",1) == true) then
							player:removeItem(167,1)
							player.exp=player.exp-20000
							player:sendStatus()
							player:sendMinitext("You sacrifice 20000 experience.")
							player:addItem(168,1)
							player:removeLegendbyName("thewell")
							player:addLegend("Purified the tainted leaf (Year " .. player:curYear() .. ", " .. player:getCurSeason() .. ")","thewell",128,1)
							
						else
							player:dialogSeq({t,"You do not have the possess the necessary experience, young one."})
						end
					end					
			
		end
	   end
			
        end)                       	
}
