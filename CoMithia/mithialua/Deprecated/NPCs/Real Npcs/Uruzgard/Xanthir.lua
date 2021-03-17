xanthir = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(41,"monster"),color=3}
	        local opts = { }

                player.npcGraphic=t.graphic
		player.npcColor=t.color
                table.insert(opts,"Buy")
                table.insert(opts,"Sell")
		if(player.level>=8 and player.class==3 and player.registry["freezequest"]<2) then
		     	table.insert(opts,"Magic insight")
		end
		if(player.level>=45 and player.class==3 and player.registry["freezequest"]>=2) then
			table.insert(opts,"Arcane upgrade")
		end 
		if(player.level>=80 and player.class==3 and player.registry["freezequest"]>=3) then
			table.insert(opts,"Magical mending")
		end
		if(player.level>=80 and player.class==3 and player.registry["freezequest"]>=4) then
			table.insert(opts,"Thor's wrath")
		end   
                                  local menuOption=player:menuString("Welcome at Xanthir's. Can I help you?",opts)
                                  if(menuOption=="Buy") then
                                     player:buyExtend("What do you wish to buy?",{27,749})
                                  elseif(menuOption=="Sell") then
                                     player:sellExtend("What do you wish to sell?",{27,207,244,375,350})
				  elseif(menuOption=="Magic insight" and player.class==3) then
				     if(player.registry["freezequest"]==0) then
					player:dialogSeq({t,"Ah, I see that, like me, you've opted for the power of magic.",t,"I'm not a bad mage myself you know, and with a few years of research I've managed to toy with powers of magic to create a few interesting spells.",t,"I'm not a secretive person, so I'd gladly help you learn some of them, should you do me a favor.",t,"Get me an Amethyst and some Petrified root, for starters, as I'm fresh out of those for my potions."},1)
						if(player:hasItem(66,1) == true and player:hasItem(207,1) == true) then
							player:dialogSeq({t,"Ah! You brought them with you. That's a good start, thank you."},1)
							player:removeItem(66,1)
							player:removeItem(207,1)
							player.registry["freezequest"]=1
							player:flushKills()
							player:dialogSeq({t,"Now let's see... you seem strong enough... Some of these barbarics soldiers in the Western cave have been raiding my shop every so often to steal my ingredients. If you could go and get rid of the problem for me... I'd be in your debt."})
			                	end
				    elseif(player.registry["freezequest"]==1) then
					if((player:killCount(16)+player:killCount(17))>=10 and player:killCount(18)>=1) then
						player:dialogSeq({t,"Seems like you've taken care of the problem for me. I'm a man of my word, so here it is...  use that spell wisely.","-Xanthir gives you a scroll that you begin to read-"},1)
						player:sendMinitext("Your mind expands as you learn Freeze")
						player:addSpell(303)
						player.registry["freezequest"]=2
					else
						player:dialogSeq({t,"Those damn cavemen from the Western cave are really terrible for business, please get rid of the problem for me."})
					end      
				    end
				  elseif(menuOption=="Arcane upgrade" and player.class==3 and player.registry["freezequest"]==2) then
					player:addSpell(303)
					player:dialogSeq({t,"I see you've acquired a lot of exeperience now, and you should know there are ways to upgrade the spell I taught you.",t,"I have a friend who's a big adventurer. He often likes to go on treasure hunting trips, hoping to find fortune and money. But between you and me... he's not much of a daredevil.",t,"He said he would a good amount of money if I gave him something to help him, and I've heard some kind of pirates can be found in a creek near the harbor.",t,"Pirates often carry treasures and sometimes maps to where they stashed it. If you could get me their map, I would reward you greatly."},1)
					if(player:hasItem(357,1) == true) then
						player:dialogSeq({t,"Ah, I see you found it! My friend is going to be quite satisfied."},1)
						player:removeItem(357,1)
						player:giveXP(30000)
						player:sendMinitext("Xanthir awards you with 5000 coins.")
						player.money=player.money+5000
						player:removeSpell(303)
						player:addSpell(318)
						player:sendStatus()
						player:updateState()
						player.registry["freezequest"]=3
						player:dialogSeq({"Your Freeze spell has been Upgraded to Stop."})
					end
				  elseif(menuOption=="Arcane upgrade" and player.class==3 and player.registry["freezequest"]>2) then
					player:dialogSeq({t,"I hope you're enjoying Stop.\n\n((In case you lost your spell Stop, this dialog allows you to relearn it. Press Next to proceed.))"},1)
					player:addSpell(318)
				  elseif(menuOption=="Magical mending" and player.class==3) then
					if(player.registry["freezequest"]==3) then
						player:dialogSeq({t,"I'm sure you have noticed it is sometimes quite dangerous to roam the world while encountering monsters, even when you have a poet by your sides. Since we are frequently hurt by Converting our health into mana, we have a way of getting by.",t,"If you prove me your skills as a mage and bring me back a Serpent's Eye as well as a Serpent's head, I will teach you how to use that spell."},1)
							if(player:hasItem("serpents_head",1) == true and player:hasItem("serpents_eye",1) == true) then
								player.registry["freezequest"]=4
								player:removeItem("serpents_head",1)
								player:removeItem("serpents_eye",1)
								player:addSpell("magical_mending")
								player:dialogSeq({t,"Ah, you brought them back. I believe you have earned the right to mend your wounds through magic. Good luck in your future endeavors."})
							end
					elseif(player.registry["freezequest"]>=4) then
						player:dialogSeq({t,"I hope you're enjoying Magical mending.\n\n((In case you lost your spell Magical mending, this dialog allows you to relearn it. Press Next to proceed.))"},1)
						player:addSpell("magical_mending")
					end
				  elseif(menuOption=="Thor's wrath" and player.class==3) then
					if(player.registry["freezequest"]==4) then
						player:dialogSeq({t,"Mages are masters of damage and pain.",t,"We are able to unleash our power on multiple creatures through great magic, but we are also able to concentrate much magic into a powerful force, devasating your target.",t,"Show me you can master pain by defeating the Avatar of Pain inside Gruzar's fortress, and only then will you become a true and powerful mage. Bring me back 25 Soulstones as well for my experiments."},1)
							if(player:killCount(87)>0 and player:hasItem("soulstone",25) == true) then
								player.registry["freezequest"]=5
								player:removeItem("soulstone",25)
								player:addSpell("thor_wrath")
								player:dialogSeq({t,"Very well, I believe you have earned the right to call yourself a Mage now."})
							end
					elseif(player.registry["freezequest"]>=5) then
						player:dialogSeq({t,"I hope you're enjoying Thor's wrath.\n\n((In case you lost your Thor's wrath spell, this dialog allows you to relearn it. Press Next to proceed.))"},1)
						player:addSpell("thor_wrath")
					end
                               	  end

        end),
       say=async(function(player,npc)
       local t={graphic=convertGraphic(41,"monster"),color=3}
       player.npcGraphic=t.graphic
       player.npcColor=t.color
       local opts = { }
       local s=player.speech
       if(string.find(string.lower(s),"safety token")~=nil) then
          player:dialogSeq({t,"Oh yes, those are really helpful. They're not so hard to make either!",t,"All you'll need is a Wood token and a bag of Magical powder to infuse magic in the piece of wood.",t,"Unfortunately, I do not have any tokens leftovers but you should ask Farral, he's been my supplier for years.",t,"When you have the elements, you can combine them using the creation system ((Shift-I to activitate))"})
       end


	if(string.find(string.lower(s),"chestnuts")~=nil and player.registry["thewell"]==2) then
				player:dialogSeq({t,"I will need five dozen chestnuts to be able to make the powder, did you bring them to me?"},1)
				if(player:hasItem(5,60) == true) then
					player.registry["thewell"]=3
					player:removeItem(5,60)
					player:addItem(164,1)
					player:dialogSeq({t,"Here, take this powder, it should help you finding the missing tools."})				
				end
	end
	if(string.find(string.lower(s),"farral's tools")~=nil) then
		if(player.registry["thewell"]==1 or player.registry["thewell"]==2) then
			player:dialogSeq({t,"So he has sent you to bring back his tools? That's so unfortunate...",t,"I am really confused, but I don't have them anymore...",t,"I could tell you what happened... but you must promise not tell him!"},1)
			local choice=player:menu2("Promise not to tell Farral ?",{"Yes","No"})
				if(choice==1) then
					player.registry["thewell"]=2
					 player:dialogSeq({t,"Here is what happenned.\n\nI somehow lost the tools in Mithia while I was heading north to visit a friend.",t,"The best way to look for them is probably to look around Mithia, but I'm afraid even a keen eye might not be enough",t,"I could help enhance your vision with a special powder but I'd need a high amount of chemicals to create it. Five dozen Chestnuts should be enough!"},1)
				elseif(choice==2) then
					player:dialogSeq({t,"Then I can't trust you."})
				end
		end
	end
       end)
}