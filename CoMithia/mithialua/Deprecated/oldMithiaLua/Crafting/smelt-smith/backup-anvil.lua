backupanvil = {
	click = async(function(player,npc)
		local opts = {}
		local optsarmor = { }
		local regulararmor = { }
		local t={graphic=convertGraphic(828,"monster"),color=0}

                        player.npcGraphic=t.graphic
		        player.npcColor=t.color
		
			table.insert(opts,"Forge Armor")
			table.insert(opts,"Forge Weapon")
			table.insert(optsarmor,"Regular armors")
			if(player.registry["recipestoutplatemail"]==1) then
				table.insert(optsarmor,"Stout platemail")
			end

			if(player:hasItem("tin_bar",2)) then
				table.insert(regulararmor,"Tin")
			end

			table.insert(regulararmor,"I do not have any material")		
			
			local menuOption=player:menuString2("Hello, "..player.name..", How can I help you?",opts)
			if(menuOption=="Forge Armor") then
				local choice=player:menuString2("what Armor do you wish to forge?",optsarmor)
				
					if(choice=="Regular armors") then
							local armor=player:menuString2("which metal do you wish to use?",regulararmor)
								if(armor=="Tin") then
									if(player.registry["armorer"]<=75) then
										local x=math.random(1,100)
											if(x>=50) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<50 and x>=35) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x<35) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("stout_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+1															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("stout_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+1
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("stout_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+2
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("stout_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+2
													end
											end
									elseif(player.registry["armorer"]>75 and player.registry["armorer"]<=150) then
										local x=math.random(1,100)
											if(x>=60) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<60 and x>=40) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=10 and x<40) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("stout_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+1															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("stout_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+1
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("stout_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+2
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("stout_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+2
													end

											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											end
									elseif(player.registry["armorer"]>150 and player.registry["armorer"]<=500) then
										local x=math.random(1,100)
											if(x>=65) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<65 and x>=45) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=10 and x<45) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end

											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											end
									elseif(player.registry["armorer"]>500 and player.registry["armorer"]<=1600) then
										local x=math.random(1,100)
											if(x>=70) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<70 and x>=55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("strong_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=30 and x<55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("sturdy_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end

											elseif(x>=10 and x<30) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													end
											end
									elseif(player.registry["armorer"]>1600 and player.registry["armorer"]<=3800) then
										local x=math.random(1,100)
											if(x>=75) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<75 and x>=50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=15 and x<50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											end
									elseif(player.registry["armorer"]>3800 and player.registry["armorer"]<=9000) then
										local x=math.random(1,100)
											if(x>=78) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<78 and x>=55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=25 and x<55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("reinforced_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end

											elseif(x>=10 and x<25) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													end
											end
									elseif(player.registry["armorer"]>9000 and player.registry["armorer"]<=24200) then
										local x=math.random(1,100)
											if(x>=81) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<81 and x>=50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=15 and x<50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											end
									elseif(player.registry["armorer"]>24200 and player.registry["armorer"]<=60400) then
										local x=math.random(1,100)
											if(x>=84) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<84 and x>=65) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=30 and x<65) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("hardened_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end

											elseif(x>=10 and x<30) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													end
											end
									elseif(player.registry["armorer"]>60400 and player.registry["armorer"]<=135000) then
										local x=math.random(1,100)
											if(x>=86) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<86 and x>=55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=15 and x<55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											end
									elseif(player.registry["armorer"]>135000 and player.registry["armorer"]<=253000) then
										local x=math.random(1,100)
											if(x>=90) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<90 and x>=73) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("durable_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=28 and x<73) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("fortified_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end

											elseif(x>=10 and x<28) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellant_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellant_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellant_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellant_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													end
											end
									elseif(player.registry["armorer"]>253000) then
										local x=math.random(1,100)
											if(x>96) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<96 and x>=60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellant_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellant_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellant_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellant_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=15 and x<60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("rugged_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("impenetrable_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("impenetrable_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("impenetrable_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("impenetrable_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											end
										end
								--[[
										

									Put other veins than Tin here.

								
								--]]
									

								end


					elseif(choice=="Stout platemail") then
						player:dialogSeq({t,"Stout platemail:\n\nA standard warrior armor.",t,"Requires:\n\n-2 Tin bars\n-25 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",2) and player.money>=25) then
								player:removeItem(190,2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("stout_platemail",1)
						else
								player:dialogSeq({t,"You do not bring the required items with you !"})
						end



						--[[
										
							Put Recipes here

								
						--]]

					end

					if(player.registry["armorer"]>=1 and player.registry["armorer"]<25) then
						player:addLegend("Beginner armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=25 and player.registry["armorer"]<75) then
						player:addLegend("Novice armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=75 and player.registry["armorer"]<500) then
						player:addLegend("Apprentice armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=500 and player.registry["armorer"]<1600) then
						player:addLegend("Accomplished armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=1600 and player.registry["armorer"]<3800) then
						player:addLegend("Talented armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=3800 and player.registry["armorer"]<9000) then
						player:addLegend("Skilled armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=9000 and player.registry["armorer"]<24200) then
						player:addLegend("Expert armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=24200 and player.registry["armorer"]<60400) then
						player:addLegend("Master armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=60400 and player.registry["armorer"]<135000) then
						player:addLegend("Grand master armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=135000 and player.registry["armorer"]<253000) then
						player:addLegend("Champion armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=253000) then
						player:addLegend("Legendary armorer","armorer",92,128)
					end
					
			end											

	end)
}