tailoring_table = {
	click = async(function(player,npc)
		local opts = {}
		local optsarmor = { }
		local regulararmor = { }
		local t={graphic=convertGraphic(744,"monster"),color=0}

                player.npcGraphic=t.graphic
		player.npcColor=t.color


		if(player.registry["tailoractive"]==0) then
			player:dialogSeq({t,"You are currently not a Tailor."})
			return
		end
		
			table.insert(opts,"Tailor an Armor")
			table.insert(optsarmor,"Regular armors")
			if(player.registry["recipestoutskirt"]==1) then
				table.insert(optsarmor,"Stout Skirt")
			end
			if(player.registry["recipestoutclothes"]==1) then
				table.insert(optsarmor,"Stout Clothes")
			end
			if(player.registry["recipestoutdrapery"]==1) then
				table.insert(optsarmor,"Stout Drapery")
			end
			if(player.registry["recipestoutmantle"]==1) then
				table.insert(optsarmor,"Stout Mantle")
			end
			if(player.registry["recipesturdyclothes"]==1) then
				table.insert(optsarmor,"Sturdy Clothes")
			end
			if(player.registry["recipesturdydrapery"]==1) then
				table.insert(optsarmor,"Sturdy Drapery")
			end
			if(player.registry["recipesturdymantle"]==1) then
				table.insert(optsarmor,"Sturdy Mantle")
			end
			if(player.registry["recipesturdyskirt"]==1) then
				table.insert(optsarmor,"Sturdy Skirt")
			end
			if(player.registry["recipestrongclothes"]==1) then
				table.insert(optsarmor,"Strong Clothes")
			end
			if(player.registry["recipestrongskirt"]==1) then
				table.insert(optsarmor,"Strong Skirt")
			end
			if(player.registry["recipestrongdrapery"]==1) then
				table.insert(optsarmor,"Strong Drapery")
			end
			if(player.registry["recipestrongmantle"]==1) then
				table.insert(optsarmor,"Strong Mantle")
			end
			if(player.registry["recipereinforcedclothes"]==1) then
				table.insert(optsarmor,"Reinforced Clothes")
			end
			if(player.registry["recipereinforceddrapery"]==1) then
				table.insert(optsarmor,"Reinforced Drapery")
			end
			if(player.registry["recipereinforcedmantle"]==1) then
				table.insert(optsarmor,"Reinforced Mantle")
			end
			if(player.registry["recipereinforcedskirt"]==1) then
				table.insert(optsarmor,"Reinforced Skirt")
			end
			if(player.registry["recipehardenedclothes"]==1) then
				table.insert(optsarmor,"Hardened Clothes")
			end
			if(player.registry["recipehardeneddrapery"]==1) then
				table.insert(optsarmor,"Hardened Drapery")
			end
			if(player.registry["recipehardenedskirt"]==1) then
				table.insert(optsarmor,"Hardened Skirt")
			end
			if(player.registry["recipehardenedmantle"]==1) then
				table.insert(optsarmor,"Hardened Mantle")
			end
			if(player.registry["recipefortifiedclothes"]==1) then
				table.insert(optsarmor,"Fortified Clothes")
			end
			if(player.registry["recipefortifieddrapery"]==1) then
				table.insert(optsarmor,"Fortified Drapery")
			end
			if(player.registry["recipefortifiedmantle"]==1) then
				table.insert(optsarmor,"Fortified Mantle")
			end
			if(player.registry["recipefortifiedskirt"]==1) then
				table.insert(optsarmor,"Fortified Skirt")
			end
			if(player.registry["recipedurableclothes"]==1) then
				table.insert(optsarmor,"Durable Clothes")
			end
			if(player.registry["recipedurableskirt"]==1) then
				table.insert(optsarmor,"Durable Skirt")
			end
			if(player.registry["recipedurablemantle"]==1) then
				table.insert(optsarmor,"Durable Mantle")
			end
			if(player.registry["recipedurabledrapery"]==1) then
				table.insert(optsarmor,"Durable Drapery")
			end
			if(player.registry["reciperuggedclothes"]==1) then
				table.insert(optsarmor,"Rugged Clothes")
			end
			if(player.registry["reciperuggedskirt"]==1) then
				table.insert(optsarmor,"Rugged Skirt")
			end
			if(player.registry["reciperuggedmantle"]==1) then
				table.insert(optsarmor,"Rugged Mantle")
			end
			if(player.registry["reciperuggeddrapery"]==1) then
				table.insert(optsarmor,"Rugged Drapery")
			end
			if(player.registry["reciperepellentclothes"]==1) then
				table.insert(optsarmor,"Repellent Clothes")
			end
			if(player.registry["reciperepellentskirt"]==1) then
				table.insert(optsarmor,"Repellent Skirt")
			end
			if(player.registry["reciperepellentmantle"]==1) then
				table.insert(optsarmor,"Repellent Mantle")
			end
			if(player.registry["reciperepellentdrapery"]==1) then
				table.insert(optsarmor,"Repellent Drapery")
			end
			if(player.registry["recipeimpenetrableclothes"]==1) then
				table.insert(optsarmor,"Impenetrable Clothes")
			end
			if(player.registry["recipeimpenetrableskirt"]==1) then
				table.insert(optsarmor,"Impenetrable Skirt")
			end
			if(player.registry["recipeimpenetrablemantle"]==1) then
				table.insert(optsarmor,"Impenetrable Mantle")
			end
			if(player.registry["recipeimpenetrabledrapery"]==1) then
				table.insert(optsarmor,"Impenetrable Drapery")
			end
			if(player.registry["recipedarkdrapery"]==1) then
				table.insert(optsarmor,"Dark Drapery")
			end
			if(player.registry["recipedarkmantle"]==1) then
				table.insert(optsarmor,"Dark Mantle")
			end
			if(player.registry["recipedarkclothes"]==1) then
				table.insert(optsarmor,"Dark Clothes")
			end
			if(player.registry["recipedarkskirt"]==1) then
				table.insert(optsarmor,"Dark Skirt")
			end
			if(player.registry["reciperunicrobes"]==1) then
				table.insert(optsarmor,"Runic robes")
			end
			if(player.registry["reciperunicgown"]==1) then
				table.insert(optsarmor,"Runic gown")
			end


			if(player:hasItem("wool_fabric",2) == true) then
				table.insert(regulararmor,"Wool fabric")
			end
			if(player:hasItem("perendale_fabric",2) == true) then
				table.insert(regulararmor,"Perendale fabric")
			end
			if(player:hasItem("merino_fabric",2) == true) then
				table.insert(regulararmor,"Merino fabric")
			end

			table.insert(regulararmor,"I do not have any material")		
			
			local menuOption=player:menuString2("Hello, "..player.name..", How can I help you?",opts)
			if(menuOption=="Tailor an Armor") then
				local choice=player:menuString2("what Armor do you wish to tailor?",optsarmor)
				
					if(choice=="Regular armors") then
							local armor=player:menuString2("which fabric do you wish to use?",regulararmor)
								if(armor=="Wool fabric" and player:hasItem("wool_fabric",2) == true) then
									player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
									player:sendStatus()
									if(player.registry["tailor"]<=220) then
										local x=math.random(1,100)
											if(x>=50) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<50 and x>=35) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x<35) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("stout_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+1															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("stout_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+1
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("stout_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+2
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("stout_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+2
													end
											end
									elseif(player.registry["tailor"]>220 and player.registry["tailor"]<=840) then
										local x=math.random(1,100)
											if(x>=60) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<60 and x>=40) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=10 and x<40) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("stout_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+1															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("stout_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+1
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("stout_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+2
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("stout_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+2
													end

											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("strong_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("strong_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("strong_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("strong_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											end
									elseif(player.registry["tailor"]>840 and player.registry["tailor"]<=2200) then
										local x=math.random(1,100)
											if(x>=70) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<70 and x>=55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("strong_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("strong_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("strong_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("strong_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=30 and x<55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("sturdy_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end

											elseif(x>=10 and x<30) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											end
									elseif(player.registry["tailor"]>2200 and player.registry["tailor"]<=6400) then
										local x=math.random(1,100)
											if(x>=75) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<75 and x>=50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=15 and x<50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											end
									elseif(player.registry["tailor"]>6400 and player.registry["tailor"]<=18000) then
										local x=math.random(1,100)
											if(x>=78) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<78 and x>=55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=25 and x<55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("reinforced_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end

											elseif(x>=10 and x<25) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											end
									elseif(player.registry["tailor"]>18000 and player.registry["tailor"]<=50000) then
										local x=math.random(1,100)
											if(x>=81) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<81 and x>=50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=15 and x<50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											end
									elseif(player.registry["tailor"]>50000 and player.registry["tailor"]<=124000) then
										local x=math.random(1,100)
											if(x>=84) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<84 and x>=65) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=30 and x<65) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end

											elseif(x>=10 and x<30) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											end
									elseif(player.registry["tailor"]>124000 and player.registry["tailor"]<=237000) then
										local x=math.random(1,100)
											if(x>=86) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<86 and x>=55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=15 and x<55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											end
									elseif(player.registry["tailor"]>237000 and player.registry["tailor"]<=400000) then
										local x=math.random(1,100)
											if(x>=90) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<90 and x>=73) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=28 and x<73) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end

											elseif(x>=10 and x<28) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											end
									elseif(player.registry["tailor"]>400000 and player.registry["tailor"]<=680000) then
										local x=math.random(1,100)
											if(x>96) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<96 and x>=60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=15 and x<60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("impenetrable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("impenetrable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("impenetrable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("impenetrable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											end
									elseif(player.registry["tailor"]>680000) then
										local x=math.random(1,100)
											if(x>99) then
												player:removeItem(243,2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<99 and x>=60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("repellent_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											elseif(x>=20 and x<60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+y															
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end

											elseif(x<20) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("impenetrable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)														
													elseif(y==2) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("impenetrable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("impenetrable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													elseif(y==4) then
													        player:removeItem(243,2)
														player:sendAnimation(271)
														player:addItem("impenetrable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+y
													end
											end
										end

















								elseif(armor=="Perendale fabric" and player:hasItem("perendale_fabric",2) == true) then
									if(player.registry["tailor"]>=2200) then
									player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
									player:sendStatus()
									end
									if(player.registry["tailor"]<2200) then
										player:dialogSeq({t,"You are not experienced enough to work on Perendale fabric."})
										return
									end
									if(player.registry["tailor"]>=2200 and player.registry["tailor"]<=6400) then
										local x=math.random(1,100)
											if(x>=75) then
												player:removeItem("perendale_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<75 and x>=50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x>=15 and x<50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("reinforced_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("reinforced_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("reinforced_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("reinforced_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)														
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											end
									elseif(player.registry["tailor"]>6400 and player.registry["tailor"]<=18000) then
										local x=math.random(1,100)
											if(x>=78) then
												player:removeItem("perendale_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<78 and x>=55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x>=25 and x<55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("reinforced_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("reinforced_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("reinforced_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("reinforced_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end

											elseif(x>=10 and x<25) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)														
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											end
									elseif(player.registry["tailor"]>18000 and player.registry["tailor"]<=50000) then
										local x=math.random(1,100)
											if(x>=81) then
												player:removeItem("perendale_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<81 and x>=50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x>=15 and x<50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)														
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											end
									elseif(player.registry["tailor"]>50000 and player.registry["tailor"]<=124000) then
										local x=math.random(1,100)
											if(x>=84) then
												player:removeItem("perendale_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<84 and x>=65) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x>=30 and x<65) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end

											elseif(x>=10 and x<30) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)														
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											end
									elseif(player.registry["tailor"]>124000 and player.registry["tailor"]<=237000) then
										local x=math.random(1,100)
											if(x>=86) then
												player:removeItem("perendale_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<86 and x>=55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x>=15 and x<55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)														
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											end
									elseif(player.registry["tailor"]>237000 and player.registry["tailor"]<=400000) then
										local x=math.random(1,100)
											if(x>=90) then
												player:removeItem("perendale_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<90 and x>=73) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x>=28 and x<73) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end

											elseif(x>=10 and x<28) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)														
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											end
									elseif(player.registry["tailor"]>400000 and player.registry["tailor"]<=680000) then
										local x=math.random(1,100)
											if(x>96) then
												player:removeItem("perendale_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<96 and x>=60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x>=15 and x<60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)														
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											end
									elseif(player.registry["tailor"]>680000) then
										local x=math.random(1,100)
											if(x>99) then
												player:removeItem("perendale_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<99 and x>=60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											elseif(x>=20 and x<60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)															
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end

											elseif(x<20) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)														
													elseif(y==2) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													elseif(y==4) then
													        player:removeItem("perendale_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*2)
													end
											end
										end


























								elseif(armor=="Merino fabric" and player:hasItem("merino_fabric",2) == true) then
									if(player.registry["tailor"]>=18000) then
										player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
										player:sendStatus()
									end
									if(player.registry["tailor"]<18000) then
										player:dialogSeq({t,"You are not experienced enough to work on Merino fabric."})
										return
									end
									if(player.registry["tailor"]>=18000 and player.registry["tailor"]<=50000) then
										local x=math.random(1,100)
											if(x>=81) then
												player:removeItem("merino_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<81 and x>=50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											elseif(x>=15 and x<50) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)														
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											end
									elseif(player.registry["tailor"]>50000 and player.registry["tailor"]<=124000) then
										local x=math.random(1,100)
											if(x>=84) then
												player:removeItem("merino_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<84 and x>=65) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											elseif(x>=30 and x<65) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("hardened_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end

											elseif(x>=10 and x<30) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)														
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													end
											end
									elseif(player.registry["tailor"]>124000 and player.registry["tailor"]<=237000) then
										local x=math.random(1,100)
											if(x>=86) then
												player:removeItem("merino_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<86 and x>=55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											elseif(x>=15 and x<55) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)														
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											end
									elseif(player.registry["tailor"]>237000 and player.registry["tailor"]<=400000) then
										local x=math.random(1,100)
											if(x>=90) then
												player:removeItem("merino_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<90 and x>=73) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("durable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											elseif(x>=28 and x<73) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("fortified_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end

											elseif(x>=10 and x<28) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											elseif(x<10) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)														
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													end
											end
									elseif(player.registry["tailor"]>400000 and player.registry["tailor"]<=680000) then
										local x=math.random(1,100)
											if(x>96) then
												player:removeItem("merino_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<96 and x>=60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											elseif(x>=15 and x<60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end

											elseif(x<15) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)														
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											end
									elseif(player.registry["tailor"]>680000) then
										local x=math.random(1,100)
											if(x>99) then
												player:removeItem("merino_fabric",2)
												player:sendAnimation(271)
												player:dialogSeq({t,"You failed at making any decent armor out of this fabric."})
											elseif(x<99 and x>=60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("repellent_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											elseif(x>=20 and x<60) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)															
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("rugged_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end

											elseif(x<20) then
												local y=math.random(1,4)
													if(y==1) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_robe",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)														
													elseif(y==2) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_gown",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*4)
													elseif(y==3) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_dress",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													elseif(y==4) then
													        player:removeItem("merino_fabric",2)
														player:sendAnimation(271)
														player:addItem("impenetrable_garb",1)
											     player.registry["tailor"]=player.registry["tailor"]+(y*3)
													end
											end
										end





























								--[[
										

									Put other than wool here.

								
								--]]
									

								end

					elseif(choice=="Stout Skirt") then
						player:dialogSeq({t,"Stout Skirt:\n\nA standard mage Skirt.",t,"Requires:\n\n-2 Wool fabric\n-25 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",2) == true and player.money>=25) then
								player:removeItem("wool_fabric",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("stout_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Stout Clothes") then
						player:dialogSeq({t,"Stout Clothes:\n\nStandard mage Clothes.",t,"Requires:\n\n-2 Wool fabric\n-25 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",2) == true and player.money>=25) then
								player:removeItem("wool_fabric",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("stout_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Stout Drapery") then
						player:dialogSeq({t,"Stout Drapery:\n\nA standard poet Drapery.",t,"Requires:\n\n-2 Wool fabric\n-25 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",2) == true and player.money>=25) then
								player:removeItem("wool_fabric",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("stout_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Stout Mantle") then
						player:dialogSeq({t,"Stout Mantle:\n\nA standard poet Mantle.",t,"Requires:\n\n-2 Wool fabric\n-25 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",2) == true and player.money>=25) then
								player:removeItem("wool_fabric",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("stout_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Sturdy Clothes") then
						player:dialogSeq({t,"Sturdy Clothes:\n\nA standard mage armor.",t,"Requires:\n\n-2 Wool fabric\n-25 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",2) == true and player.money>=25) then
								player:removeItem("wool_fabric",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("sturdy_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Sturdy Drapery") then
						player:dialogSeq({t,"Sturdy drapery:\n\nA standard poet drapery.",t,"Requires:\n\n-2 Wool fabric\n-25 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",2) == true and player.money>=25) then
								player:removeItem("wool_fabric",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("sturdy_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Sturdy Mantle") then
						player:dialogSeq({t,"Sturdy Mantle:\n\nA standard poet mantle.",t,"Requires:\n\n-2 Wool fabric\n-25 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",2) == true and player.money>=25) then
								player:removeItem("wool_fabric",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("sturdy_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Sturdy Skirt") then
						player:dialogSeq({t,"Sturdy Skirt:\n\nA standard female mage armor.",t,"Requires:\n\n-2 Wool fabric\n-25 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",2) == true and player.money>=25) then
								player:removeItem("wool_fabric",2)
								player.money=player.money-25
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("sturdy_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Strong Clothes") then
						player:dialogSeq({t,"Strong Clothes:\n\nA standard mage armor.",t,"Requires:\n\n-4 Wool fabric\n-35 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",4) == true and player.money>=35) then
								player:removeItem("wool_fabric",4)
								player.money=player.money-35
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("strong_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Strong Skirt") then
						player:dialogSeq({t,"Strong Skirt:\n\nA standard female mage armor.",t,"Requires:\n\n-4 Wool fabric\n-35 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",4) == true and player.money>=35) then
								player:removeItem("wool_fabric",4)
								player.money=player.money-35
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("strong_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Strong Drapery") then
						player:dialogSeq({t,"Strong drapery:\n\nA standard poet drapery.",t,"Requires:\n\n-4 Wool fabric\n-35 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",4) == true and player.money>=35) then
								player:removeItem("wool_fabric",4)
								player.money=player.money-35
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("strong_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Strong Mantle") then
						player:dialogSeq({t,"Strong Mantle:\n\nA standard poet mantle.",t,"Requires:\n\n-4 Wool fabric\n-35 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",4) == true and player.money>=35) then
								player:removeItem("wool_fabric",4)
								player.money=player.money-35
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("strong_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Reinforced Clothes") then
						player:dialogSeq({t,"Reinforced Clothes:\n\nA standard mage armor.",t,"Requires:\n\n-6 Wool fabric\n-50 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",6) == true and player.money>=50) then
								player:removeItem("wool_fabric",6)
								player.money=player.money-50
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("reinforced_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Reinforced Drapery") then
						player:dialogSeq({t,"Reinforced drapery:\n\nA standard poet drapery.",t,"Requires:\n\n-6 Wool fabric\n-50 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",6) == true and player.money>=50) then
								player:removeItem("wool_fabric",6)
								player.money=player.money-50
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("reinforced_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Reinforced Mantle") then
						player:dialogSeq({t,"Reinforced Mantle:\n\nA standard poet mantle.",t,"Requires:\n\n-6 Wool fabric\n-50 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",6) == true and player.money>=50) then
								player:removeItem("wool_fabric",6)
								player.money=player.money-50
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("reinforced_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Reinforced Skirt") then
						player:dialogSeq({t,"Reinforced Skirt:\n\nA standard female mage armor.",t,"Requires:\n\n-6 Wool fabric\n-50 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player:hasItem("wool_fabric",6) == true and player.money>=50) then
								player:removeItem("wool_fabric",6)
								player.money=player.money-50
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("reinforced_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You did not bring the required items with you !"})
						end
					elseif(choice=="Hardened Clothes") then
						player:dialogSeq({t,"Hardened Clothes:\n\nA standard mage armor.",t,"Requires:\n\n-Apprentice tailor\n-8 Wool fabric\n-2 Romney fabric\n-75 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=220 and player:hasItem("wool_fabric",8) == true and player:hasItem("romney_fabric",2) == true and player.money>=75) then
								player:removeItem("wool_fabric",8)
								player:removeItem("romney_fabric",2)
								player.money=player.money-75
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("hardened_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Hardened Drapery") then
						player:dialogSeq({t,"Hardened Drapery:\n\nA standard female poet Drapery.",t,"Requires:\n\n-Apprentice tailor\n-8 Wool fabric\n-2 Romney fabric\n-75 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=220 and player:hasItem("wool_fabric",8) == true and player:hasItem("romney_fabric",2) == true and player.money>=75) then
								player:removeItem("wool_fabric",8)
								player:removeItem("romney_fabric",2)
								player.money=player.money-75
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("hardened_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Hardened Skirt") then
						player:dialogSeq({t,"Hardened Skirt:\n\nA standard female mage Skirt.",t,"Requires:\n\n-Apprentice tailor\n-8 Wool fabric\n-2 Romney fabric\n-75 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=220 and player:hasItem("wool_fabric",8) == true and player:hasItem("romney_fabric",2) == true and player.money>=75) then
								player:removeItem("wool_fabric",8)
								player:removeItem("romney_fabric",2)
								player.money=player.money-75
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("hardened_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Hardened Mantle") then
						player:dialogSeq({t,"Hardened Mantle:\n\nA standard poet Mantle.",t,"Requires:\n\n-Apprentice tailor\n-8 Wool fabric\n-2 Romney fabric\n-75 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=220 and player:hasItem("wool_fabric",8) == true and player:hasItem("romney_fabric",2) == true and player.money>=75) then
								player:removeItem("wool_fabric",8)
								player:removeItem("romney_fabric",2)
								player.money=player.money-75
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("hardened_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Fortified Clothes") then
						player:dialogSeq({t,"Fortified Clothes:\n\nA standard mage armor.",t,"Requires:\n\n-Apprentice tailor\n-10 Wool fabric\n-4 Romney fabric\n-500 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=220 and player:hasItem("wool_fabric",10) == true and player:hasItem("romney_fabric",4) == true and player.money>=500) then
								player:removeItem("wool_fabric",10)
								player:removeItem("romney_fabric",4)
								player.money=player.money-500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("fortified_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end

					elseif(choice=="Fortified Drapery") then
						player:dialogSeq({t,"Fortified Drapery:\n\nA standard female poet Drapery.",t,"Requires:\n\n-Apprentice tailor\n-10 Wool fabric\n-4 Romney fabric\n-500 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=220 and player:hasItem("wool_fabric",10) == true and player:hasItem("romney_fabric",4) == true and player.money>=500) then
								player:removeItem("wool_fabric",10)
								player:removeItem("romney_fabric",4)
								player.money=player.money-500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("fortified_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Fortified Mantle") then
						player:dialogSeq({t,"Fortified Mantle:\n\nA standard poet Mantle.",t,"Requires:\n\n-Apprentice tailor\n-10 Wool fabric\n-4 Romney fabric\n-500 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=220 and player:hasItem("wool_fabric",10) == true and player:hasItem("romney_fabric",4) == true and player.money>=500) then
								player:removeItem("wool_fabric",10)
								player:removeItem("romney_fabric",4)
								player.money=player.money-500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("fortified_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Fortified Skirt") then
						player:dialogSeq({t,"Fortified Skirt:\n\nA standard female mage Skirt.",t,"Requires:\n\n-Apprentice tailor\n-10 Wool fabric\n-4 Romney fabric\n-500 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=220 and player:hasItem("wool_fabric",10) == true and player:hasItem("romney_fabric",4) == true and player.money>=500) then
								player:removeItem("wool_fabric",10)
								player:removeItem("romney_fabric",4)
								player.money=player.money-500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("fortified_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Durable Clothes") then
						player:dialogSeq({t,"Durable Clothes:\n\nA standard mage armor.",t,"Requires:\n\n-Accomplished tailor\n-12 Wool fabric\n-6 Romney fabric\n-1000 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=840 and player:hasItem("wool_fabric",12) == true and player:hasItem("romney_fabric",6) == true and player.money>=1000) then
								player:removeItem("wool_fabric",12)
								player:removeItem("romney_fabric",6)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("durable_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Durable Skirt") then
						player:dialogSeq({t,"Durable Skirt:\n\nA standard female mage Skirt.",t,"Requires:\n\n-Accomplished tailor\n-12 Wool fabric\n-6 Romney fabric\n-1000 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=840 and player:hasItem("wool_fabric",12) == true and player:hasItem("romney_fabric",6) == true and player.money>=1000) then
								player:removeItem("wool_fabric",12)
								player:removeItem("romney_fabric",6)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("durable_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Durable Mantle") then
						player:dialogSeq({t,"Durable Mantle:\n\nA standard poet Mantle.",t,"Requires:\n\n-Accomplished tailor\n-12 Wool fabric\n-6 Romney fabric\n-1000 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=840 and player:hasItem("wool_fabric",12) == true and player:hasItem("romney_fabric",6) == true and player.money>=1000) then
								player:removeItem("wool_fabric",12)
								player:removeItem("romney_fabric",6)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("durable_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Durable Drapery") then
						player:dialogSeq({t,"Durable Drapery:\n\nA standard female poet Drapery.",t,"Requires:\n\n-Accomplished tailor\n-12 Wool fabric\n-6 Romney fabric\n-1000 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=840 and player:hasItem("wool_fabric",12) == true and player:hasItem("romney_fabric",6) == true and player.money>=1000) then
								player:removeItem("wool_fabric",12)
								player:removeItem("romney_fabric",6)
								player.money=player.money-1000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("durable_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Rugged Clothes") then
						player:dialogSeq({t,"Rugged Clothes:\n\nStandard mage clothes.",t,"Requires:\n\n-Adept tailor\n-10 Perendale fabric\n-1 Shetland fabric\n-1200 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=2200 and player:hasItem("perendale_fabric",10) == true and player:hasItem("shetland_fabric",1) == true and player.money>=1200) then
								player:removeItem("perendale_fabric",10)
								player:removeItem("shetland_fabric",1)
								player.money=player.money-1200
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("rugged_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Rugged Skirt") then
						player:dialogSeq({t,"Rugged Skirt:\n\nA standard female mage Skirt.",t,"Requires:\n\n-Adept tailor\n-10 Perendale fabric\n-1 Shetland fabric\n-1200 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=2200 and player:hasItem("perendale_fabric",10) == true and player:hasItem("shetland_fabric",1) == true and player.money>=1200) then
								player:removeItem("perendale_fabric",10)
								player:removeItem("shetland_fabric",1)
								player.money=player.money-1200
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("rugged_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Rugged Mantle") then
						player:dialogSeq({t,"Rugged Mantle:\n\nA standard poet Mantle.",t,"Requires:\n\n-Adept tailor\n-10 Perendale fabric\n-1 Shetland fabric\n-1200 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=2200 and player:hasItem("perendale_fabric",10) == true and player:hasItem("shetland_fabric",1) == true and player.money>=1200) then
								player:removeItem("perendale_fabric",10)
								player:removeItem("shetland_fabric",1)
								player.money=player.money-1200
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("rugged_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Rugged Drapery") then
						player:dialogSeq({t,"Rugged Drapery:\n\nA standard female poet Drapery.",t,"Requires:\n\n-Adept tailor\n-10 Perendale fabric\n-1 Shetland fabric\n-1200 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=2200 and player:hasItem("perendale_fabric",10) == true and player:hasItem("shetland_fabric",1) == true and player.money>=1200) then
								player:removeItem("perendale_fabric",10)
								player:removeItem("shetland_fabric",1)
								player.money=player.money-1200
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("rugged_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Repellent Clothes") then
						player:dialogSeq({t,"Repellent Clothes:\n\nStandard mage Clothes.",t,"Requires:\n\n-Adept tailor\n-12 Perendale fabric\n-2 Shetland fabric\n-1200 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=2200 and player:hasItem("perendale_fabric",12) == true and player:hasItem("shetland_fabric",2) == true and player.money>=1200) then
								player:removeItem("perendale_fabric",12)
								player:removeItem("shetland_fabric",2)
								player.money=player.money-1200
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("repellent_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Repellent Skirt") then
						player:dialogSeq({t,"Repellent Skirt:\n\nA standard female mage skirt.",t,"Requires:\n\n-Adept tailor\n-12 Perendale fabric\n-2 Shetland fabric\n-1200 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=2200 and player:hasItem("perendale_fabric",12) == true and player:hasItem("shetland_fabric",2) == true and player.money>=1200) then
								player:removeItem("perendale_fabric",12)
								player:removeItem("shetland_fabric",2)
								player.money=player.money-1200
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("repellent_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Repellent Mantle") then
						player:dialogSeq({t,"Repellent Mantle:\n\nA standard poet Mantle.",t,"Requires:\n\n-Adept tailor\n-12 Perendale fabric\n-2 Shetland fabric\n-1200 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=2200 and player:hasItem("perendale_fabric",12) == true and player:hasItem("shetland_fabric",2) == true and player.money>=1200) then
								player:removeItem("perendale_fabric",12)
								player:removeItem("shetland_fabric",2)
								player.money=player.money-1200
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("repellent_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Repellent Drapery") then
						player:dialogSeq({t,"Repellent Drapery:\n\nA standard poet Drapery.",t,"Requires:\n\n-Adept tailor\n-12 Perendale fabric\n-2 Shetland fabric\n-1200 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=2200 and player:hasItem("perendale_fabric",12) == true and player:hasItem("shetland_fabric",2) == true and player.money>=1200) then
								player:removeItem("perendale_fabric",12)
								player:removeItem("shetland_fabric",2)
								player.money=player.money-1200
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("repellent_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Impenetrable Clothes") then
						player:dialogSeq({t,"Impenetrable Clothes:\n\nStandard mage Clothes.",t,"Requires:\n\n-Talented tailor\n-15 Perendale fabric\n-4 Shetland fabric\n-1500 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=6400 and player:hasItem("perendale_fabric",15) == true and player:hasItem("shetland_fabric",4) == true and player.money>=1500) then
								player:removeItem("perendale_fabric",15)
								player:removeItem("shetland_fabric",4)
								player.money=player.money-1500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("impenetrable_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Impenetrable Skirt") then
						player:dialogSeq({t,"Impenetrable Skirt:\n\nA standard female mage Skirt.",t,"Requires:\n\n-Talented tailor\n-15 Perendale fabric\n-4 Shetland fabric\n-1500 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=6400 and player:hasItem("perendale_fabric",15) == true and player:hasItem("shetland_fabric",4) == true and player.money>=1500) then
								player:removeItem("perendale_fabric",15)
								player:removeItem("shetland_fabric",4)
								player.money=player.money-1500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("impenetrable_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Impenetrable Mantle") then
						player:dialogSeq({t,"Impenetrable Mantle:\n\nA standard poet Mantle.",t,"Requires:\n\n-Talented tailor\n-15 Perendale fabric\n-4 Shetland fabric\n-1500 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=6400 and player:hasItem("perendale_fabric",15) == true and player:hasItem("shetland_fabric",4) == true and player.money>=1500) then
								player:removeItem("perendale_fabric",15)
								player:removeItem("shetland_fabric",4)
								player.money=player.money-1500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("impenetrable_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Impenetrable Drapery") then
						player:dialogSeq({t,"Impenetrable Drapery:\n\nA standard female poet Drapery.",t,"Requires:\n\n-Talented tailor\n-15 Perendale fabric\n-4 Shetland fabric\n-1500 coins\n\nto be tailored.",t,"Click next if you want to proceed."},1)
						if(player.registry["tailor"]>=6400 and player:hasItem("perendale_fabric",15) == true and player:hasItem("shetland_fabric",4) == true and player.money>=1500) then
								player:removeItem("perendale_fabric",15)
								player:removeItem("shetland_fabric",4)
								player.money=player.money-1500
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("impenetrable_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Dark Drapery") then
						player:dialogSeq({t,"Dark Drapery:\n\nA poet Drapery infused by Darkness.",t,"Requires:\n\n-Skilled tailor\n-Impenetrable Drapery\n-100 Soulstones\n-20 Perendale fabric\n-10 Merino fabric\n-5 Shetland fabric\n-1 Rambouillet fabric\n-5000 coins\n\nto be forged."},1)
						if(player.registry["tailor"]>=18000 and player:hasItem("impenetrable_drapery",1) == true and player:hasItem("soulstone",100) == true and player:hasItem("perendale_fabric",20) == true and player:hasItem("merino_fabric",10) == true and player:hasItem("shetland_fabric",5) == true and player:hasItem("rambouillet_fabric",1) == true and player.money>=5000) then
								player:removeItem("impenetrable_drapery",1)
								player:removeItem("soulstone",100)
								player:removeItem("perendale_fabric",20)
								player:removeItem("merino_fabric",10)
								player:removeItem("shetland_fabric",5)
								player:removeItem("rambouillet_fabric",1)
								player.money=player.money-5000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("dark_drapery",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Dark Mantle") then
						player:dialogSeq({t,"Dark Mantle:\n\nA poet Mantle infused by Darkness.",t,"Requires:\n\n-Skilled tailor\n-Impenetrable Mantle\n-100 Soulstones\n-20 Perendale fabric\n-10 Merino fabric\n-5 Shetland fabric\n-1 Rambouillet fabric\n-5000 coins\n\nto be forged."},1)
						if(player.registry["tailor"]>=18000 and player:hasItem("impenetrable_mantle",1) == true and player:hasItem("soulstone",100) == true and player:hasItem("perendale_fabric",20) == true and player:hasItem("merino_fabric",10) == true and player:hasItem("shetland_fabric",5) == true and player:hasItem("rambouillet_fabric",1) == true and player.money>=5000) then
								player:removeItem("impenetrable_mantle",1)
								player:removeItem("soulstone",100)
								player:removeItem("perendale_fabric",20)
								player:removeItem("merino_fabric",10)
								player:removeItem("shetland_fabric",5)
								player:removeItem("rambouillet_fabric",1)
								player.money=player.money-5000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("dark_mantle",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Dark Clothes") then
						player:dialogSeq({t,"Dark Clothes:\n\nMage Clothes infused by Darkness.",t,"Requires:\n\n-Skilled tailor\n-Impenetrable Clothes\n-100 Soulstones\n-20 Perendale fabric\n-10 Merino fabric\n-5 Shetland fabric\n-1 Rambouillet fabric\n-5000 coins\n\nto be forged."},1)
						if(player.registry["tailor"]>=18000 and player:hasItem("impenetrable_clothes",1) == true and player:hasItem("soulstone",100) == true and player:hasItem("perendale_fabric",20) == true and player:hasItem("merino_fabric",10) == true and player:hasItem("shetland_fabric",5) == true and player:hasItem("rambouillet_fabric",1) == true and player.money>=5000) then
								player:removeItem("impenetrable_clothes",1)
								player:removeItem("soulstone",100)
								player:removeItem("perendale_fabric",20)
								player:removeItem("merino_fabric",10)
								player:removeItem("shetland_fabric",5)
								player:removeItem("rambouillet_fabric",1)
								player.money=player.money-5000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("dark_clothes",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Dark Skirt") then
						player:dialogSeq({t,"Dark Skirt:\n\nA female Mage Skirt infused by Darkness.",t,"Requires:\n\n-Skilled tailor\n-Impenetrable Skirt\n-100 Soulstones\n-20 Perendale fabric\n-10 Merino fabric\n-5 Shetland fabric\n-1 Rambouillet fabric\n-5000 coins\n\nto be forged."},1)
						if(player.registry["tailor"]>=18000 and player:hasItem("impenetrable_skirt",1) == true and player:hasItem("soulstone",100) == true and player:hasItem("perendale_fabric",20) == true and player:hasItem("merino_fabric",10) == true and player:hasItem("shetland_fabric",5) == true and player:hasItem("rambouillet_fabric",1) == true and player.money>=5000) then
								player:removeItem("impenetrable_skirt",1)
								player:removeItem("soulstone",100)
								player:removeItem("perendale_fabric",20)
								player:removeItem("merino_fabric",10)
								player:removeItem("shetland_fabric",5)
								player:removeItem("rambouillet_fabric",1)
								player.money=player.money-5000
								player:sendStatus()
								local r=math.random(1,2)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("dark_skirt",1)
								player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Runic robes") then
						player:dialogSeq({t,"Runic robes:\n\nA poet robe infused with runic magic.",t,"Requires:\n\n-Expert tailor\n-300 Runic pendants\n-30 Perendale fabric\n-30 Merino fabric\n-30 Shetland fabric\n-30 Rambouillet fabric\n-10 Tiger's eye\n-100000 coins\n\nto be forged."},1)
						if(player.registry["tailor"]>=50000 and player:hasItem("runic_pendant",300) == true and player:hasItem("perendale_fabric",30) == true and player:hasItem("merino_fabric",30) == true and player:hasItem("shetland_fabric",30) == true and player:hasItem("rambouillet_fabric",30) == true and player:hasItem("tigers_eye",10) == true and player.money>=100000) then
								player:removeItem("runic_pendant",300)
								player:removeItem("perendale_fabric",30)
								player:removeItem("merino_fabric",30)
								player:removeItem("shetland_fabric",30)
								player:removeItem("rambouillet_fabric",30)
								player:removeItem("tigers_eye",10)
								player.money=player.money-100000
								player:sendStatus()
								local r=math.random(1,5)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("runic_robes",1)
								player:giveXP(math.floor(5+(3*(math.pow(player.level,4)/30)/14)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end
					elseif(choice=="Runic gown") then
						player:dialogSeq({t,"Runic gown:\n\nA poet gown infused with runic magic.",t,"Requires:\n\n-Expert tailor\n-300 Runic pendants\n-30 Perendale fabric\n-30 Merino fabric\n-30 Shetland fabric\n-30 Rambouillet fabric\n-10 Tiger's eye\n-100000 coins\n\nto be forged."},1)
						if(player.registry["tailor"]>=50000 and player:hasItem("runic_pendant",300) == true and player:hasItem("perendale_fabric",30) == true and player:hasItem("merino_fabric",30) == true and player:hasItem("shetland_fabric",30) == true and player:hasItem("rambouillet_fabric",30) == true and player:hasItem("tigers_eye",10) == true and player.money>=100000) then
								player:removeItem("runic_pendant",300)
								player:removeItem("perendale_fabric",30)
								player:removeItem("merino_fabric",30)
								player:removeItem("shetland_fabric",30)
								player:removeItem("rambouillet_fabric",30)
								player:removeItem("tigers_eye",10)
								player.money=player.money-100000
								player:sendStatus()
								local r=math.random(1,5)
								player.registry["tailor"]=player.registry["tailor"]+(r*2)
								player:addItem("runic_gown",1)
								player:giveXP(math.floor(5+(3*(math.pow(player.level,4)/30)/14)*(1+(player.registry["currenttier"]*0.15))))
								player:sendStatus()
						else
								player:dialogSeq({t,"You do not meet the requirements!"})
						end

						--[[
										
							Put Recipes here

								
						--]]

					end
		local craftlevel="Beginner"
		if(player.registry["tailor"]>=1 and player.registry["tailor"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["tailor"]>=25 and player.registry["tailor"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["tailor"]>=220 and player.registry["tailor"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["tailor"]>=840 and player.registry["tailor"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["tailor"]>=2200 and player.registry["tailor"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["tailor"]>=6400 and player.registry["tailor"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["tailor"]>=18000 and player.registry["tailor"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["tailor"]>=50000 and player.registry["tailor"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["tailor"]>=124000 and player.registry["tailor"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["tailor"]>=237000 and player.registry["tailor"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["tailor"]>=400000 and player.registry["tailor"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["tailor"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("tailor")
		player:addLegend(""..craftlevel.." tailor","tailor",75,128)



			end											

	end)
}