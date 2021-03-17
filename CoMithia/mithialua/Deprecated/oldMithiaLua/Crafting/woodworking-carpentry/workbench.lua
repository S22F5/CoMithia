workbench = {
	click = async(function(player,npc)
		local opts = {}
		local optsweapon = { }
		local regularweapon = { }
		local t={graphic=convertGraphic(745,"monster"),color=0}

                player.npcGraphic=t.graphic
		player.npcColor=t.color


		if(player.registry["carpenteractive"]==0) then
			player:dialogSeq({t,"You are currently not a Carpenter."})
			return
		end
		
			table.insert(opts,"Carve Weapon")
			table.insert(optsweapon,"Regular weapons")
			if(player.registry["recipewinterschill"]==1) then
				table.insert(optsweapon,"Winter's chill")
			end
			if(player.registry["recipecursedspire"]==1) then
				table.insert(optsweapon,"Cursed Spire")
			end
			if(player.registry["recipepiratebuckler"]==1) then
				table.insert(optsweapon,"Pirate buckler")
			end
			if(player.registry["recipereinforcedminingpick"]==1) then
				table.insert(optsweapon,"Reinforced mining pick")
			end
			if(player.registry["recipereinforcedshears"]==1) then
				table.insert(optsweapon,"Reinforced shears")
			end
			if(player.registry["recipereinforcedaxe"]==1) then
				table.insert(optsweapon,"Reinforced axe")
			end


			if(player.registry["recipecrystalheart"]==1) then
				table.insert(optsweapon,"Crystalheart")
			end
			if(player.registry["recipetwilight"]==1) then
				table.insert(optsweapon,"Twilight")
			end


			if(player:hasItem("ash_board",2) == true) then
				table.insert(regularweapon,"Ash")
			end
			if(player:hasItem("cedar_board",2) == true) then
				table.insert(regularweapon,"Cedar")
			end
			if(player:hasItem("oak_board",2) == true) then
				table.insert(regularweapon,"Oak")
			end
			table.insert(regularweapon,"I do not have any material")		
			
			local menuOption=player:menuString2("Hello, "..player.name..", How can I help you?",opts)

			if(menuOption=="Carve Weapon") then
				local choice=player:menuString2("what Weapon do you wish to forge?",optsweapon)
				
					if(choice=="Regular weapons") then
							local armor=player:menuString2("which boards do you wish to use?",regularweapon)
								if(armor=="Ash" and player:hasItem("ash_board",2) == true) then
									player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
									player:sendStatus()
									if(player.registry["carpenter"]<75) then
										local x=math.random(1,100)
										if(x<=50) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>50 and x<=70) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("elemental_pinnacle",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1
										elseif(x>70 and x<=90) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("trident",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2
										elseif(x>90 and x<=95) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("impervious_spear",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3
										elseif(x>95 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4
										end
									elseif(player.registry["carpenter"]>=75 and player.registry["carpenter"]<220) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=45) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>45 and x<=65) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("elemental_pinnacle",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>65 and x<=85) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("trident",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>85 and x<=95) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("impervious_spear",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+y
										elseif(x>95 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+y
										end
									elseif(player.registry["carpenter"]>=220 and player.registry["carpenter"]<840) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=40) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>40 and x<=75) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("trident",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>75 and x<=90) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("impervious_spear",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>90 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*2)
										end
									elseif(player.registry["carpenter"]>=840 and player.registry["carpenter"]<2200) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=35) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>35 and x<=50) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("trident",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>50 and x<=65) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("impervious_spear",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>65 and x<=85) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+y
										elseif(x>85 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+y
										end
									elseif(player.registry["carpenter"]>=2200 and player.registry["carpenter"]<6400) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=30) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>30 and x<=60) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("impervious_spear",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>60 and x<=85) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>85 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*2)
										end
									elseif(player.registry["carpenter"]>=6400 and player.registry["carpenter"]<18000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=25) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>25 and x<=40) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("impervious_spear",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>40 and x<=65) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>65 and x<=85) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+y
										elseif(x>85 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+y
										end
									elseif(player.registry["carpenter"]>=18000 and player.registry["carpenter"]<50000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=20) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>20 and x<=50) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>50 and x<=80) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>80 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*2)
										end
									elseif(player.registry["carpenter"]>=50000 and player.registry["carpenter"]<124000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=15) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>15 and x<=30) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>30 and x<=60) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>60 and x<=85) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+y
										elseif(x>85 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+y
										end
									elseif(player.registry["carpenter"]>=124000 and player.registry["carpenter"]<237000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=10) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>10 and x<=40) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>40 and x<=80) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>80 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*2)
										end
									elseif(player.registry["carpenter"]>=237000 and player.registry["carpenter"]<400000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=5) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>5 and x<=30) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>30 and x<=60) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>60 and x<=85) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+y
										elseif(x>80 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spire",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+y
										end
									elseif(player.registry["carpenter"]>=400000 and player.registry["carpenter"]<680000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=1) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>1 and x<=30) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>30 and x<=50) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>50 and x<=75) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+y
										elseif(x>75 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spire",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+y
										end
									elseif(player.registry["carpenter"]>=680000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=1) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>1 and x<=30) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+y
										elseif(x>30 and x<=45) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+y
										elseif(x>45 and x<=70) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+y
										elseif(x>70 and x<=100) then
											player:removeItem(222,2)
											player:sendAnimation(315)
											player:addItem("spire",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+y
										end
						
									end























								elseif(armor=="Cedar" and player:hasItem("cedar_board",2) == true) then
									if(player.registry["carpenter"]>=2200) then
										player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
										player:sendStatus()
									end
									if(player.registry["carpenter"]<2200) then
										player:dialogSeq({t,"You are not experienced enough to work on Cedar boards."})
										return
									end
									if(player.registry["carpenter"]>=2200 and player.registry["carpenter"]<6400) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=30) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>30 and x<=60) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("impervious_spear",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*2)
										elseif(x>60 and x<=85) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*2)
										elseif(x>85 and x<=100) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*4)
										end
									elseif(player.registry["carpenter"]>=6400 and player.registry["carpenter"]<18000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=25) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>25 and x<=40) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("impervious_spear",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*2)
										elseif(x>40 and x<=65) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*2)
										elseif(x>65 and x<=85) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*2)
										elseif(x>85 and x<=100) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+(y*2)
										end
									elseif(player.registry["carpenter"]>=18000 and player.registry["carpenter"]<50000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=20) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>20 and x<=50) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*2)
										elseif(x>50 and x<=80) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*2)
										elseif(x>80 and x<=100) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*4)
										end
									elseif(player.registry["carpenter"]>=50000 and player.registry["carpenter"]<124000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=15) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>15 and x<=30) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*2)
										elseif(x>30 and x<=60) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*2)
										elseif(x>60 and x<=85) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*2)
										elseif(x>85 and x<=100) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+(y*2)
										end
									elseif(player.registry["carpenter"]>=124000 and player.registry["carpenter"]<237000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=10) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>10 and x<=40) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*2)
										elseif(x>40 and x<=80) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*2)
										elseif(x>80 and x<=100) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*4)
										end
									elseif(player.registry["carpenter"]>=237000 and player.registry["carpenter"]<400000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=5) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>5 and x<=30) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*2)
										elseif(x>30 and x<=60) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*2)
										elseif(x>60 and x<=85) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*2)
										elseif(x>80 and x<=100) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spire",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+(y*2)
										end
									elseif(player.registry["carpenter"]>=400000 and player.registry["carpenter"]<680000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=1) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>1 and x<=30) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*2)
										elseif(x>30 and x<=50) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*2)
										elseif(x>50 and x<=75) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*2)
										elseif(x>75 and x<=100) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spire",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+(y*2)
										end
									elseif(player.registry["carpenter"]>=680000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=1) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>1 and x<=30) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*2)
										elseif(x>30 and x<=45) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*2)
										elseif(x>45 and x<=70) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*2)
										elseif(x>70 and x<=100) then
											player:removeItem("cedar_board",2)
											player:sendAnimation(315)
											player:addItem("spire",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+(y*2)
										end
						
									end




















								elseif(armor=="Oak" and player:hasItem("oak_board",2) == true) then
									if(player.registry["carpenter"]>=18000) then
										player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
										player:sendStatus()
									end
									if(player.registry["carpenter"]<18000) then
										player:dialogSeq({t,"You are not experienced enough to work on Oak boards."})
										return
									end
									if(player.registry["carpenter"]>=18000 and player.registry["carpenter"]<50000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=20) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>20 and x<=50) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*3)
										elseif(x>50 and x<=80) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*3)
										elseif(x>80 and x<=100) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*4)
										end
									elseif(player.registry["carpenter"]>=50000 and player.registry["carpenter"]<124000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=15) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>15 and x<=30) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("shadow_flame",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*3)
										elseif(x>30 and x<=60) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*3)
										elseif(x>60 and x<=85) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*3)
										elseif(x>85 and x<=100) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+(y*3)
										end
									elseif(player.registry["carpenter"]>=124000 and player.registry["carpenter"]<237000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=10) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>10 and x<=40) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*3)
										elseif(x>40 and x<=80) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*3)
										elseif(x>80 and x<=100) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*4)
										end
									elseif(player.registry["carpenter"]>=237000 and player.registry["carpenter"]<400000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=5) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>5 and x<=30) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*3)
										elseif(x>30 and x<=60) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*3)
										elseif(x>60 and x<=85) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*3)
										elseif(x>80 and x<=100) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("spire",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+(y*3)
										end
									elseif(player.registry["carpenter"]>=400000 and player.registry["carpenter"]<680000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=1) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>1 and x<=30) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*3)
										elseif(x>30 and x<=50) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*3)
										elseif(x>50 and x<=75) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*3)
										elseif(x>75 and x<=100) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("spire",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+(y*3)
										end
									elseif(player.registry["carpenter"]>=680000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=1) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:dialogSeq({t,"You failed at making any decent weapon out of those boards."})
										elseif(x>1 and x<=30) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("spirit_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+1+(y*3)
										elseif(x>30 and x<=45) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("glowing_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+2+(y*3)
										elseif(x>45 and x<=70) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("scorched_staff",1)
											player.registry["carpenter"]=player.registry["carpenter"]+3+(y*3)
										elseif(x>70 and x<=100) then
											player:removeItem("oak_board",2)
											player:sendAnimation(315)
											player:addItem("spire",1)
											player.registry["carpenter"]=player.registry["carpenter"]+4+(y*3)
										end
						
									end















						
								--[[
										
						
									Put other wood than Ash here.
						
								
								--]]
														
						
								end
					elseif(choice=="Winter's chill") then
						player:dialogSeq({t,"Winter's Chill:\n\nA staff infused with cold.",t,"Requires:\n\n-Accomplished Carpenter\n-20 Ash board\n-1 Tiger's eye\n-1 Frozen heart\n-500 coins\n\nto be carved.",t,"Click next to proceed."},1)
						if(player:hasItem("ash_board",20) == true and player:hasItem("tigers_eye",1) == true and player:hasItem("frozen_heart",1) == true and player.money>=500 and player.registry["carpenter"]>=840) then
								player:removeItem("ash_board",20)
								player:removeItem("tigers_eye",1)
								player:removeItem("frozen_heart",1)
								player.money=player.money-500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["carpenter"]=player.registry["carpenter"]+(r*2)
								player:addItem("winters_chill",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the necessary requirements!"})
						end
					elseif(choice=="Cursed Spire") then
						player:dialogSeq({t,"Cursed Spire:\n\nA magically Cursed Spire.",t,"Requires:\n\n-Apprentice Carpenter\n-10 Ash board\n-1 Chrysocolla\n-100 coins\n\nto be carved.",t,"Click next to proceed."},1)
						if(player:hasItem("ash_board",10) == true and player:hasItem("chrysocolla",1) == true and player.money>=100 and player.registry["carpenter"]>=220) then
								player:removeItem("ash_board",10)
								player:removeItem("chrysocolla",1)
								player.money=player.money-100
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["carpenter"]=player.registry["carpenter"]+(r*2)
								player:addItem("cursed_spire",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the necessary requirements!"})
						end
					elseif(choice=="Pirate buckler") then
						player:dialogSeq({t,"Pirate buckler:\n\nA trivial wooden shield.",t,"Requires:\n\n-Accomplished Carpenter\n-40 Ash board\n-10 Tin bar\n-1 Burning rum\n-1000 coins\n\nto be carved."},1)
						if(player:hasItem("ash_board",40) == true and player:hasItem("tin_bar",10) == true and player:hasItem("burning_rum",1) == true and player.money>=1000 and player.registry["carpenter"]>=840) then
								player:removeItem("ash_board",40)
								player:removeItem("burning_rum",1)
								player:removeItem("tin_bar",10)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["carpenter"]=player.registry["carpenter"]+(r*2)
								player:addItem("pirate_buckler",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the necessary requirements!"})
						end
					elseif(choice=="Reinforced mining pick") then
						player:dialogSeq({t,"Reinforced mining pick:\n\nA mining pick for T3 and below.",t,"Requires:\n\n-Talented carpenter\n-20 Cedar boards\n-20 Copper bar\n-5 Soulstones\n-1000 coins\n\nto be carved."},1)
						if(player:hasItem("cedar_board",20) == true and player:hasItem("copper_bar",20) == true and player:hasItem("soulstone",5) == true and player.money>=1000 and player.registry["carpenter"]>=6400) then
								player:removeItem("cedar_board",20)
								player:removeItem("copper_bar",20)
								player:removeItem("soulstone",5)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["carpenter"]=player.registry["carpenter"]+(r*2)
								player:addItem("reinforced_mining_pick",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the necessary requirements!"})
						end
					elseif(choice=="Reinforced shears") then
						player:dialogSeq({t,"Reinforced shears:\n\nShears for T3 and below.",t,"Requires:\n\n-Talented carpenter\n-20 Cedar boards\n-20 Copper bar\n-5 Soulstones\n-1000 coins\n\nto be carved."},1)
						if(player:hasItem("cedar_board",20) == true and player:hasItem("copper_bar",20) == true and player:hasItem("soulstone",5) == true and player.money>=1000 and player.registry["carpenter"]>=6400) then
								player:removeItem("cedar_board",20)
								player:removeItem("copper_bar",20)
								player:removeItem("soulstone",5)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["carpenter"]=player.registry["carpenter"]+(r*2)
								player:addItem("reinforced_shears",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the necessary requirements!"})
						end
					elseif(choice=="Reinforced axe") then
						player:dialogSeq({t,"Reinforced axe:\n\nA woodcutting axe for T3 and below.",t,"Requires:\n\n-Talented carpenter\n-20 Cedar boards\n-20 Copper bar\n-5 Soulstones\n-1000 coins\n\nto be carved."},1)
						if(player:hasItem("cedar_board",20) == true and player:hasItem("copper_bar",20) == true and player:hasItem("soulstone",5) == true and player.money>=1000 and player.registry["carpenter"]>=6400) then
								player:removeItem("cedar_board",20)
								player:removeItem("copper_bar",20)
								player:removeItem("soulstone",5)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["carpenter"]=player.registry["carpenter"]+(r*2)
								player:addItem("reinforced_woodcutting_axe",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the necessary requirements!"})
						end
					elseif(choice=="Crystalheart") then
						player:dialogSeq({t,"Crystalheart:\n\nA Magician's wand.",t,"Requires:\n\n-Talented Carpenter\n-50 Soulstones\n-20 Oak boards\n-20 Cedar boards\n-5 Iron bar\n-1 Gold bar\n-5000 coins\n\nto be carved."},1)
						if(player:hasItem("cedar_board",20) == true and player:hasItem("oak_board",20) == true and player:hasItem("iron_bar",5) == true and player:hasItem("gold_bar",1) == true and player:hasItem("soulstone",50) == true and player.money>=5000 and player.registry["carpenter"]>=6400) then
								player:removeItem("cedar_board",20)
								player:removeItem("oak_board",20)
								player:removeItem("soulstone",50)
								player:removeItem("iron_bar",5)
								player:removeItem("gold_bar",1)
								player.money=player.money-5000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["carpenter"]=player.registry["carpenter"]+(r*2)
								player:addItem("crystalheart",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the necessary requirements!"})
						end
					elseif(choice=="Twilight") then
						player:dialogSeq({t,"Twilight:\n\nA Poet's staff.",t,"Requires:\n\n-Talented Carpenter\n-50 Soulstones\n-20 Oak boards\n-20 Cedar boards\n-5 Iron bar\n-1 Gold bar\n-5000 coins\n\nto be carved."},1)
						if(player:hasItem("cedar_board",20) == true and player:hasItem("oak_board",20) == true and player:hasItem("iron_bar",5) == true and player:hasItem("gold_bar",1) == true and player:hasItem("soulstone",50) == true and player.money>=5000 and player.registry["carpenter"]>=6400) then
								player:removeItem("cedar_board",20)
								player:removeItem("oak_board",20)
								player:removeItem("soulstone",50)
								player:removeItem("iron_bar",5)
								player:removeItem("gold_bar",1)
								player.money=player.money-5000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["carpenter"]=player.registry["carpenter"]+(r*2)
								player:addItem("twilight",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the necessary requirements!"})
						end
					







						--[[
										
							Put Recipes here

								
						--]]

					end

		local craftlevel="Beginner"
		if(player.registry["carpenter"]>=1 and player.registry["carpenter"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["carpenter"]>=25 and player.registry["carpenter"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["carpenter"]>=220 and player.registry["carpenter"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["carpenter"]>=840 and player.registry["carpenter"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["carpenter"]>=2200 and player.registry["carpenter"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["carpenter"]>=6400 and player.registry["carpenter"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["carpenter"]>=18000 and player.registry["carpenter"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["carpenter"]>=50000 and player.registry["carpenter"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["carpenter"]>=124000 and player.registry["carpenter"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["carpenter"]>=237000 and player.registry["carpenter"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["carpenter"]>=400000 and player.registry["carpenter"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["carpenter"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("carpenter")
		player:addLegend(""..craftlevel.." carpenter","carpenter",66,128)
					



					
			end											

	end)
}