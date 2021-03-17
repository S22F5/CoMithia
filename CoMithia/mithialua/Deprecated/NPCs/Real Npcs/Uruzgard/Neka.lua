npc120707 = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(510,"monster"),color=10}
	        local amount	
                local total  	 
                local money     

		if player.registry["neka"]==0 then
			player:dialogSeq({t,"Welcome in my Humble home.\n\nWhile digging in my basement, I stumbled onto something unexpected",t,"A Tunnel that leads to what appears to be an ancient system of sewers.",t,"The problem is that these sewers seem to be plagued by dangerous creatures.",t,"It seems those creatures are being controlled by some sort of magical runes.",t,"Being far from experienced, I haven't been able to explore much unfortunately.",t,"Hey! Maybe you could help me!\n\nIf you venture there and slay enough of those creatures for me, I will reward you!"},1)
                player.registry["neka"]=1
                elseif player.registry["neka"]==1 then
		        if player:hasItem("Control rune",10) == true then
				player:removeItem("Control rune",10)
				player.registry["neka"]=2
				player:dialogSeq({t,"Ah! I see you've gathered some of those control runes.\n\nDo you want to help me more?"},1)
                                player:giveXP(500)
                        else player:dialogSeq({t,"I'll be waiting for evidence that the sewers are now safer."}) 
                        end
                elseif player.registry["neka"]==2 then                
                       player:dialogSeq({t,"These runes only make my concerns higher. I am interested in finding who the puppetmaster is.",t,"If you venture deep enough and manage to slain the master of these monsters and bring me back the object he uses to do so, I will greatly appreciate it."},1) 
                         if player:hasItem("Helm of Control",1) == true then
				player:removeItem("Helm of Control",1)
                                player:giveXP(700)
                                player:flushKills()
                                player.registry["neka"]=3
                                player:dialogSeq({t,"Fantastic! You have found it!\n\nYou Really were helpful but I could use your help for one last thing...",1})
                         else player:dialogSeq({t,"Please bring me back the control device"})
                         end
                elseif player.registry["neka"]==3 then
                         player:dialogSeq({t,"I have seen a big monster carrying some kind of wood wandering around, it seems to like water.",t,"If you can bring me back this piece of wood I will make it worth your time by teaching you some nice technique.",t,"However the monster is dangerous, so you'll probably have to grab the piece from it's dead body."},1)
                         if player:hasItem("Draazok's Club") == true then
                               if player:killCount(14)>=1 then
                                    player:giveXP(1000)
                                    player:addSpell(2)
                                    player:sendMinitext("Your mind expands as you learn City Portal")
                                    player.registry["neka"]=4                               
                                    player:addLegend("Helped Neka with the ancient sewers (Year " .. player:curYear() .. ", " .. player:getCurSeason() .. ")","neka",5,128)
                                    player:dialogSeq({t,"*Stares at you in glare*\n\nAmazing, you made it! I really thought I wouldnt see you return.",t,"As promised here is your reward. This spell will let you teleport to the main city gates with a simple incantation.",t,"However, it will only work if you're already in the city!",t,"My deepest thanks for the help you provided me."})
                               else player:dialogSeq({t,"Haven't managed to slay this thing yet eh ?"})
                               end
                         else player:dialogSeq({t,"I'll be waiting for the piece of wood"})
                         end
                 elseif player.registry["neka"]==4 then
			     player:addSpell(2)
                             player:dialogSeq({t,"Thanks for having Helped me. I'm still collecting those Control runes, would you like to sell me some?"},1)			     
                             player.npcGraphic=t.graphic
			     player.npcColor=t.color
                             player:sellExtend("What do you wish to sell me?",{"Control rune"})

                 end
        end)
}