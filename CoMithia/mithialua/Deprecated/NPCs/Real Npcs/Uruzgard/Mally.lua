mally = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(637,"monster"),color=30}
	        local opts = { }
		local optsbuy ={ }
		local menuOption
		local menuOptionBuy

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")
                              table.insert(opts,"Sell")
				if(player.level>=16 and player.registry["poetpathquest"]>=0 and player.class==4) then
					table.insert(opts,"Poet's love")
				end
				if(player.level>=57 and player.registry["poetpathquest"]>=1 and player.class==4) then
					table.insert(opts,"Poet's wrath")
				end
				if(player.level>=86 and player.registry["poetpathquest"]>=2 and player.class==4) then
					table.insert(opts,"Guardian")
				end
				if(player.level>=99 and player.registry["poetpathquest"]>=3 and player.class==4) then
					table.insert(opts,"Reincarnate")
				end
			      table.insert(optsbuy,"Mage garbs") 
			      table.insert(optsbuy,"Mage dresses") 
			      table.insert(optsbuy,"Poet robes") 
			      table.insert(optsbuy,"Poet gowns")     
                              if(#opts~=0) then
                                  menuOption=player:menuString("Hey there, care to try my newest outfits?",opts)
                                  if(menuOption=="Buy") then
						menuOptionBuy=player:menuString("What kind of object would you like to buy ?",optsbuy)
							if(menuOptionBuy=="Mage garbs") then
								player:buyExtend("What do you wish to buy?",{89,90,91,92,93,94,95,96,97})
							elseif(menuOptionBuy=="Mage dresses") then
								player:buyExtend("What do you wish to buy?",{128,129,130,131,132,133,134,135,136})
							elseif(menuOptionBuy=="Poet robes") then
								player:buyExtend("What do you wish to buy?",{98,99,100,101,102,103,104,105,106})
							elseif(menuOptionBuy=="Poet gowns") then
								player:buyExtend("What do you wish to buy?",{139,140,141,142,143,144,145,146,147})
							end
                                 elseif(menuOption=="Sell") then
                                     player:sellExtend("What do you wish to sell?",{89,90,91,92,93,94,95,96,97,127,128,129,130,131,132,133,134,135,136,138,98,99,100,101,102,103,104,105,106,139,140,141,142,143,144,145,146,147})
                                 elseif(menuOption=="Poet's love" and player.class==4) then
					if(player.registry["poetpathquest"]==0) then
					player:dialogSeq({t,"Hello !\n\n-Mally smiles at you-\n\nA lot people usually depend on the care that we, Poets, provide them. Sometimes... Our best care just isn't enough though, and tragedies happen.",t,"I will help you learn how to fix those situations that turned bad if you help me as well!",t,"I am trying to create a love potion for this gorgeous boy I've met at the beach, but I still need a Begynall eye to complete it",t,"... It's the first love potion I make and I have absolutely no idea what a Begynall is... If you could get one for me, it'd be sooooo generous of you!"},1)
						if(player:hasItem("begynall_eye",1) == true) then
							player:removeItem("begynall_eye",1)
							player.registry["poetpathquest"]=1
							player:addSpell("heavens_kiss")
							player:dialogSeq({t,"Yuck! That's what a Begynall's eye is? ... and I have to make him drink that? -Grumbles- That's going to take some effort...",t,"Well, thank you for bringing it back to me, you truly are an angel!"},1)
							player:dialogSeq({"Mally spends some time with you until you understand what she's trying to teach you."})
						end
					elseif(player.registry["poetpathquest"]>=1) then
						player:dialogSeq({t,"I hope you've been showing love around!\n\n((In case you lost your Heaven's Kiss spell, this dialog allows you to relearn it. Press Next to proceed.))"},1)
						player:addSpell("heavens_kiss")
					end 
                                 elseif(menuOption=="Poet's wrath" and player.class==4) then
					if(player.registry["poetpathquest"]==1) then
					player:dialogSeq({t,"Hello again!\n\nDon't you find it irritating when all those monsters crawl around you trying to take a bite at you? I'm sure the Oracle has taught you about the benefits of retribution, yet sometimes it just isn't enough...",t,"The boy I met at the beach, I saw him enter some weird and ancient cave a while ago, while I was following him south of town, and he hasn't come out yet...",t,"I would really appreciate if you went and gathered news about him there, I'd even tell you how to make your retribution even better!"},1)
						if(player:hasItem("dhaar_head",1) == true) then
							player:removeItem("dhaar_head",1)
							player.registry["poetpathquest"]=2
							player:addSpell("thorne_aura")
							player:dialogSeq({t,"OH MY GOD THAT'S HIS HEAD!!",t,"-She starts crying for a few minutes, unable to calm down-",t,"-sobbing-\n\nI should have known my luck would run out! how am I going to live without him now...",t,"-she now seems angry-\n\nI'm going to teach you how to avenge his death!"},1)
							player:dialogSeq({"Mally spends some time with you until you understand what she's trying to teach you."})
						end				
					elseif(player.registry["poetpathquest"]>=2) then					
						player:dialogSeq({t,"I hope you've been teaching these monsters a lesson!\n\n((In case you lost your Thorne Aura spell, this dialog allows you to relearn it. Press Next to proceed.))"},1)
						player:addSpell("thorne_aura")
					end
                                 elseif(menuOption=="Guardian" and player.class==4) then
					if(player.registry["poetpathquest"]==2) then
					player:dialogSeq({t,"Hello again!\n\nIt is often very messy to manage to protect someone because there are so many spells to cast.",t,"Thankfully, us Poets found a way to condensate all the strongest spells in a single one, the epitome of protection, Guardian.",t,"I have been told that it was the Pirates who sent Dhaar to his end by forcing him into the Ancient cave. I will teach you how to use Guardian should you defeat their leaders."},1)
						if(player:killCount(95)>=1 and player:killCount(96)>=1) then
							player.registry["poetpathquest"]=3
							player:addSpell("guardian")
							player:dialogSeq({t,"That will show them!",t,"Thanks a lot for your help, I will not forget it. I am certain you will this spell incredibly useful."},1)
							player:dialogSeq({"Mally spends some time with you until you understand what she's trying to teach you."})
						end				
					elseif(player.registry["poetpathquest"]>=3) then					
						player:dialogSeq({t,"Thanks again for your help!\n\n((In case you lost your Guardian spell, this dialog allows you to relearn it. Press Next to proceed.))"},1)
						player:addSpell("guardian")
					end
                                 elseif(menuOption=="Reincarnate" and player.class==4) then
					if(player.registry["poetpathquest"]==3) then
					player:dialogSeq({t,"My brother is an officer in the Mithia army. He told me Gaorg was in fact working for Gruzar all along!",t,"I want revenge! You need to get rid of the Avatar of Suffering, for I have suffered from Dhaar's loss.",t,"I will also need 25 Soulstones... There might still be a way to bring him back to life...",t,"If you help me, I will teach you one of our strongest perks, how to Reincarnate yourself."},1)
						if(player:killCount(89)>=1 and player:hasItem("soulstone",25) == true) then
							player.registry["poetpathquest"]=4
							player:removeItem("soulstone",25)
							player:addSpell("reincarnate")
							player:dialogSeq({t,"Very well, my loss is now avenged... The suffering is no more... perhaps it is time to move on."},1)
							player:dialogSeq({"Mally explains to you the inner workings of reincarnate."})
						end				
					elseif(player.registry["poetpathquest"]>=4) then					
						player:dialogSeq({t,"Thanks again for your help!\n\n((In case you lost your Reincarnate spell, this dialog allows you to relearn it. Press Next to proceed.))"},1)
						player:addSpell("reincarnate")
					end
				end
			      end
	end),
       say=async(function(player,npc)
       local t={graphic=convertGraphic(637,"monster"),color=30}
       player.npcGraphic=t.graphic
       player.npcColor=t.color
       local opts = { }
       local s=player.speech
       if(string.find(string.lower(s),"rag")~=nil and player.registry["icelabyrinthquest"]==3) then
          player:dialogSeq({t,"You want to make a rag? That's not that hard,",t,"Bring me some Wool fabric and I'll make one for you."},1)
		if(player:hasItem("wool_fabric",10) == true) then
			local item
			local invcheck=0
			for x=0,25 do
				item=player:getInventoryItem(x)
				if(item==nil) then
					invcheck=invcheck+1
				end
			end
			if(invcheck>0) then
				player.registry["icelabyrinthquest"]=4
				player:removeItem("wool_fabric",10)
				player:addItem("soft_rag",1)
				player:dialogSeq({t,"Here you go, a clean new Rag, hope you enjoy it! Have a good day."})
			else
				player:dialogSeq({t,"Please free up one space in your inventory."})
			end
		end
       end
       end)
}