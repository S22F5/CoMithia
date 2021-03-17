elder_aslak = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(549,"monster"),color=0}
	        local opts = { }
		local unlocktiers = {}
		local t1exp = {}
		local t1vita = {}
		local t1mana = {}
		local total=0
		if(player.registry["currenttier"]==0) then
			player.registry["currenttier"]=1
		end
		table.insert(opts,"Unlock tiers")
		table.insert(opts,"T1 Experience")
		table.insert(opts,"T2 Experience")
		table.insert(opts,"T3 Experience")
		table.insert(unlocktiers,"Tier 2")
		table.insert(unlocktiers,"Tier 3")
		table.insert(t1exp,"Vita")
		table.insert(t1exp,"Mana")
		table.insert(t1vita,"Buy 100 Vita")
		table.insert(t1vita,"Sacrifice all my experience for Vitality")
		table.insert(t1vita,"Nothing")
		table.insert(t1mana,"Buy 100 Mana")
		table.insert(t1mana,"Sacrifice all my experience for Mana")
		table.insert(t1mana,"Nothing")
		
                player.npcGraphic=t.graphic
		player.npcColor=t.color
		
		if(player.level<99) then
			player:dialogSeq({t,"I am sorry, but you are too inexperienced to handle my services. Come back once you have reached the 99th insight."})
			return
		end

				
		local menuOption=player:menuString("Hello! I will assist you in exchanging your experience for health and mana.",opts)
			if(menuOption=="T1 Experience") then
				local choice=player:menuString2("Do you wish to trade your experience for Vita or Mana?",t1exp)
					if(choice=="Vita") then
					player:dialogSeq({t,"You will gain 100 Vita for each 50,000,000 Experience you sacrifice. You may not reach more than 20,000 Vita"},1)
						local choicevita="buffer"
						while choicevita~="Nothing" do
						choicevita=player:menuString2("What do you wish to do?",t1vita)
							if(choicevita=="Buy 100 Vita") then
								if(player.baseHealth>=20000) then
									player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
									return
								end
								if(player.exp<=50000000) then
									player:dialogSeq({t,"Sorry, but you do not have enough experience"})
									return
								end
								player:sendMinitext("You buy 100 Vita.")
								player.baseHealth=player.baseHealth+100
								player.exp=player.exp-50000000
								player:calcStat()
								player:sendStatus()
							elseif(choicevita=="Sacrifice all my experience for Vitality") then
								if(player.baseHealth>=20000) then
									player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
									return
								end
								if(player.exp<=50000000) then
									player:dialogSeq({t,"Sorry, but you do not have enough experience"})
									return
								end
								while player.exp>=50000000 and player.baseHealth<=20000 do
									player.baseHealth=player.baseHealth+100
									total=total+100
									player.exp=player.exp-50000000
									player:calcStat()
									player:sendStatus()
								end
								player:sendMinitext("You buy "..total.." Vita.")
								player:dialogSeq({t,"It is done."})
							end
						end
					elseif(choice=="Mana") then
					player:dialogSeq({t,"You will gain 100 Mana for each 50,000,000 Experience you sacrifice. You may not reach more than 20,000 Mana"},1)
						local choicemana="buffer"
						while choicemana~="Nothing" do
						choicemana=player:menuString2("What do you wish to do?",t1mana)
							if(choicemana=="Buy 100 Mana") then
								if(player.baseMagic>=20000) then
									player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
									return
								end
								if(player.exp<=50000000) then
									player:dialogSeq({t,"Sorry, but you do not have enough experience"})
									return
								end
								player:sendMinitext("You buy 100 Mana.")
								player.baseMagic=player.baseMagic+100
								player.exp=player.exp-50000000
								player:calcStat()
								player:sendStatus()
							elseif(choicemana=="Sacrifice all my experience for Mana") then
								if(player.baseMagic>=20000) then
									player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
									return
								end
								if(player.exp<=50000000) then
									player:dialogSeq({t,"Sorry, but you do not have enough experience"})
									return
								end
								while player.exp>=50000000 and player.baseMagic<=20000 do
									total=total+100
									player.baseMagic=player.baseMagic+100
									player.exp=player.exp-50000000
									player:calcStat()
									player:sendStatus()
								end
								player:sendMinitext("You buy "..total.." Mana.")
								player:dialogSeq({t,"It is done."})
							end
						end
					end
			elseif(menuOption=="T2 Experience") then
				if(player.registry["currenttier"]<2) then
					player:dialogSeq({t,"You must first unlock this tier to be able to use this ability."})
					return
				end
				local choice=player:menuString2("Do you wish to trade your experience for Vita or Mana?",t1exp)
					if(choice=="Vita") then
						if(player.baseHealth<20000) then
							player:dialogSeq({t,"Your Vita is too low for your experience to be spent on this tier."})
							return
						end
						player:dialogSeq({t,"You will gain 100 Vita for each 55,000,000 Experience you sacrifice. You may not reach more than 50,000 Vita"},1)
						local choicevita="buffer"
						while choicevita~="Nothing" do
							choicevita=player:menuString2("What do you wish to do?",t1vita)
								if(choicevita=="Buy 100 Vita") then
									if(player.baseHealth>=50000) then
										player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
										return
									end
									if(player.exp<=55000000) then
										player:dialogSeq({t,"Sorry, but you do not have enough experience"})
										return
									end
									player:sendMinitext("You buy 100 Vita.")
									player.baseHealth=player.baseHealth+100
									player.exp=player.exp-55000000
									player:calcStat()
									player:sendStatus()
								elseif(choicevita=="Sacrifice all my experience for Vitality") then
									if(player.baseHealth>=50000) then
										player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
										return
									end
									if(player.exp<=55000000) then
										player:dialogSeq({t,"Sorry, but you do not have enough experience"})
										return
									end
									while player.exp>=55000000 and player.baseHealth<=50000 do
										player.baseHealth=player.baseHealth+100
										total=total+100
										player.exp=player.exp-55000000
										player:calcStat()
										player:sendStatus()
									end
									player:sendMinitext("You buy "..total.." Vita.")
									player:dialogSeq({t,"It is done."})
								end
						end
					elseif(choice=="Mana") then
						if(player.baseMagic<20000) then
							player:dialogSeq({t,"Your Mana is too low for your experience to be spent on this tier."})
							return
						end
						player:dialogSeq({t,"You will gain 100 Mana for each 55,000,000 Experience you sacrifice. You may not reach more than 50,000 Mana"},1)
							local choicemana="buffer"
							while choicemana~="Nothing" do
							choicemana=player:menuString2("What do you wish to do?",t1mana)
								if(choicemana=="Buy 100 Mana") then
									if(player.baseMagic>=50000) then
										player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
										return
									end
									if(player.exp<=55000000) then
										player:dialogSeq({t,"Sorry, but you do not have enough experience"})
										return
									end
									player:sendMinitext("You buy 100 Mana.")
									player.baseMagic=player.baseMagic+100
									player.exp=player.exp-55000000
									player:calcStat()
									player:sendStatus()
								elseif(choicemana=="Sacrifice all my experience for Mana") then
									if(player.baseMagic>=50000) then
										player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
										return
									end
									if(player.exp<=55000000) then
										player:dialogSeq({t,"Sorry, but you do not have enough experience"})
										return
									end
									while player.exp>=55000000 and player.baseMagic<=50000 do
										total=total+100
										player.baseMagic=player.baseMagic+100
										player.exp=player.exp-55000000
										player:calcStat()
										player:sendStatus()
									end
									player:sendMinitext("You buy "..total.." Mana.")
									player:dialogSeq({t,"It is done."})
								end
							end
					end



			elseif(menuOption=="T3 Experience") then
				if(player.registry["currenttier"]<3) then
					player:dialogSeq({t,"You must first unlock this tier to be able to use this ability."})
					return
				end
				local choice=player:menuString2("Do you wish to trade your experience for Vita or Mana?",t1exp)
					if(choice=="Vita") then
						if(player.baseHealth<50000) then
							player:dialogSeq({t,"Your Vita is too low for your experience to be spent on this tier."})
							return
						end
						player:dialogSeq({t,"You will gain 100 Vita for each 60,000,000 Experience you sacrifice. You may not reach more than 100,000 Vita"},1)
							local choicevita="buffer"
							while choicevita~="Nothing" do
							choicevita=player:menuString2("What do you wish to do?",t1vita)
								if(choicevita=="Buy 100 Vita") then
									if(player.baseHealth>=100000) then
										player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
										return
									end
									if(player.exp<=60000000) then
										player:dialogSeq({t,"Sorry, but you do not have enough experience"})
										return
									end
									player:sendMinitext("You buy 100 Vita.")
									player.baseHealth=player.baseHealth+100
									player.exp=player.exp-60000000
									player:calcStat()
									player:sendStatus()
								elseif(choicevita=="Sacrifice all my experience for Vitality") then
									if(player.baseHealth>=100000) then
										player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
										return
									end
									if(player.exp<=60000000) then
										player:dialogSeq({t,"Sorry, but you do not have enough experience"})
										return
									end
									while player.exp>=60000000 and player.baseHealth<=100000 do
										player.baseHealth=player.baseHealth+100
										total=total+100
										player.exp=player.exp-60000000
										player:calcStat()
										player:sendStatus()
									end
									player:sendMinitext("You buy "..total.." Vita.")
									player:dialogSeq({t,"It is done."})
								end
							end
					elseif(choice=="Mana") then
						if(player.baseMagic<50000) then
							player:dialogSeq({t,"Your Mana is too low for your experience to be spent on this tier."})
							return
						end
						player:dialogSeq({t,"You will gain 100 Mana for each 60,000,000 Experience you sacrifice. You may not reach more than 100,000 Mana"},1)
						local choicemana="buffer"
						while choicemana~="Nothing" do
							choicemana=player:menuString2("What do you wish to do?",t1mana)
								if(choicemana=="Buy 100 Mana") then
									if(player.baseMagic>=100000) then
										player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
										return
									end
									if(player.exp<=60000000) then
										player:dialogSeq({t,"Sorry, but you do not have enough experience"})
										return
									end
									player:sendMinitext("You buy 100 Mana.")
									player.baseMagic=player.baseMagic+100
									player.exp=player.exp-60000000
									player:calcStat()
									player:sendStatus()
								elseif(choicemana=="Sacrifice all my experience for Mana") then
									if(player.baseMagic>=100000) then
										player:dialogSeq({t,"Sorry, but you have reached your maximum capacity"})
										return
									end
									if(player.exp<=60000000) then
										player:dialogSeq({t,"Sorry, but you do not have enough experience"})
										return
									end
									while player.exp>=60000000 and player.baseMagic<=100000 do
										total=total+100
										player.baseMagic=player.baseMagic+100
										player.exp=player.exp-60000000
										player:calcStat()
										player:sendStatus()
									end
									player:sendMinitext("You buy "..total.." Mana.")
									player:dialogSeq({t,"It is done."})
								end
						end
					end




			elseif(menuOption=="Unlock tiers") then
				local unlocktier=player:menuString2("Hello Great one, which tier do you wish to unlock?",unlocktiers)
					if(unlocktier=="Tier 2") then
						local tier2questopts = {}
						table.insert(tier2questopts,"Wealth")
						table.insert(tier2questopts,"Skill")
						table.insert(tier2questopts,"Raiding")
						table.insert(tier2questopts,"Perseverance")
						table.insert(tier2questopts,"Pride")
						if(player.baseHealth<20000 and player.baseMagic<20000) then
								player:dialogSeq({t,"You are not strong enough to unlock this tier yet. Come back when you have reached either 20,000 Vita or 20,000 Mana."})
								return
						end
						if(player.registry["currenttier"]>1) then
								player:dialogSeq({t,"You have already completed this quest."})
								return
						end
						if(player.registry["tier2wealth"]>=1 and player.registry["tier2skill"]>=1 and player.registry["tier2raiding"]>=1 and player.registry["tier2perseverance"]>=1 and player.registry["tier2pride"]>=1) then
								player.registry["currenttier"]=2
								player:dialogSeq({t,"Congratulations, Great one, you have sucessfully completed every trial. You are now allowed to use my services up to 50,000 Vita and 50,000 Mana."})
								return
						end
						local tier2quest=player:menuString2("Here are the different Trials you need to complete, great one.",tier2questopts)
							if(tier2quest=="Wealth") then
								if(player.registry["tier2wealth"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"It is necessary to sacrifice 50,000 coins in order to pass this trial. Press next to proceed."},1)
								if(player.money>=50000) then
										player.registry["tier2wealth"]=1
										player.money=player.money-50000
										player:sendStatus()
										player:dialogSeq({t,"It is done."})
										return
								end
							elseif(tier2quest=="Skill") then
								if(player.registry["tier2skill"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"Achieve a minimum of 5 Games victories in order to pass this trial. Press next to proceed."},1)
								if((player.registry["carnagevictories"]+player.registry["assaultvictories"]+player.registry["dominationvictories"]+player.registry["elixirwarvictories"])>=5) then
										player.registry["tier2skill"]=1
										player:dialogSeq({t,"It is done."})
										return
								end
							elseif(tier2quest=="Raiding") then
								if(player.registry["tier2raiding"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"You must have defeated Gruzar, the Lord of Darkness in order to pass this trial. Press next to proceed."},1)
								if(player.registry["gruzaraccessquest"]>=4) then
										player.registry["tier2raiding"]=1
										player:dialogSeq({t,"It is done."})
										return
								end
							elseif(tier2quest=="Perseverance") then
								if(player.registry["tier2perseverance"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"You must be of Adept level in at least one gathering craft in order to pass this trial. Press next to proceed."},1)
								if(player.registry["woodcutter"]>=2200 or player.registry["miner"]>=2200 or player.registry["shepherd"]>=2200 or player.registry["herbalist"]>=2200) then
										player.registry["tier2perseverance"]=1
										player:dialogSeq({t,"It is done."})
										return
								end
							elseif(tier2quest=="Pride") then
								if(player.registry["tier2pride"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"You must have captured at least one Battlefield shrine in order to pass this trial. Press next to proceed."},1)
								if(player.registry["battlefieldcapturedshrines"]>=1) then
										player.registry["tier2pride"]=1
										player:dialogSeq({t,"It is done."})
										return
								end
							end
					elseif(unlocktier=="Tier 3") then
						local tier3questopts = {}
						table.insert(tier3questopts,"Wealth")
						table.insert(tier3questopts,"Skill")
						table.insert(tier3questopts,"Sacrifice")
						table.insert(tier3questopts,"Perseverance")
						table.insert(tier3questopts,"Pride")
						if(player.baseHealth<50000 and player.baseMagic<50000) then
								player:dialogSeq({t,"You are not strong enough to unlock this tier yet. Come back when you have reached either 50,000 Vita or 50,000 Mana."})
								return
						end
						if(player.registry["currenttier"]>2) then
								player:dialogSeq({t,"You have already completed this quest."})
								return
						end
						if(player.registry["tier3wealth"]>=1 and player.registry["tier3skill"]>=1 and player.registry["tier3sacrifice"]>=1 and player.registry["tier3perseverance"]>=1 and player.registry["tier3pride"]>=1) then
								player.registry["currenttier"]=3
								player:dialogSeq({t,"Congratulations, Great one, you have sucessfully completed every trial. You are now allowed to use my services up to 100,000 Vita and 50,000 Mana."})
								return
						end
						local tier3quest=player:menuString2("Here are the different Trials you need to complete, great one.",tier3questopts)
							if(tier3quest=="Wealth") then
								if(player.registry["tier3wealth"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"It is necessary to sacrifice 100,000 coins in order to pass this trial. Press next to proceed."},1)
								if(player.money>=100000) then
										player.registry["tier3wealth"]=1
										player.money=player.money-100000
										player:sendStatus()
										player:dialogSeq({t,"It is done."})
										return
								end
							elseif(tier3quest=="Skill") then
								if(player.registry["tier3skill"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"Achieve a minimum of 15 Games victories in order to pass this trial. Press next to proceed."},1)
								if((player.registry["carnagevictories"]+player.registry["assaultvictories"]+player.registry["dominationvictories"]+player.registry["elixirwarvictories"])>=15) then
										player.registry["tier3skill"]=1
										player:dialogSeq({t,"It is done."})
										return
								end
							elseif(tier3quest=="Sacrifice") then
								if(player.registry["tier3sacrifice"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"You must sacrifice either 5,000 Vitality or 5,000 Mana in order to in order to pass this trial. Press next to proceed.","You need at least 25,000 Vitality to be able to sacrifice Vitality.\n\nYou need at least 25,000 Mana to be able to sacrifice Mana."},1)
								local sacrificechoice=player:menuString2("Which do you want to sacrifice?",{"Vitality","Mana"})
									if(sacrificechoice=="Vitality") then
										if(player.baseHealth<25000) then
											player:dialogSeq({t,"You do not have enough Vitality, sacrificing that much would make you too weak."})
											return
										end
										player:dialogSeq({t,"You are about to sacrifice 5,000 Vitality. Press Next to proceed."},1)
										player.baseHealth=player.baseHealth-5000
										player:calcStat()
										player:addHealth(player.maxHealth)
										player:sendStatus()
										player:sendMinitext("You sacrificed 5,000 Vitality.")
										player.registry["tier3sacrifice"]=1
										player:dialogSeq({t,"It is done."})
										return
									elseif(sacrificechoice=="Mana") then
										if(player.baseMagic<25000) then
											player:dialogSeq({t,"You do not have enough Mana, sacrificing that much would make you too weak."})
											return
										end
										player:dialogSeq({t,"You are about to sacrifice 5000 Mana. Press Next to proceed."},1)
										player.baseMagic=player.baseMagic-5000
										player:calcStat()
										player:addMana(player.maxMagic)
										player:sendStatus()
										player:sendMinitext("You sacrificed 5000 Mana.")
										player.registry["tier3sacrifice"]=1
										player:dialogSeq({t,"It is done."})
										return
									end
							elseif(tier3quest=="Perseverance") then
								if(player.registry["tier3perseverance"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"You must be of Adept level in at least one Refining craft in order to pass this trial. Press next to proceed."},1)
								if(player.registry["gemcutter"]>=2200 or player.registry["smelter"]>=2200 or player.registry["weaver"]>=2200 or player.registry["woodworker"]>=2200) then
										player.registry["tier3perseverance"]=1
										player:dialogSeq({t,"It is done."})
										return
								end
							elseif(tier3quest=="Pride") then
								if(player.registry["tier3pride"]>=1) then
										player:dialogSeq({t,"You have already completed this trial"})
										return
								end
								player:dialogSeq({t,"You must have captured at least 5 Battlefield shrines in order to pass this trial. Press next to proceed."},1)
								if(player.registry["battlefieldcapturedshrines"]>=5) then
										player.registry["tier3pride"]=1
										player:dialogSeq({t,"It is done."})
										return
								end
							end
					end
			end


		end)			
}
