radjiv = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(932,"monster"),color=0}
		local opts = { }
		local faces = { }

                player.npcGraphic=t.graphic
		player.npcColor=t.color
                table.insert(opts,"Face change")
                table.insert(opts,"Gender change")
		
		table.insert(faces,"Fearless")
		table.insert(faces,"Mischievous")
		table.insert(faces,"Wide eyed")
		table.insert(faces,"Foxy")
		table.insert(faces,"Brows")
		table.insert(faces,"Modest")
		table.insert(faces,"Hopeful")
		table.insert(faces,"Blanked")
		table.insert(faces,"Cherry")
		table.insert(faces,"Intense")
		table.insert(faces,"Doubtful")
		table.insert(faces,"Sad")
		table.insert(faces,"Satisfied")
		table.insert(faces,"Jumpy")
		table.insert(faces,"Tired")
		table.insert(faces,"Squinty")
		table.insert(faces,"Joyful")
		table.insert(faces,"Naughty")
		table.insert(faces,"Mysterious")
		table.insert(faces,"Passionate")	
   
                local menuOption=player:menuString("Hey there. Are you not happy with your body?",opts)

			if(menuOption=="Face change") then
				player:dialogSeq({t,"If you are unhappy with your face, I can get some work done on it. It will cost you 2,000 coins. Press next if you want to proceed."},1)
				local choice=player:menuString2("Please select a face. It will cost you 2,000 coins.",faces)
					if(choice=="Fearless") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=201
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Mischievous") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=202
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Wide eyed") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=203
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Foxy") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=204
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Brows") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=205
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Modest") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=207
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Hopeful") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=208
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Blanked") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=209
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Cherry") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=210
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Intense") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=211
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Doubtful") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=212
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Sad") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=213
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Satisfied") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=214
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Jumpy") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=215
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Tired") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=216
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Squinty") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=217
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Joyful") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=218
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Naughty") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=224
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Mysterious") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=225
						player.money=player.money-2000
						player:sendAnimation(6)
					elseif(choice=="Passionate") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.face=229
						player.money=player.money-2000
						player:sendAnimation(6)
					end
					player:updateState()
					player:sendStatus()
			elseif(menuOption=="Gender change") then
				if(player.spouse~=0) then
					player:dialogSeq({t,"I am sorry, but you may not change gender if you have a partner."})
					return
				end
				player:dialogSeq({t,"If you are unhappy with your gender, I can change it. It will cost you 10,000 coins."},1)
				local choice=player:menuString2("Are you sure you wish to change Gender ? It will cost 10,000 coins.",{"Yes","No"})
				if(choice=="Yes") then
					if(player.money>=10000) then
						if(player.sex==0) then
							player.sex=1
						elseif(player.sex==1) then
							player.sex=0
						end
						player.money=player.money-10000
						player:sendAnimation(6)
						player:updateState()
						player:sendStatus()
						player:dialogSeq({t,"It is done."})
					else
						player:dialogSeq({t,"You do not have the money. I do not work for free."})
					end
				else
					player:dialogSeq({t,"Suit yourself."})
				end
			end
        end)

}