Anvilbackup = {
	click = async(function(player,npc)
		local opts = {}
		local optsarmor = { }
		local regulararmor = { }
		local optsweapon = { }
		local regularweapon = { }
		local t={graphic=convertGraphic(828,"monster"),color=0}

                        player.npcGraphic=t.graphic
		        player.npcColor=t.color
		
			table.insert(opts,"Forge Armor")
			table.insert(opts,"Forge Weapon")
			table.insert(optsarmor,"Regular armors")
			table.insert(optsweapon,"Regular weapons")





			if(player.registry["recipestoutplatemail"]==1) then
				table.insert(optsarmor,"Stout platemail")
			end
			if(player.registry["recipestoutplatedress"]==1) then
				table.insert(optsarmor,"Stout Plate dress")
			end
			if(player.registry["recipestoutarmor"]==1) then
				table.insert(optsarmor,"Stout Armor")
			end
			if(player.registry["recipestoutarmordress"]==1) then
				table.insert(optsarmor,"Stout Armor dress")
			end
			if(player.registry["recipesturdyplatemail"]==1) then
				table.insert(optsarmor,"Sturdy Platemail")
			end
			if(player.registry["recipesturdyplatedress"]==1) then
				table.insert(optsarmor,"Sturdy Plate Dress")
			end
			if(player.registry["recipesturdyarmor"]==1) then
				table.insert(optsarmor,"Sturdy Armor")
			end
			if(player.registry["recipesturdyarmordress"]==1) then
				table.insert(optsarmor,"Sturdy Armor Dress")
			end
			if(player.registry["recipestrongarmor"]==1) then
				table.insert(optsarmor,"Strong Armor")
			end
			if(player.registry["recipestrongarmordress"]==1) then
				table.insert(optsarmor,"Strong Armor Dress")
			end
			if(player.registry["recipestrongplatedress"]==1) then
				table.insert(optsarmor,"Strong Plate Dress")
			end
			if(player.registry["recipestrongplatemail"]==1) then
				table.insert(optsarmor,"Strong Platemail")
			end
			if(player.registry["recipereinforcedplatemail"]==1) then
				table.insert(optsarmor,"Reinforced Platemail")
			end
			if(player.registry["recipereinforcedarmor"]==1) then
				table.insert(optsarmor,"Reinforced Armor")
			end
			if(player.registry["recipereinforcedarmordress"]==1) then
				table.insert(optsarmor,"Reinforced Armor Dress")
			end
			if(player.registry["recipereinforcedplatedress"]==1) then
				table.insert(optsarmor,"Reinforced Plate Dress")
			end
			if(player.registry["recipehardenedarmor"]==1) then
				table.insert(optsarmor,"Hardened Armor")
			end
			if(player.registry["recipehardenedarmordress"]==1) then
				table.insert(optsarmor,"Hardened Armor Dress")
			end
			if(player.registry["recipehardenedplatemail"]==1) then
				table.insert(optsarmor,"Hardened Platemail")
			end
			if(player.registry["recipehardenedplatedress"]==1) then
				table.insert(optsarmor,"Hardened Plate Dress")
			end
			if(player.registry["recipefortifiedplatemail"]==1) then
				table.insert(optsarmor,"Fortified Platemail")
			end
			if(player.registry["recipefortifiedarmor"]==1) then
				table.insert(optsarmor,"Fortified Armor")
			end
			if(player.registry["recipefortifiedarmordress"]==1) then
				table.insert(optsarmor,"Fortified Armor Dress")
			end
			if(player.registry["recipefortifiedplatedress"]==1) then
				table.insert(optsarmor,"Fortified Plate Dress")
			end
			if(player.registry["recipedurablearmor"]==1) then
				table.insert(optsarmor,"Durable Armor")
			end
			if(player.registry["recipedurablearmordress"]==1) then
				table.insert(optsarmor,"Durable Armor Dress")
			end
			if(player.registry["recipedurableplatemail"]==1) then
				table.insert(optsarmor,"Durable Platemail")
			end
			if(player.registry["recipedurableplatedress"]==1) then
				table.insert(optsarmor,"Durable Plate Dress")
			end










			if(player.registry["recipegoldenhelm"]==1) then
				table.insert(optsarmor,"Golden helm")
			end




















			if(player.registry["recipehavarthsaxe"]==1) then
				table.insert(optsweapon,"Havarth's axe")
			end
			if(player.registry["recipefrostbane"]==1) then
				table.insert(optsweapon,"Frostbane")
			end
			if(player.registry["recipebloodsoakedclaymore"]==1) then
				table.insert(optsweapon,"Bloodsoaked claymore")
			end
			if(player:hasItem("tin_bar",2)) then
				table.insert(regulararmor,"Tin")
				table.insert(regularweapon,"Tin")
			end

			table.insert(regulararmor,"I do not have any material")
			table.insert(regularweapon,"I do not have any material")		
			
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
									elseif(player.registry["armorer"]>75 and player.registry["armorer"]<=220) then
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
									elseif(player.registry["armorer"]>220 and player.registry["armorer"]<=840) then
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
									elseif(player.registry["armorer"]>840 and player.registry["armorer"]<=2200) then
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
									elseif(player.registry["armorer"]>2200 and player.registry["armorer"]<=6400) then
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
									elseif(player.registry["armorer"]>6400 and player.registry["armorer"]<=18000) then
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
									elseif(player.registry["armorer"]>18000 and player.registry["armorer"]<=50000) then
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
									elseif(player.registry["armorer"]>50000 and player.registry["armorer"]<=237000) then
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
									elseif(player.registry["armorer"]>237000 and player.registry["armorer"]<=400000) then
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
														player:addItem("repellent_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+(y*2)
													end
											end
									elseif(player.registry["armorer"]>400000 and player.registry["armorer"]<=680000) then
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
														player:addItem("repellent_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_splint_mail",1)
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
									elseif(player.registry["armorer"]>680000) then
										local x=math.random(1,100)
											if(x>99) then
												player:removeItem(190,2)
												player:sendAnimation(270)
												player:dialogSeq({t,"You failed at making any decent armor out of those bars."})
											elseif(x<99 and x>=60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_waistcoat",1)
											     player.registry["armorer"]=player.registry["armorer"]+y															
													elseif(y==2) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_blouse",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==3) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_splint_dress",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													elseif(y==4) then
													        player:removeItem(190,2)
														player:sendAnimation(270)
														player:addItem("repellent_splint_mail",1)
											     player.registry["armorer"]=player.registry["armorer"]+y
													end
											elseif(x>=25 and x<60) then
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

											elseif(x<25) then
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
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end

					elseif(choice=="Stout Plate dress") then
						player:dialogSeq({t,"Stout Plate dress:\n\nA standard warrior Plate dress.",t,"Requires:\n\n-2 Tin bars\n-25 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",2) and player.money>=25) then
								player:removeItem(190,2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("stout_plate_dress",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Stout Armor") then
						player:dialogSeq({t,"Stout Armor:\n\nA standard rogue Armor.",t,"Requires:\n\n-2 Tin bars\n-25 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",2) and player.money>=25) then
								player:removeItem(190,2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("stout_armor",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Stout Armor dress") then
						player:dialogSeq({t,"Stout Armor dress:\n\nA standard rogue Armor dress.",t,"Requires:\n\n-2 Tin bars\n-25 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",2) and player.money>=25) then
								player:removeItem(190,2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("stout_armor_dress",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Sturdy Platemail") then
						player:dialogSeq({t,"Sturdy Platemail:\n\nA standard warrior armor.",t,"Requires:\n\n-2 Tin bars\n-25 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",2) and player.money>=25) then
								player:removeItem("tin_bar",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("sturdy_platemail",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Sturdy Armor") then
						player:dialogSeq({t,"Sturdy Platemail:\n\nA standard rogue armor.",t,"Requires:\n\n-2 Tin bars\n-25 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",2) and player.money>=25) then
								player:removeItem("tin_bar",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("sturdy_armor",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Sturdy Plate Dress") then
						player:dialogSeq({t,"Sturdy Plate Dress:\n\nA standard female warrior armor.",t,"Requires:\n\n-2 Tin bars\n-25 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",2) and player.money>=25) then
								player:removeItem("tin_bar",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("sturdy_plate_dress",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Sturdy Armor Dress") then
						player:dialogSeq({t,"Sturdy Armor Dress:\n\nA standard female rogue armor.",t,"Requires:\n\n-2 Tin bars\n-25 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",2) and player.money>=25) then
								player:removeItem("tin_bar",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("sturdy_armor_dress",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Strong Armor") then
						player:dialogSeq({t,"Strong Armor:\n\nA standard rogue Armor.",t,"Requires:\n\n-4 Tin bars\n-35 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",4) and player.money>=35) then
								player:removeItem("tin_bar",4)
								player.money=player.money-35
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("strong_armor",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Strong Armor Dress") then
						player:dialogSeq({t,"Strong Armor Dress:\n\nA standard rogue Armor.",t,"Requires:\n\n-4 Tin bars\n-35 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",4) and player.money>=35) then
								player:removeItem("tin_bar",4)
								player.money=player.money-35
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("strong_armor_dress",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Strong Plate Dress") then
						player:dialogSeq({t,"Strong Plate Dress:\n\nA standard female warrior Armor.",t,"Requires:\n\n-4 Tin bars\n-35 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",4) and player.money>=35) then
								player:removeItem("tin_bar",4)
								player.money=player.money-35
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("strong_plate_dress",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Strong Platemail") then
						player:dialogSeq({t,"Strong Platemail:\n\nA standard warrior Armor.",t,"Requires:\n\n-4 Tin bars\n-35 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",4) and player.money>=35) then
								player:removeItem("tin_bar",4)
								player.money=player.money-35
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("strong_platemail",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Reinforced Platemail") then
						player:dialogSeq({t,"Reinforced Platemail:\n\nA standard warrior Armor.",t,"Requires:\n\n-6 Tin bars\n-50 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",6) and player.money>=50) then
								player:removeItem("tin_bar",6)
								player.money=player.money-50
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("reinforced_platemail",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Reinforced Armor") then
						player:dialogSeq({t,"Reinforced Armor:\n\nA standard rogue Armor.",t,"Requires:\n\n-6 Tin bars\n-50 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",6) and player.money>=50) then
								player:removeItem("tin_bar",6)
								player.money=player.money-50
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("reinforced_armor",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Reinforced Armor Dress") then
						player:dialogSeq({t,"Reinforced Armor Dress:\n\nA standard female rogue Armor Dress.",t,"Requires:\n\n-6 Tin bars\n-50 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",6) and player.money>=50) then
								player:removeItem("tin_bar",6)
								player.money=player.money-50
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("reinforced_armor_dress",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Reinforced Plate Dress") then
						player:dialogSeq({t,"Reinforced Plate Dress:\n\nA standard female warrior Armor.",t,"Requires:\n\n-6 Tin bars\n-50 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("tin_bar",6) and player.money>=50) then
								player:removeItem("tin_bar",6)
								player.money=player.money-50
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("reinforced_plate_dress",1)
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Hardened Armor") then
						player:dialogSeq({t,"Hardened Armor:\n\nA standard rogue Armor.",t,"Requires:\n\n-Apprentice Armorer\n-8 Tin bars\n-2 Bronze bars\n-75 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=220 and player:hasItem("tin_bar",8) and player:hasItem("bronze_bar",2) and player.money>=75) then
								player:removeItem("tin_bar",8)
								player:removeItem("bronze_bar",2)
								player.money=player.money-75
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("hardened_armor",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Hardened Armor Dress") then
						player:dialogSeq({t,"Hardened Armor Dress:\n\nA standard female rogue Armor Dress.",t,"Requires:\n\n-Apprentice Armorer\n-6 Tin bars\n-2 Bronze bars\n-75 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=220 and player:hasItem("tin_bar",8) and player:hasItem("bronze_bar",2) and player.money>=75) then
								player:removeItem("tin_bar",8)
								player:removeItem("bronze_bar",2)
								player.money=player.money-75
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("hardened_armor_dress",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Hardened Platemail") then
						player:dialogSeq({t,"Hardened Platemail:\n\nA standard warrior Platemail.",t,"Requires:\n\n-Apprentice Armorer\n-8 Tin bars\n-2 Bronze bars\n-75 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=220 and player:hasItem("tin_bar",8) and player:hasItem("bronze_bar",2) and player.money>=75) then
								player:removeItem("tin_bar",8)
								player:removeItem("bronze_bar",2)
								player.money=player.money-75
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("hardened_platemail",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Hardened Plate Dress") then
						player:dialogSeq({t,"Hardened Plate dress:\n\nA standard female warrior Plate Dress.",t,"Requires:\n\n-Apprentice Armorer\n-8 Tin bars\n-2 Bronze bars\n-75 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=220 and player:hasItem("tin_bar",8) and player:hasItem("bronze_bar",2) and player.money>=75) then
								player:removeItem("tin_bar",8)
								player:removeItem("bronze_bar",2)
								player.money=player.money-75
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("hardened_plate_dress",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Fortified Platemail") then
						player:dialogSeq({t,"Fortified Platemail:\n\nA standard warrior Platemail.",t,"Requires:\n\n-Apprentice Armorer\n-10 Tin bars\n-4 Bronze bars\n-500 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=220 and player:hasItem("tin_bar",10) and player:hasItem("bronze_bar",4) and player.money>=500) then
								player:removeItem("tin_bar",10)
								player:removeItem("bronze_bar",4)
								player.money=player.money-500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("fortified_platemail",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Fortified Armor") then
						player:dialogSeq({t,"Fortified Armor:\n\nA standard rogue Armor.",t,"Requires:\n\n-Apprentice Armorer\n-10 Tin bars\n-4 Bronze bars\n-500 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=220 and player:hasItem("tin_bar",10) and player:hasItem("bronze_bar",4) and player.money>=500) then
								player:removeItem("tin_bar",10)
								player:removeItem("bronze_bar",4)
								player.money=player.money-500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("fortified_armor",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Fortified Armor Dress") then
						player:dialogSeq({t,"Fortified Armor Dress:\n\nA standard female rogue Armor Dress.",t,"Requires:\n\n-Apprentice Armorer\n-10 Tin bars\n-4 Bronze bars\n-500 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=220 and player:hasItem("tin_bar",10) and player:hasItem("bronze_bar",4) and player.money>=500) then
								player:removeItem("tin_bar",10)
								player:removeItem("bronze_bar",4)
								player.money=player.money-500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("fortified_armor_dress",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Fortified Plate Dress") then
						player:dialogSeq({t,"Fortified Plate Dress:\n\nA standard female warrior Plate Dress.",t,"Requires:\n\n-Apprentice Armorer\n-10 Tin bars\n-4 Bronze bars\n-500 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=220 and player:hasItem("tin_bar",10) and player:hasItem("bronze_bar",4) and player.money>=500) then
								player:removeItem("tin_bar",10)
								player:removeItem("bronze_bar",4)
								player.money=player.money-500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("fortified_plate_dress",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Durable Armor") then
						player:dialogSeq({t,"Durable Armor:\n\nA standard rogue Armor.",t,"Requires:\n\n-Accomplished Armorer\n-12 Tin bars\n-6 Bronze bars\n-1000 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=640 and player:hasItem("tin_bar",12) and player:hasItem("bronze_bar",6) and player.money>=1000) then
								player:removeItem("tin_bar",12)
								player:removeItem("bronze_bar",6)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("durable_armor",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Durable Armor Dress") then
						player:dialogSeq({t,"Durable Armor Dress:\n\nA standard female rogue Armor Dress.",t,"Requires:\n\n-Accomplished Armorer\n-12 Tin bars\n-6 Bronze bars\n-1000 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=640 and player:hasItem("tin_bar",12) and player:hasItem("bronze_bar",6) and player.money>=1000) then
								player:removeItem("tin_bar",12)
								player:removeItem("bronze_bar",6)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("durable_armor_dress",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Durable Platemail") then
						player:dialogSeq({t,"Durable Platemail:\n\nA standard warrior Platemail.",t,"Requires:\n\n-Accomplished Armorer\n-12 Tin bars\n-6 Bronze bars\n-1000 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=640 and player:hasItem("tin_bar",12) and player:hasItem("bronze_bar",6) and player.money>=1000) then
								player:removeItem("tin_bar",12)
								player:removeItem("bronze_bar",6)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("durable_platemail",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end

					elseif(choice=="Durable Plate Dress") then
						player:dialogSeq({t,"Durable Plate Dress:\n\nA standard female warrior Plate Dress.",t,"Requires:\n\n-Accomplished Armorer\n-12 Tin bars\n-6 Bronze bars\n-1000 coins\n\nto be forged.",t,"Click next if you want to proceed."},1)
						if(player.registry["armorer"]>=640 and player:hasItem("tin_bar",12) and player:hasItem("bronze_bar",6) and player.money>=1000) then
								player:removeItem("tin_bar",12)
								player:removeItem("bronze_bar",6)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("durable_plate_dress",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
















					elseif(choice=="Golden helm" and player.registry["recipegoldenhelm"]==1) then
						player:dialogSeq({t,"Golden helm:\n\nA magical helm.",t,"Requires:\n\n-Accomplished Armorer\n-40 Tin bars\n-5 Tiger's eye\n-1 Burning rum\n-1000 coins\n\nto be forged."},1)
						if(player:hasItem("tin_bar",40) and player:hasItem("tigers_eye",5) and player:hasItem("burning_rum",1) and player.money>=1000 and player.registry["armorer"]>=840) then
								player:removeItem("tin_bar",40)
								player:removeItem("tigers_eye",5)
								player:removeItem("burning_rum",1)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["armorer"]=player.registry["armorer"]+(r*2)
								player:addItem("golden_helm",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end









						--[[
										
							Put Recipes here

								
						--]]

					end

					if(player.registry["armorer"]>=1 and player.registry["armorer"]<25) then
						player:addLegend("Beginner armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=25 and player.registry["armorer"]<220) then
						player:addLegend("Novice armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=220 and player.registry["armorer"]<840) then
						player:addLegend("Apprentice armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=840 and player.registry["armorer"]<2200) then
						player:addLegend("Accomplished armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=2200 and player.registry["armorer"]<6400) then
						player:addLegend("Adept armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=6400 and player.registry["armorer"]<18000) then
						player:addLegend("Talented armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=18000 and player.registry["armorer"]<50000) then
						player:addLegend("Skilled armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=50000 and player.registry["armorer"]<124000) then
						player:addLegend("Expert armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=124000 and player.registry["armorer"]<237000) then
						player:addLegend("Master armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=237000 and player.registry["armorer"]<400000) then
						player:addLegend("Grand master armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=400000 and player.registry["armorer"]<680000) then
						player:addLegend("Champion armorer","armorer",92,128)
					end
					if(player.registry["armorer"]>=680000) then
						player:addLegend("Legendary armorer","armorer",92,128)
					end


			elseif(menuOption=="Forge Weapon") then
				local choice=player:menuString2("what Weapon do you wish to forge?",optsweapon)
				
					if(choice=="Regular weapons") then
							local armor=player:menuString2("which metal do you wish to use?",regularweapon)
								if(armor=="Tin") then
									if(player.registry["weaponsmith"]<75) then
										local x=math.random(1,100)
										if(x<=50) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>50 and x<=70) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("warriors_longsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1
										elseif(x>70 and x<=90) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("rogues_shortsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2
										elseif(x>90 and x<=95) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3
										elseif(x>95 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("bastard_sword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+4
										end
									elseif(player.registry["weaponsmith"]>=75 and player.registry["weaponsmith"]<220) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=45) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>45 and x<=65) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("warriors_longsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>65 and x<=85) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("rogues_shortsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>85 and x<=95) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+y
										elseif(x>95 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("bastard_sword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+4+y
										end
									elseif(player.registry["weaponsmith"]>=220 and player.registry["weaponsmith"]<840) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=40) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>40 and x<=75) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("rogues_shortsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>75 and x<=90) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>90 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("bastard_sword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+(y*2)
										end
									elseif(player.registry["weaponsmith"]>=840 and player.registry["weaponsmith"]<2200) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=35) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>35 and x<=50) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("rogues_shortsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>50 and x<=65) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>65 and x<=85) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("bastard_sword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+y
										elseif(x>85 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("gladius",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+4+y
										end
									elseif(player.registry["weaponsmith"]>=2200 and player.registry["weaponsmith"]<6400) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=30) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>30 and x<=60) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>60 and x<=85) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("bastard_sword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>85 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("gladius",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+(y*2)
										end
									elseif(player.registry["weaponsmith"]>=6400 and player.registry["weaponsmith"]<18000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=25) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>25 and x<=40) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>40 and x<=65) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("bastard_sword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>65 and x<=85) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("gladius",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+y
										elseif(x>85 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("dirk",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+4+y
										end
									elseif(player.registry["weaponsmith"]>=18000 and player.registry["weaponsmith"]<50000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=20) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>20 and x<=50) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("bastard_sword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>50 and x<=80) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("gladius",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>80 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("dirk",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+(y*2)
										end
									elseif(player.registry["weaponsmith"]>=50000 and player.registry["weaponsmith"]<124000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=15) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>15 and x<=30) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("bastard_sword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>30 and x<=60) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("gladius",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>60 and x<=85) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("dirk",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+y
										elseif(x>85 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("heavy_broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+4+y
										end
									elseif(player.registry["weaponsmith"]>=124000 and player.registry["weaponsmith"]<237000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=10) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>10 and x<=40) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("gladius",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>40 and x<=80) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("dirk",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>80 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("heavy_broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+(y*2)
										end
									elseif(player.registry["weaponsmith"]>=237000 and player.registry["weaponsmith"]<400000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=5) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>5 and x<=30) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("gladius",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>30 and x<=60) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("dirk",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>60 and x<=85) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("heavy_broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+y
										elseif(x>80 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("claymore",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+4+y
										end
									elseif(player.registry["weaponsmith"]>=400000 and player.registry["weaponsmith"]<680000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=5) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>5 and x<=30) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("gladius",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>30 and x<=60) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("dirk",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>60 and x<=80) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("heavy_broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+y
										elseif(x>80 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("claymore",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+4+y
										end
									elseif(player.registry["weaponsmith"]>=680000) then
										local x=math.random(1,100)
										local y=math.random(1,4)
										if(x<=1) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:dialogSeq({t,"You failed at making any decent weapon out of those bars."})
										elseif(x>1 and x<=25) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("gladius",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+1+y
										elseif(x>25 and x<=50) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("dirk",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+2+y
										elseif(x>50 and x<=75) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("heavy_broadsword",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+3+y
										elseif(x>75 and x<=100) then
											player:removeItem(190,2)
											player:sendAnimation(270)
											player:addItem("claymore",1)
											player.registry["weaponsmith"]=player.registry["weaponsmith"]+4+y
										end

									end

								--[[
										

									Put other veins than Tin here.

								
								--]]
									

								end

					elseif(choice=="Havarth's axe") then
						player:dialogSeq({t,"Havarth's axe:\n\nReforge Havarth's axe from it's remains.",t,"Requires:\n\n-2 Tin bars\n-Havarth's broken axe\n-5 Amethyst\n-70 coins\n\nto be forged.",t,"Click next to proceed."},1)
						if(player:hasItem("amethyst",5) and player:hasItem("havarths_broken_axe",1) and player:hasItem("tin_bar",2) and player.money>70) then
							player:removeItem("havarths_broken_axe",1)
							player:removeItem("amethyst",5)
							player:removeItem("tin_bar",2)
							player.money=player.money-70
							local r=math.random(1,2)
								player.registry["weaponsmith"]=player.registry["weaponsmith"]+(r*2)
								player:addItem("havarths_axe",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Frostbane") then
						player:dialogSeq({t,"Frostbane:\n\nA Blade infused with cold.",t,"Requires:\n\n-Accomplished Bladesmith\n-10 Tin bars\n-2 Chrysocolla\n-1 Tiger's eye\n-1 Frozen heart\n-500 coins\n\nto be forged.",t,"Click next to proceed"},1)
						if(player.registry["weaponsmith"]>640 and player:hasItem("chrysocolla",2) and player:hasItem("tigers_eye",1) and player:hasItem("tin_bar",10) and player:hasItem("frozen_heart",1) and player.money>500) then
							player:removeItem("chrysocolla",2)
							player:removeItem("tigers_eye",1)
							player:removeItem("frozen_heart",1)
							player:removeItem("tin_bar",10)
							player.money=player.money-500
							local r=math.random(1,2)
								player.registry["weaponsmith"]=player.registry["weaponsmith"]+(r*2)
								player:addItem("frostbane",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Bloodsoaked claymore") then
						player:dialogSeq({t,"Bloodsoaked claymore:\n\nA Claymore soaked in blood.",t,"Requires:\n\n-Apprentice Bladesmith\n-5 Tin bars\n-1 Chrysocolla\n-250 coins\n\nto be forged.",t,"Click next to proceed"},1)
						if(player.registry["weaponsmith"]>220 and player:hasItem("chrysocolla",1) and player:hasItem("tin_bar",5) and player.money>=250) then
							player:removeItem("chrysocolla",1)
							player:removeItem("tin_bar",5)
							player.money=player.money-250
							local r=math.random(1,2)
								player.registry["weaponsmith"]=player.registry["weaponsmith"]+(r*2)
								player:addItem("bloodsoaked_claymore",1)
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end	
	

						--[[
										
							Put Recipes here

								
						--]]

					end

					if(player.registry["weaponsmith"]>=1 and player.registry["weaponsmith"]<25) then
						player:addLegend("Beginner bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=25 and player.registry["weaponsmith"]<220) then
						player:addLegend("Novice bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=220 and player.registry["weaponsmith"]<640) then
						player:addLegend("Apprentice bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=640 and player.registry["weaponsmith"]<2200) then
						player:addLegend("Accomplished bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=2200 and player.registry["weaponsmith"]<6400) then
						player:addLegend("Adept bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=6400 and player.registry["weaponsmith"]<18000) then
						player:addLegend("Talented bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=18000 and player.registry["weaponsmith"]<50000) then
						player:addLegend("Skilled bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=50000 and player.registry["weaponsmith"]<124000) then
						player:addLegend("Expert bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=124000 and player.registry["weaponsmith"]<237000) then
						player:addLegend("Master bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=237000 and player.registry["weaponsmith"]<400000) then
						player:addLegend("Grand master bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=400000 and player.registry["weaponsmith"]<680000) then
						player:addLegend("Champion bladesmith","weaponsmith",71,128)
					end
					if(player.registry["weaponsmith"]>=680000) then
						player:addLegend("Legendary bladesmith","weaponsmith",71,128)
					end



					
			end											

	end)
}