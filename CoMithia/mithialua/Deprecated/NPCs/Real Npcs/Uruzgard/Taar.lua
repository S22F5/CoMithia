taar = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(38,"monster"),color=0}
                player.npcGraphic=t.graphic
		player.npcColor=t.color
                local opts = { }
		local optsmenu = { }
		local prizeopts = { }
		local optweapon = { }
		local optshield = { }
		local optring = { }
		local optmisc = { }
                table.insert(opts,"Yes")
                table.insert(opts,"No")
		table.insert(optsmenu,"Ressurect")

		if(player.class==2 and player.registry["roguepathquest"]>=0 and player.level>=18) then
			table.insert(optsmenu,"Power of suggestion")
		end
		if(player.class==2 and player.registry["roguepathquest"]>=1 and player.level>=45) then
			table.insert(optsmenu,"Backstab / Barrage")
		end
		if(player.class==2 and player.registry["roguepathquest"]>=2 and player.level>=86) then
			table.insert(optsmenu,"Throwing star / Tricks of the trade")
		end
		if(player.class==2 and player.registry["roguepathquest"]>=3 and player.level>=99) then
			table.insert(optsmenu,"Dancing Edge / Headshot")
		end
		table.insert(optsmenu,"Carnage prizes")


		table.insert(prizeopts,"Weapons")
		table.insert(prizeopts,"Shields")
		table.insert(prizeopts,"Rings")
		table.insert(prizeopts,"Misc.")

		table.insert(optweapon,"Runic sword - 40 Tokens")
		table.insert(optweapon,"Gaorg's blade - 40 Tokens")
		table.insert(optweapon,"Demolisher (Warrior) - 25 Tokens")
		table.insert(optweapon,"Cutthroat (Rogue) - 25 Tokens")
		table.insert(optweapon,"Scepter of kings (Mage) - 25 Tokens")
		table.insert(optweapon,"Harmony (Poet) - 25 Tokens")
		table.insert(optweapon,"Peg leg - 10 Tokens")
		table.insert(optweapon,"Dead staff - 10 Tokens")

		table.insert(optshield,"Tsunami guard - 40 Tokens")
		table.insert(optshield,"Steel guard (Warrior) - 25 Tokens")
		table.insert(optshield,"Hoplite shield (Rogue) - 25 Tokens")
		table.insert(optshield,"Magic reflector (Mage) - 25 Tokens")
		table.insert(optshield,"Bag of tricks (Poet) - 25 Tokens")
		table.insert(optshield,"Bjorn shield - 10 Tokens")
		table.insert(optshield,"Dowhar shield - 10 Tokens")

		table.insert(optring,"Shackles (Warrior) - 40 Tokens")
		table.insert(optring,"Abyss shard - 40 Tokens")
		table.insert(optring,"Focusing ring - 40 Tokens")
		table.insert(optring,"Azure band - 25 Tokens")
		table.insert(optring,"Serpent's eye - 25 Tokens")
		table.insert(optring,"Bjorn battle gauntlet - 10 Tokens")
		table.insert(optring,"Dowhar viridian band - 10 Tokens")
		table.insert(optring,"Blood ring - 5 Tokens")
		table.insert(optring,"Blue stinger - 5 Tokens")


		table.insert(optmisc,"Shining experience gem - 50 Tokens")
		table.insert(optmisc,"Burning rum - 30 Tokens")
		table.insert(optmisc,"Frozen heart - 20 Tokens")
		table.insert(optmisc,"2 Broken bone - 5 Tokens")
		table.insert(optmisc,"5 Stolen coin - 5 Tokens")
		table.insert(optmisc,"Stolen money sack - 5 Tokens")
		table.insert(optmisc,"100 Tiger's eye - 50 Tokens")
		table.insert(optmisc,"100 Chrysocolla - 30 Tokens")
		table.insert(optmisc,"100 Amethyst - 15 Tokens")

		local choice=player:menuString("Welcome to my shop.",optsmenu)

		if(choice=="Ressurect") then
			if(player.state~=1) then
				player:dialogSeq({t,"I see you're alive and well going, good day to you."})
			else
				player.npcGraphic=t.graphic
				player.npcColor=t.color
				local menuOption=player:menuString("Do you wish to be resurrected?",opts)
				if(menuOption=="Yes") then
					player.state=0
					player:addHealth(1000000000)
					player:addMana(1000000000)
					player:updateState()
					player:sendAnimation(96)
					player:playSound(112)
					npc:talk(0,"Taar: We shall meet again, " .. player.name.. ".")
				else
					player:dialogSeq({t,"Well if that's your will..."})
				end
			end

		elseif(choice=="Carnage prizes") then
			local prizechoice=player:menuString2("You have "..player.registry["gametokens"].." Game tokens, which of my prizes do you wish to browse?",prizeopts)
			if(prizechoice=="Weapons") then
				local weapchoice=player:menuString2("You have "..player.registry["gametokens"].." Game tokens. What are you interested in?",optweapon)
				if(weapchoice=="Runic sword - 40 Tokens") then
					player:dialogSeq({t,"Runic sword - 40 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<40) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("runic_sword",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-40
					player:addItem("runic_sword",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")


				elseif(weapchoice=="Gaorg's blade - 40 Tokens") then
					player:dialogSeq({t,"Gaorg's blade - 40 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<40) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("gaorgs_blade",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-40
					player:addItem("gaorgs_blade",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")


				elseif(weapchoice=="Demolisher (Warrior) - 25 Tokens") then
					player:dialogSeq({t,"Demolisher (Warrior) - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("demolisher",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("demolisher",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")
				


				elseif(weapchoice=="Cutthroat (Rogue) - 25 Tokens") then
					player:dialogSeq({t,"Cutthroat (Rogue) - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("cutthroat",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("cutthroat",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				elseif(weapchoice=="Scepter of kings (Mage) - 25 Tokens") then
					player:dialogSeq({t,"Scepter of kings (Mage) - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("scepter_of_kings",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("scepter_of_kings",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				elseif(weapchoice=="Harmony (Poet) - 25 Tokens") then
					player:dialogSeq({t,"Harmony (Poet) - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("harmony",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("harmony",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")




				elseif(weapchoice=="Peg leg - 10 Tokens") then
					player:dialogSeq({t,"Peg leg - 10 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<10) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("peg_leg",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-10
					player:addItem("peg_leg",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")





				elseif(weapchoice=="Dead staff - 10 Tokens") then
					player:dialogSeq({t,"Dead staff - 10 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<10) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("dead_staff",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-10
					player:addItem("dead_staff",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")

				end










			elseif(prizechoice=="Shields") then
				local shieldchoice=player:menuString2("You have "..player.registry["gametokens"].." Game tokens. What are you interested in?",optshield)
				if(shieldchoice=="Tsunami guard - 40 Tokens") then
					player:dialogSeq({t,"Tsunami guard - 40 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<40) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("tsunami_guard",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-40
					player:addItem("tsunami_guard",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				elseif(shieldchoice=="Steel guard (Warrior) - 25 Tokens") then
					player:dialogSeq({t,"Steel guard (Warrior) - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("steel_guard",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("steel_guard",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")




				elseif(shieldchoice=="Hoplite shield (Rogue) - 25 Tokens") then
					player:dialogSeq({t,"Hoplite shield (Rogue) - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("hoplite_shield",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("hoplite_shield",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")





				elseif(shieldchoice=="Magic reflector (Mage) - 25 Tokens") then
					player:dialogSeq({t,"Magic reflector (Mage) - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("magic_reflector",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("magic_reflector",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")





				elseif(shieldchoice=="Bag of tricks (Poet) - 25 Tokens") then
					player:dialogSeq({t,"Bag of tricks (Poet) - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("bag_of_tricks",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("bag_of_tricks",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")





				elseif(shieldchoice=="Dowhar shield - 10 Tokens") then
					player:dialogSeq({t,"Dowhar shield - 10 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<10) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("dowhar_shield",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-10
					player:addItem("dowhar_shield",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")





				elseif(shieldchoice=="Bjorn shield - 10 Tokens") then
					player:dialogSeq({t,"Bjorn shield - 10 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<10) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("bjorn_shield",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-10
					player:addItem("bjorn_shield",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				end









			elseif(prizechoice=="Rings") then
				local ringchoice=player:menuString2("You have "..player.registry["gametokens"].." Game tokens. What are you interested in?",optring)
				if(ringchoice=="Shackles (Warrior) - 40 Tokens") then
					player:dialogSeq({t,"Shackles (Warrior) - 40 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<40) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("shackles",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-40
					player:addItem("shackles",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				elseif(ringchoice=="Abyss shard - 40 Tokens") then
					player:dialogSeq({t,"Abyss shard - 40 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<40) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("abyss_shard",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-40
					player:addItem("abyss_shard",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")





				elseif(ringchoice=="Focusing ring - 40 Tokens") then
					player:dialogSeq({t,"Focusing ring - 40 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<40) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("focusing_ring",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-40
					player:addItem("focusing_ring",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")





				elseif(ringchoice=="Azure band - 25 Tokens") then
					player:dialogSeq({t,"Azure band - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("azure_band",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("azure_band",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")




				elseif(ringchoice=="Serpent's eye - 25 Tokens") then
					player:dialogSeq({t,"Serpent's eye - 25 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<25) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("serpents_eye",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-25
					player:addItem("serpents_eye",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")




				elseif(ringchoice=="Dowhar viridian band - 10 Tokens") then
					player:dialogSeq({t,"Dowhar viridian band - 10 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<10) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("dowhar_viridian_band",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-10
					player:addItem("dowhar_viridian_band",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")







				elseif(ringchoice=="Bjorn battle gauntlet - 10 Tokens") then
					player:dialogSeq({t,"Bjorn battle gauntlet - 10 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<10) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("bjorn_battle_gauntlet",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-10
					player:addItem("bjorn_battle_gauntlet",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")





				elseif(ringchoice=="Blood ring - 5 Tokens") then
					player:dialogSeq({t,"Blood ring - 5 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<5) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("blood_ring",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-5
					player:addItem("blood_ring",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				elseif(ringchoice=="Blue stinger - 5 Tokens") then
					player:dialogSeq({t,"Blue stinger - 5 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<5) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("blue_stinger",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-5
					player:addItem("blue_stinger",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				end







			elseif(prizechoice=="Misc.") then
				local miscchoice=player:menuString2("You have "..player.registry["gametokens"].." Game tokens. What are you interested in?",optmisc)
				if(miscchoice=="Shining experience gem - 50 Tokens") then
					player:dialogSeq({t,"Shining experience gem - 50 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<50) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("shining_experience_gem",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-50
					player:addItem("shining_experience_gem",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				elseif(miscchoice=="Burning rum - 30 Tokens") then
					player:dialogSeq({t,"Burning rum - 30 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<30) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("burning_rum",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-30
					player:addItem("burning_rum",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")


				elseif(miscchoice=="Frozen heart - 20 Tokens") then
					player:dialogSeq({t,"Frozen heart - 20 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<20) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("frozen_heart",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-20
					player:addItem("frozen_heart",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")


				elseif(miscchoice=="2 Broken bone - 5 Tokens") then
					player:dialogSeq({t,"2 Broken bone - 5 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<5) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("broken_bone",2)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-5
					player:addItem("broken_bone",2)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")


				elseif(miscchoice=="5 Stolen coin - 5 Tokens") then
					player:dialogSeq({t,"5 Stolen coin - 5 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<5) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("stolen_coin",5)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-5
					player:addItem("stolen_coin",5)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				elseif(miscchoice=="Stolen money sack - 5 Tokens") then
					player:dialogSeq({t,"Stolen money sack - 5 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<5) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("stolen_money_sack",1)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-5
					player:addItem("stolen_money_sack",1)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")




				elseif(miscchoice=="100 Tiger's eye - 50 Tokens") then
					player:dialogSeq({t,"100 Tiger's eye - 50 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<50) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("tigers_eye",100)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-50
					player:addItem("tigers_eye",100)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")



				elseif(miscchoice=="100 Chrysocolla - 30 Tokens") then
					player:dialogSeq({t,"100 Chrysocolla - 30 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<30) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("chrysocolla",100)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-30
					player:addItem("chrysocolla",100)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")


				elseif(miscchoice=="100 Amethyst - 15 Tokens") then
					player:dialogSeq({t,"100 Amethyst - 15 Tokens\n\nPress next to proceed"},1)
					if(player.registry["gametokens"]<15) then
						player:dialogSeq({t,"You do not have enough Game tokens."})
						return
					end
					if(player:hasSpace("amethyst",100)==false) then
						player:dialogSeq({t,"You do not have enough room in your inventory."})
						return
					end
					player.registry["gametokens"]=player.registry["gametokens"]-15
					player:addItem("amethyst",100)
					player:sendMinitext("You now have "..player.registry["gametokens"].." Game tokens left.")




				end






			end

















		elseif(choice=="Power of suggestion" and player.class==2) then
			if(player.registry["suggestionquest"]==0) then
			player:dialogSeq({t,"Hello there young rogue, are you looking for work?"},1)
				local choice2=player:menuString2("Are you looking for work?",opts)
				if(choice2=="No") then
					player:dialogSeq({t,"Alright. Please return if you change your mind."})
				elseif(choice2=="Yes") then
					player.registry["suggestionquest"]=1
					player:dialogSeq({t,"I happen to need some special fish that come from a distant land, they are a delecacy in my family. I have a big event planned and I need to get 10 Delicate Fish to feed everyone.",t,"You can find a merchant there who imports these fish. They are priceless, however I have heard of him bartering as he has his needs also.",t,"You should speak with him and see what you can do to get my the fish I require. I will make it worth your time. This old dog still knows some neat tricks!"})
				end
			elseif(player.registry["suggestionquest"]>0) then
				if(player:hasItem("delicate_fish",10) == true) then
					player:dialogSeq({t,"You are a life saver! I hope he did not ask too much for these.",t,"Well let me just put these over here in storage, I will be right back with you.",t,"Alright then, as I said I still have a few tricks up my sleave.",t,"Do you know how I managed to get you to do this task for you?",t,"The power of Suggestion!",t,"It can help to accomplish many great things, and as promised, I am more than happy to help you master it.",t,"*Stares blankly into your eyes and widens his eyes as you feel your mind expand*"},1)
					player:removeItem("delicate_fish",10)
					player.registry["suggestionquest"]=3
					player:addSpell("suggestion")
					player.registry["roguepathquest"]=1
					player:dialogSeq({t,"There you go. Our business is done... for now."})
				else
					player:dialogSeq({t,"Well, did you bring back my Delicate fish? I'm sure you can get some for me from the Harbor."})
				end
			elseif(player.registry["roguepathquest"]>=1 and player.class==2) then
					player:dialogSeq({t,"I hope you're enjoying the Power of Suggestion.\n\n ((In case you lost your Power of Suggestion spell, this dialog allows you to relearn it. Press next to proceed.))"},1)
					player:addSpell("suggestion")
			end
		elseif(choice=="Backstab / Barrage" and player.class==2) then
			if(player.registry["roguepathquest"]==1) then
			player:dialogSeq({t,"Oh it is you! Wow you have grown since you last came to me for work!",t,"You know, between you and me.. I used to be one of the strongest of the land. I was a combat champion before I retired to stay here and offer my services to those fallen in battle.",t,"Those were the days... I was known for my special moves, the Backstab. Basically I would maneuver myself around my opponent and strike him on the weak spot in his armor!",t,"I think you might be ready to learn this skill, however I do have a task I need you to perform before I can be confident that you are ready.",t,"I need you to travel into the heart of the Volcano and bring me back either a Dowhar band or Gauntlet.",t,"If you can bring me one of those items, it will prove your strength and courage, showing me you are ready to learn this covetted technique."},1)
			if(player:hasItem("bjorn_battle_gauntlet",1) == true and player.registry["roguepathquest"]==1) then
				player:dialogSeq({t,"Oh you have it! I knew you could do it. Well then, let's get into your training."},1)
				player:removeItem("bjorn_battle_gauntlet",1)
				player:addSpell("backstab")
				player.registry["roguepathquest"]=2
				player:dialogSeq({t,"*You spend several hours learning the details of Taar's special move, the Backstab*"})
			end
			if(player:hasItem("dowhar_viridian_band",1) == true and player.registry["roguepathquest"]==1) then
				player:dialogSeq({t,"Oh you have it! I knew you could do it. Well then, let's get into your training."},1)
				player:removeItem("dowhar_viridian_band",1)
				player:addSpell("backstab")
				player:addSpell("barrage")
				player.registry["roguepathquest"]=2
				player:dialogSeq({t,"*You spend several hours learning the details of Taar's special move, the Backstab*"})
			end
			elseif(player.registry["roguepathquest"]>=2 and player.class==2) then
				player:dialogSeq({t,"I hope you're enjoying Backstab and Barrage.\n\n ((In case you lost your Backstab or Barrage spell, this dialog allows you to relearn it. Press next to proceed.))"},1)
				player:addSpell("backstab")
				player:addSpell("barrage")
			end
		elseif(choice=="Throwing star / Tricks of the trade" and player.class==2) then
			if(player.registry["roguepathquest"]==2) then
				player:dialogSeq({t,"It is important to realise a Rogue can't rely only on his blades to defeat foes. We use stealth and precision to be deadly without being seen. When we can't reach our target, the logical next move is to attack from range.","I can teach you how to throw stars if you bring me Gaorg's blade for my personnal collection, as well as 20,000 coins for my training fees."},1)
				if(player:hasItem("gaorgs_blade",1) == true and player.registry["roguepathquest"]==2 and player.money>=20000) then
					player.money=player.money-20000
					player:removeItem("gaorgs_blade",1)
					player:addSpell("throwing_star")
					player:addSpell("tricks_of_the_trade")
					player.registry["roguepathquest"]=3
					player:sendStatus()
					player:dialogSeq({t,"You brought it back, it seems. You've done good work, let's get to work."},1)
					player:dialogSeq({t,"*You spend several hours learning the techniques of Throwing star as well as Tricks of the trade*"})
				end
			elseif(player.registry["roguepathquest"]>=3 and player.class==2) then
				player:dialogSeq({t,"I hope you're enjoying Throwing star\n\n ((In case you lost your Throwing star or Tricks of the trade spell, this dialog allows you to relearn it. Press next to proceed.))"},1)
				player:addSpell("throwing_star")
				player:addSpell("tricks_of_the_trade")
			end
		elseif(choice=="Dancing Edge / Headshot" and player.class==2) then
			if(player.registry["roguepathquest"]==3) then
				player:dialogSeq({t,"You are almost at the top, my friend. Yet you wish to acquire even more power.",t,"We rogues have been keeping the secret of the Dancing edge for generations now, only to teach it to those amongst us who are the most deserving.",t,"I can feel you are ready to learn it now, but you must still prove your value. Venture in Gruzar's fortress and defeat the Avatar of Misery. Should you succeed, bring me back 25 Soulstones and I shall teach you this technique."},1)
				if(player:killCount(86)>0 and player:hasItem("soulstone",25) == true) then
					player:removeItem("soulstone",25)
					player:addSpell("dancing_edge")
					player:addSpell("headshot")
					player.registry["roguepathquest"]=4
					player:dialogSeq({t,"You are then indeed truly deserving as well."},1)
					player:dialogSeq({t,"*You spend several hours learning Dancing edge*"})
				end
			elseif(player.registry["roguepathquest"]>=4 and player.class==2) then
				player:dialogSeq({t,"I hope you're enjoying Dancing Edge\n\n ((In case you lost your Dancing edge spell, this dialog allows you to relearn it. Press next to proceed.))"},1)
				player:addSpell("headshot")
				player:addSpell("dancing_edge")
			end
		end
			
				

	end)
}