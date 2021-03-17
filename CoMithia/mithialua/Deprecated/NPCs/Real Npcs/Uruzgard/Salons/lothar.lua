lothar = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(214,"monster"),color=3}
		local opts = { }
		local hair = { }
		local haircolors = { }

                player.npcGraphic=t.graphic
		player.npcColor=t.color
                table.insert(opts,"Hairstyle")
                table.insert(opts,"Hair dye")
		table.insert(opts,"Beard")
		
		table.insert(hair,"Pony tail")
		table.insert(hair,"Headband")
		table.insert(hair,"Braided pigtails")
		table.insert(hair,"The Flip")
		table.insert(hair,"Pigtails")
		table.insert(hair,"Headwrap")
		table.insert(hair,"Pulled back")
		table.insert(hair,"The Snaketail")
		table.insert(hair,"Chonmage")
		table.insert(hair,"Skin head")
		table.insert(hair,"Bedhead")
		table.insert(hair,"The Mona Lisa")
		table.insert(hair,"The Bandit")
		table.insert(hair,"Morning rush")
		table.insert(hair,"The School girl")
		table.insert(hair,"Wing cut")
		table.insert(hair,"Double buns")
		table.insert(hair,"The Batman")
		table.insert(hair,"The Dorothy")
		table.insert(hair,"The Elvis")
		table.insert(hair,"The Arnold")
		table.insert(hair,"The Broom")
		table.insert(hair,"The Hidden Danger")
		table.insert(hair,"Shoulder bangs")
		table.insert(hair,"The Khan")
		table.insert(hair,"The Jester")
		table.insert(hair,"The Bear")
		table.insert(hair,"The French braid")
		table.insert(hair,"The Guido")
		table.insert(hair,"The Hermit")
		table.insert(hair,"The Hag")
		table.insert(hair,"The Afro")
		table.insert(hair,"The French fry")
		table.insert(hair,"The Paperboy")
		table.insert(hair,"The Retro")
		table.insert(hair,"Double Horns")
		table.insert(hair,"The Yarrr")
		table.insert(hair,"The Mugatu")
		table.insert(hair,"The Noodles")
		table.insert(hair,"The Princess")

		table.insert(haircolors,"Natural")
		table.insert(haircolors,"White")
		table.insert(haircolors,"Lime")
		table.insert(haircolors,"Strawberry")
		table.insert(haircolors,"Turquoise")
		table.insert(haircolors,"Black")
		table.insert(haircolors,"Blonde")
		table.insert(haircolors,"Crimson")
		table.insert(haircolors,"Chestnut")
		table.insert(haircolors,"Orchid")
		table.insert(haircolors,"Forest green")

   
                local menuOption=player:menuString("Hey there. Looking for a haircut? Maybe some highlights?",opts)

			if(menuOption=="Hairstyle") then
				player:dialogSeq({t,"So... What kind of work do you want done? It will cost you 2,000 coins. Press next if you want to proceed."},1)
				local choice=player:menuString2("Please select a Hairstyle. It will cost you 2,000 coins.",hair)
					if(choice=="Pony tail") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=7
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Headband") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=8
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Braided pigtails") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=11
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Flip") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=12
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Pigtails") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=13
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Headwrap") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=14
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Pulled back") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=15
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Snaketail") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=16
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Chonmage") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=18
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Skin head") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=19
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Bedhead") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=21
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Mona Lisa") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=22
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Bandit") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=24
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Morning rush") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=31
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The School girl") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=34
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Wing cut") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=37
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Double buns") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=41
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Batman") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=43
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Dorothy") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=45
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Elvis") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=47
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Arnold") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=48
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Broom") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=53
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Hidden Danger") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=54
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Shoulder bangs") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=55
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Khan") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=57
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Jester") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=61
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Bear") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=66
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The French braid") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=67
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Guido") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=68
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Hermit") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=71
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Hag") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=72
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Afro") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=74
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The French fry") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=76
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Paperboy") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=80
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Retro") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=85
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Double Horns") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=86
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Yarrr") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=90
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Mugatu") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=93
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Noodles") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=98
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="The Princess") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hair=99
						player.money=player.money-2000
						player:sendAnimation(9)
					end
					player:updateState()
					player:sendStatus()

			elseif(menuOption=="Hair dye") then
				player:dialogSeq({t,"Do you want a dye applied to your hair? It will cost you 2,000 coins."},1)
				local choice=player:menuString2("What Color do you desire? It will cost 2,000 coins.",haircolors)
					if(choice=="Natural") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=0
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="White") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=1
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="White") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=1
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Lime") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=5
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Strawberry") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=11
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Turquoise") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=12
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Black") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=18
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Blonde") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=20
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Crimson") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=21
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Chestnut") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=26
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Orchid") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=29
						player.money=player.money-2000
						player:sendAnimation(9)
					elseif(choice=="Forest green") then
						if(player.money<2000) then
							player:dialogSeq({t,"You do not have enough money. I do not work for free."})
							return
						end
						player.hairColor=32
						player.money=player.money-2000
						player:sendAnimation(9)
					end
					player:updateState()
					player:sendStatus()
				
			elseif(menuOption=="Beard") then
				player:dialogSeq({t,"Coming soon."})
			end
        end)

}