farral = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(486,"monster"),color=21}
	        local opts = { }
		local optsbuy ={}
		local optsrag = { }
		local menuOption
		local menuOptionBuy

                                player.npcGraphic=t.graphic
			        player.npcColor=t.color
                                table.insert(opts,"Buy")
                                table.insert(opts,"Sell")
			        table.insert(opts,"Repair Item")
				table.insert(opts,"Repair all")
				if(player.level>=12 and player.classBase==1) then
					table.insert(opts,"Berserker mastery")
				end
				if(player.level>=40 and player.registry["warpathquest"]>=1 and player.classBase==1) then
					table.insert(opts,"Challenge!")
				end
				if(player.level>=92 and player.registry["warpathquest"]>=3 and player.classBase==1) then
					table.insert(opts,"Tenacity")
				end
				if(player.level>=99 and player.registry["warpathquest"]>=4 and player.classBase==1) then
					table.insert(opts,"Blade rush")
				end
				if(player.registry["icelabyrinthquest"]==2 or player.registry["icelabyrinthquest"]==3 or player.registry["icelabyrinthquest"]==4) then
					table.insert(opts,"Farral's rag")
				end
				table.insert(optsrag,"It seems to be part of a map...")
				table.insert(optsrag,"Nevermind")
			        table.insert(optsbuy,"Weapons")
			        table.insert(optsbuy,"Warrior splint mails") 
			        table.insert(optsbuy,"Warrior splint mail dresses") 
			        table.insert(optsbuy,"Rogue male waistcoats") 
			        table.insert(optsbuy,"Rogue blouses") 
			        table.insert(optsbuy,"Helms") 
			        table.insert(optsbuy,"Peasant items")    
                                if(#opts~=0) then
                                  menuOption=player:menuString("Welcome to my shop, Can I help you?",opts)
                                    if(menuOption=="Buy") then
						menuOptionBuy=player:menuString("What kind of object would you like to buy ?",optsbuy)
							if(menuOptionBuy=="Warrior splint mails") then
								player:buyExtend("What do you wish to buy?",{70,71,72,73,74,75,76,77,78})
							elseif(menuOptionBuy=="Warrior splint mail dresses") then
								player:buyExtend("What do you wish to buy?",{108,109,110,111,112,113,114,115,116})
							elseif(menuOptionBuy=="Rogue male waistcoats") then
								player:buyExtend("What do you wish to buy?",{80,81,82,83,84,85,86,87,88})
							elseif(menuOptionBuy=="Rogue blouses") then
								player:buyExtend("What do you wish to buy?",{118,119,120,121,122,123,124,125,126})
							elseif(menuOptionBuy=="Helms") then
								player:buyExtend("What do you wish to buy?",{151,152,153,154,155,156,157,158,159,160})
							elseif(menuOptionBuy=="Weapons") then
								player:buyExtend("What do you wish to buy?",{191,192,193,194,203,204,205,206})
							elseif(menuOptionBuy=="Peasant items") then
								player:buyExtend("What do you wish to buy?",{20,21,22,23,107,117,138,127})
							end
  				
                                  elseif(menuOption=="Sell") then
                                     player:sellExtend("What do you wish to sell?",{"stout_helm","sturdy_helm","strong_helm","reinforced_helm","hardened_helm","fortified_helm","durable_helm","rugged_helm","repellent_helm","impenetrable_helm","stout_waistcoat","sturdy_waistcoat","strong_waistcoat","reinforced_waistcoat","hardened_waistcoat","fortified_waistcoat","durable_waistcoat","rugged_waistcoat","repellent_waistcoat","impenetrable_waistcoat","stout_blouse","sturdy_blouse","strong_blouse","reinforced_blouse","hardened_blouse","fortified_blouse","durable_blouse","rugged_blouse","repellent_blouse","impenetrable_blouse","stout_splint_mail","sturdy_splint_mail","strong_splint_mail","reinforced_splint_mail","hardened_splint_mail","fortified_splint_mail","durable_splint_mail","rugged_splint_mail","repellent_splint_mail","impenetrable_splint_mail","stout_splint_dress","sturdy_splint_dress","strong_splint_dress","reinforced_splint_dress","hardened_splint_dress","fortified_splint_dress","durable_splint_dress","rugged_splint_dress","repellent_splint_dress","impenetrable_splint_dress","warriors_longsword","rogues_shortsword","broadsword","bastard_sword","gladius","dirk","heavy_broadsword","claymore","archer_bow"})
				  elseif(menuOption=="Repair Item") then
						player:repairExtend()
				  elseif(menuOption=="Repair all") then
						player:repairAll(player,npc)
                                  elseif(menuOption=="Berserker mastery") then
					if(player.registry["warpathquest"]==0) then
					player:dialogSeq({t,"Hey there, Warrior.\n\nI have noticed that you are getting strong... Yet I'm sure you'd like to be stronger.",t,"I could help you and teach you how to master a technique that I have learned a long time ago before I chose to retire from the adventures world and devote myself to the Forge mysteries.",t,"I'll teach you if you can do me a few favors. I'm always in need of some ore, so you would be very nice to bring some back to me.",t,"I've also heard that Havarth, from the Western cave, carries an axe. If you can bring it back to me I should be able to work on it and add it to my personnal collection."},1)
						if(player:hasItem("tin_ore",100) == true and player:hasItem("havarths_broken_axe",1) == true) then
							player:removeItem("tin_ore",100)
							player:removeItem("havarths_broken_axe",1)
							player.registry["warpathquest"]=1
							player:addSpell("berserker_mastery")
							player:dialogSeq({t,"Ah... I see you brought everything back... Well done, my friend.",t,"As promised, I shall teach you what I've learned myself in the past."},1)
							player:dialogSeq({"After hours of training, you have now mastered your Berserking state."})
						end
					else
						player:dialogSeq({t,"I hope you're enjoying your new mastery.\n\n In case you lost your Berserker Mastery spell, this dialog allows you to relearn it. Press next to proceed."},1)
						player:addSpell("berserker_mastery")
					end
				  elseif(menuOption=="Challenge!") then
					if(player.registry["warpathquest"]==1) then
						player:dialogSeq({t,"I'm sure you've noticed how weak your friends can be when fighting dangerous monsters.",t,"It is our duty as Warriors to protect other paths by taking hits, But such a thing isn't always as easy as it sounds.",t,"I will will teach you how to attract your enemies' attraction on yourself, but first, you must prove your worth to me.",t,"Go and find the Pirate ship and slaughter whaterver is left of it's crew. Come back to me once it is done.",t,"Oh, I almost forgot... Bring back some of their swag as proof."},1)
						player:flushKills()
						player.registry["warpathquest"]=2
					elseif(player.registry["warpathquest"]==2) then
						if(player:killCount(36)>=20 and player:killCount(37)>=20 and player:killCount(38)>=1 and player:hasItem(150,1) == true) then
						player:removeItem(150,1)
						player:addSpell("challenging_shout")
						player.registry["warpathquest"]=3
						player:dialogSeq({t,"Wonderful, It seems you're one good warrior after all."},1)
						player:dialogSeq({"-You spend a few hours training with Farral until you finally master your new Challenging shout-"})
						else
						player:dialogSeq({t,"I will be waiting until you return from slaughtering the pirates.",t,"Don't forget to bring back some of their Swag as proof that the deed is done."})
						end
					elseif(player.registry["warpathquest"]>=3) then
						player:dialogSeq({t,"I hope you're enjoying your new shout.\n\n((In case your lost your Challenging shout spell, this dialog allows you to relearn it. Press next to proceed"},1)
						player:addSpell("challenging_shout")
					end
				  elseif(menuOption=="Tenacity") then
					if(player.registry["warpathquest"]==3) then
						player:dialogSeq({t,"Things don't always go the way they're planned. Your poet could be distracted by the simplest things, such as a fly passing nearby. Over the centuries, we have learned to develop techniques to survive should that happen.","In the deeps of the Nidavellir hides Daxlor, a monstrosity of power. Go and defeat him, and I shall teach you."},1)
							if(player:killCount(98)>=1) then
								player:addSpell("tenacity")
								player.registry["warpathquest"]=4
								player:dialogSeq({t,"You have made it, congratulations."},1)
								player:dialogSeq({"-You spend a few hours training with Farral until you finally master Tenacity-"})
							else
								player:flushKills()
								player:dialogSeq({t,"I will be waiting until you return from defeating Daxlor."})
							end
					elseif(player.registry["warpathquest"]>=4) then
						player:dialogSeq({t,"I hope you're enjoying Tenacity.\n\n((In case your lost your Tenacity spell, this dialog allows you to relearn it. Press next to proceed"},1)
						player:addSpell("tenacity")
					end
				  elseif(menuOption=="Blade rush") then
					if(player.registry["warpathquest"]==4) then
						player:dialogSeq({t,"Deep inside Gruzar's fortress, up north in the Battlefield, reside his abominable creations, the Avatars.",t,"One of these, the Avatar of Agony, has been trained in the ways of the Warrior. If you manage to observe him fighting, defeat him and then come back to tell me about it, we might be able to use his abilities for our own good.",t,"Bring me back 25 soulstones as well, as I need some of them to perfect my collection of hand crafted weapons."},1)
							if(player:killCount(88)>=1 and player:hasItem("soulstone",25) == true) then
								player:removeItem("soulstone",25)
								player:addSpell("blade_rush")
								player.registry["warpathquest"]=5
								player:dialogSeq({t,"From being the Student, you became the Master, "..player.name..". I have nothing more to teach you, and can only thank you for helping me understand the true power of warriors."},1)
								player:dialogSeq({"-You spend a few hours training Farral until he finally masters Blade rush-"})
							else
								player:flushKills()
								player:dialogSeq({t,"Come back to with some good news soon, please!"})
							end
					elseif(player.registry["warpathquest"]>=5) then
						player:dialogSeq({t,"I hope you're enjoying Blade rush.\n\n((In case your lost your Blade rush spell, this dialog allows you to relearn it. Press next to proceed"},1)
						player:addSpell("blade_rush")
					end
				   elseif(menuOption=="Farral's rag") then
				 	local menuOption2=player:menuString2("Huh? My old rag? why would you want that?",optsrag)
						if(menuOption2=="It seems to be part of a map...") then
							player.registry["icelabyrinthquest"]=3
							player:dialogSeq({t,"*Farral takes a closer look at the rag as his eyes widen*",t,"Now look at that! For all the years I've had this thing I never noticed those markings!",t,"I find myself in a bind now, this here is the best rag I've ever had for cleaning my blades!",t,"I'll tell you what, if you can get me a new rag, I'd be willing to let you have this one here."},1)
							if(player:hasItem("soft_rag",1) == true) then
								player:removeItem("soft_rag",1)
								player.registry["icelabyrinthquest"]=5
								player:addItem("second_map_piece",1)
								player:dialogSeq({t,"Ah, it's a fine rag you brought me here... Alright, take this one if you want it so much!"})
							end
						end										
				  end
                                end
        end),
         
        say=async(function(player,npc)
        local t={graphic=convertGraphic(486,"monster"),color=21}
        local opts = { }
        local wood = { }
	local s=player.speech
        if(string.find(string.lower(s),"token")~=nil) then
            player:dialogSeq({t,"Oh you want some of those blank tokens I've been making for Xanthir?",t,"I will gladly do it, alas I do not have any piece of wood left to carve.\n\nIf you find me one, I will make you some, free of charge.",t,"Just tell me when you have the wood"})
        end
        if(string.find(string.lower(s),"wood")~=nil) then
            if(player:hasItem(13,1) == true) then table.insert(wood,"Draazok's club") end
	    if(player:hasItem(185,50) == true) then table.insert(wood,"50 Ash logs") end
	    table.insert(wood,"I have nothing you could use")

	local choice=player:menuString2("What do you want me to make a Wood token from?",wood)

		if(choice=="Draazok's club") then
				player:removeItem(13,1)
				player:addItem(26,1)
		elseif(choice=="50 Ash logs") then
				player:removeItem(185,50)
				player:addItem(26,1)
		end

	
        end
	if(string.find(string.lower(s),"rope")~=nil) then
		if(player.registry["thewell"]>0 and player.registry["thewell"]<6) then
		player:dialogSeq({t,"You need some rope huh ? Well let me tell you what...",t,"I got some nice and strong rope around here, but Xanthir has borrowed some of my tools and I can't afford to leave my shop to pay him a visit",t,"If you do me a favor and get me my tools back, I will give you some rope, free of charge!"})
		end
	end

	if(string.find(string.lower(s),"farral's ax")~=nil) then
		if(player.registry["thewell"]==5 and player:hasItem(166,1) == true) then
			if(not player:dialogSeq({t,"Hey you brought it back! That's very nice of you, now I don't have to worry about leavng my shop.",t,"I made you a promise, so here's the rope, I hope it'll suit your needs!"},1)) then
					return false
			end
			player.registry["thewell"]=6
			player:removeItem(166,1)
			player:sendMinitext("Farral gives you the promised rope.")
			player:addItem(79,1)
		end
	end
	if(string.find(string.lower(s),"repair all")~=nil) then
		player:repairAll(player,npc)
	end

        end)
}