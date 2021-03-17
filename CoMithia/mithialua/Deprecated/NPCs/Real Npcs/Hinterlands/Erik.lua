erik_the_shepherd = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(543,"monster"),color=21}
	        local opts = { }
		local op = { }
		local optsmap = { }
		local optsmap2 = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Yes")     
   			      table.insert(opts,"No")
			      table.insert(op,"Shepherding")
			      if(player.registry["neka"]==4 and player.registry["hinterlandsportal"]<6) then
					table.insert(op,"Hinterlands geography")
			      end
			      if(player.registry["icelabyrinthquest"]==1 or player.registry["icelabyrinthquest"]==2) then
					table.insert(op,"Labyrinth Map")
			      end
			      table.insert(optsmap,"I come about a map for the Labyrinth")
		              table.insert(optsmap,"Nothing, nevermind.")
			      table.insert(optsmap2,"Please, this is an important matter!")
			      table.insert(optsmap2,"Sorry to have bothered you.")

			      local choice=player:menuString("Hello there, traveller",op)
				
				if(choice=="Shepherding") then
					player:dialogSeq({t,"Hello, I've watched you admire my flock of sheep",t,"Those are a special breed, not meant for food but for their fine wool",t,"I have some extra Shears I could sell you if you wanted to try your hand at it, but be warned,  they don't like it and will fight back"},1)
                                     	player:buyExtend("I have these perfect shears for you, take a look:",{"basic_shears","sturdy_shears"})
			        elseif(choice=="Hinterlands geography") then
					if(player.registry["hinterlandsportal"]==0 or player.registry["hinterlandsportal"]==1) then
						player.registry["hinterlandsportal"]=1
						player:dialogSeq({t,"I see that you know about the quite powerful magic of the Portals.",t,"In big areas like the hinterlands, one could find of great use the ability to transport instantly on to the main roads.",t,"If you explore the Hinterlands and learn to know them, you should be able to use your Portals in here."})
					elseif(player.registry["hinterlandsportal"]>1 and player.registry["hinterlandsportal"]<5) then
						player:dialogSeq({t,"You've explored quite a bit of the Hinterlands, my friend, but not quite enough of them just yet"})
					elseif(player.registry["hinterlandsportal"]==5) then
						player:dialogSeq({t,"Woah, you probably know at least as much as I do of the hinterlands now, I'm sure you'll be able to use that magic, I just hope it won't hurt my sheep."},1)
						player.registry["hinterlandsportal"]=6
					end
			        elseif(choice=="Labyrinth Map" and player.registry["icelabyrinthquest"]==1) then
					local menuOption=player:menuString2("What can I do for you",optsmap)
						if(menuOption=="I come about a map for the Labyrinth") then
							player:dialogSeq({t,"Map? Hrm.. you don't mean the ancient patch that was embroidered onto my robe do you? I guess it could be interpreted as a piece of a map... but I just figured it was old linen.",t,"I don't think I can part with this, you see it is a vital part of my clothing, it stops the draft from giving me a chill."},1)
							local menuOption2=player:menuString2("I'm sorry, I cant just give it to you",optsmap2)	
								if(menuOption2=="Please, this is an important matter!") then
									player:dialogSeq({t,"I guess I would be willing to hand it over if you are able to bring me some linen to re-patch this old robe with. I think some Wool will do the job, I'll just knit it myself."},1)
									if(player:hasItem("wool",25) == true) then
										local item
										local invcheck=0
										for x=0,25 do
											item=player:getInventoryItem(x)
											if(item==nil) then
												invcheck=invcheck+1
											end
										end
										if(invcheck>0) then
											player:removeItem("wool",25)
											player.registry["icelabyrinthquest"]=2
											player:addItem("first_map_piece",1)
											player:dialogSeq({t,"I see you have returned with the patch I require. As a man of honor, I will stand true to my word. The old patch is yours, though I don't think it will be much use to you.",t,"I have seen one more like it before, it looked rather odd and out of place so caught my attention.",t,"You might want to talk to Farral, I believe he has a rag he uses to clean his swords that looks similar to this patch."})
										else
											player:dialogSeq({t,"Please free up one space in your inventory."})
				
										end
									end
								end
						end
				elseif(choice=="Labyrinth Map") then
					player:dialogSeq({t,"I hope this old piece will help you out.",t,"You might want to talk to Farral, I believe he has a rag he uses to clean his swords that looks similar to this patch."})
			       end
        end)

}