forge = {
	click=async(function(player,npc)

		local opts = {}
		local optscurrent = { }
		local t={graphic=convertGraphic(827,"monster"),color=0}

                        player.npcGraphic=t.graphic
		        player.npcColor=t.color
	if(player:hasItem("tin_ore",5) == true) then
		table.insert(opts,"Tin ore")
	end
	if(player:hasItem("bronze_ore",5) == true) then
		table.insert(opts,"Bronze ore")
	end
	if(player:hasItem("copper_ore",5) == true) then
		table.insert(opts,"Copper ore")
	end
	if(player:hasItem("silver_ore",5) == true) then
		table.insert(opts,"Silver ore")
	end
	if(player:hasItem("iron_ore",5) == true) then
		table.insert(opts,"Iron ore")
	end
	if(player:hasItem("gold_ore",5) == true) then
		table.insert(opts,"Gold ore")
	end
	table.insert(opts,"I do not have any ore to smelt")



	table.insert(optscurrent,"Put more ore")
	table.insert(optscurrent,"Nevermind")

		local craftlevel="Beginner"
		if(player.registry["smelter"]>=1 and player.registry["smelter"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["smelter"]>=25 and player.registry["smelter"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["smelter"]>=220 and player.registry["smelter"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["smelter"]>=840 and player.registry["smelter"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["smelter"]>=2200 and player.registry["smelter"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["smelter"]>=6400 and player.registry["smelter"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["smelter"]>=18000 and player.registry["smelter"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["smelter"]>=50000 and player.registry["smelter"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["smelter"]>=124000 and player.registry["smelter"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["smelter"]>=237000 and player.registry["smelter"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["smelter"]>=400000 and player.registry["smelter"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["smelter"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("smelter")
		player:addLegend(""..craftlevel.." smelter","smelter",76,128)	

	local choice=player:menuString2("Hello, "..player.name..", Which Ore do you wish to smelt?",opts)
		
		if(choice=="Tin ore" and player:hasItem("tin_ore",5) == true) then
			t={graphic=convertGraphic(291,"item"),color=13}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			player:removeItem("tin_ore",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["smelter"]<25) then
				local x=math.random(1,100)
				if(x<10) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=10 and x<50) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=25 and player.registry["smelter"]<220) then
				local x=math.random(1,100)
				if(x<15) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=15 and x<55) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=220 and player.registry["smelter"]<840) then
				local x=math.random(1,100)
				if(x<20) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=20 and x<60) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=840 and player.registry["smelter"]<2200) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<60) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end

			elseif(player.registry["smelter"]>=2200 and player.registry["smelter"]<6400) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<65) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=6400 and player.registry["smelter"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=18000 and player.registry["smelter"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=50000 and player.registry["smelter"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=124000 and player.registry["smelter"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=237000 and player.registry["smelter"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end

			elseif(player.registry["smelter"]>=400000 and player.registry["smelter"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("tin_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("tin_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem(181,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("tin_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
	
			end
		player:sendAnimation(46)
























		elseif(choice=="Bronze ore" and player:hasItem("bronze_ore",5) == true) then
			t={graphic=convertGraphic(291,"item"),color=18}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["smelter"]<220) then
					player:dialogSeq({t,"You are not experienced enough to smelt Bronze ore."})
					return
			end
			player:removeItem("bronze_ore",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["smelter"]>=220 and player.registry["smelter"]<840) then
				local x=math.random(1,100)
				if(x<20) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=20 and x<60) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=840 and player.registry["smelter"]<2200) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<60) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end

			elseif(player.registry["smelter"]>=2200 and player.registry["smelter"]<6400) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<65) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=6400 and player.registry["smelter"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=18000 and player.registry["smelter"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=50000 and player.registry["smelter"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=124000 and player.registry["smelter"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=237000 and player.registry["smelter"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end

			elseif(player.registry["smelter"]>=400000 and player.registry["smelter"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("bronze_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("bronze_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("bronze_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("bronze_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
	
			end
			player:sendAnimation(46)





























		elseif(choice=="Copper ore" and player:hasItem("copper_ore",5) == true) then
			t={graphic=convertGraphic(291,"item"),color=7}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["smelter"]<2200) then
					player:dialogSeq({t,"You are not experienced enough to smelt Copper ore."})
					return
			end
			player:removeItem("copper_ore",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()

			if(player.registry["smelter"]>=2200 and player.registry["smelter"]<6400) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					--Copper Skill Bonus--
					s=s*2
					--Copper Skill Bonus--
					player:addItem("copper_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<65) then
					if(player:hasItem("copper_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("copper_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--Copper Skill Bonus--
									s=s*2
									--Copper Skill Bonus--
									player:addItem("copper_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=6400 and player.registry["smelter"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					--Copper Skill Bonus--
					s=s*2
					--Copper Skill Bonus--
					player:addItem("copper_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("copper_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("copper_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--Copper Skill Bonus--
									s=s*2
									--Copper Skill Bonus--
									player:addItem("copper_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=18000 and player.registry["smelter"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					--Copper Skill Bonus--
					s=s*2
					--Copper Skill Bonus--
					player:addItem("copper_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("copper_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("copper_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--Copper Skill Bonus--
									s=s*2
									--Copper Skill Bonus--
									player:addItem("copper_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=50000 and player.registry["smelter"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					--Copper Skill Bonus--
					s=s*2
					--Copper Skill Bonus--
					player:addItem("copper_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("copper_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("copper_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--Copper Skill Bonus--
									s=s*2
									--Copper Skill Bonus--
									player:addItem("copper_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=124000 and player.registry["smelter"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					--Copper Skill Bonus--
					s=s*2
					--Copper Skill Bonus--
					player:addItem("copper_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("copper_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("copper_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--Copper Skill Bonus--
									s=s*2
									--Copper Skill Bonus--
									player:addItem("copper_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=237000 and player.registry["smelter"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					--Copper Skill Bonus--
					s=s*2
					--Copper Skill Bonus--
					player:addItem("copper_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("copper_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("copper_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--Copper Skill Bonus--
									s=s*2
									--Copper Skill Bonus--
									player:addItem("copper_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end

			elseif(player.registry["smelter"]>=400000 and player.registry["smelter"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					--Copper Skill Bonus--
					s=s*2
					--Copper Skill Bonus--
					player:addItem("copper_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("copper_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("copper_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--Copper Skill Bonus--
									s=s*2
									--Copper Skill Bonus--
									player:addItem("copper_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					--Copper Skill Bonus--
					s=s*2
					--Copper Skill Bonus--
					player:addItem("copper_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("copper_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("copper_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--Copper Skill Bonus--
									s=s*2
									--Copper Skill Bonus--
									player:addItem("copper_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
	
			end
			player:sendAnimation(46)


























		elseif(choice=="Silver ore" and player:hasItem("silver_ore",5) == true) then
			t={graphic=convertGraphic(291,"item"),color=27}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["smelter"]<6400) then
					player:dialogSeq({t,"You are not experienced enough to smelt Silver ore."})
					return
			end
			player:removeItem("silver_ore",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()

			if(player.registry["smelter"]>=6400 and player.registry["smelter"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					--silver Skill Bonus--
					s=s*2
					--silver Skill Bonus--
					player:addItem("silver_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("silver_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("silver_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--silver Skill Bonus--
									s=s*2
									--silver Skill Bonus--
									player:addItem("silver_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=18000 and player.registry["smelter"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					--silver Skill Bonus--
					s=s*2
					--silver Skill Bonus--
					player:addItem("silver_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("silver_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("silver_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--silver Skill Bonus--
									s=s*2
									--silver Skill Bonus--
									player:addItem("silver_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=50000 and player.registry["smelter"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					--silver Skill Bonus--
					s=s*2
					--silver Skill Bonus--
					player:addItem("silver_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("silver_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("silver_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--silver Skill Bonus--
									s=s*2
									--silver Skill Bonus--
									player:addItem("silver_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=124000 and player.registry["smelter"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					--silver Skill Bonus--
					s=s*2
					--silver Skill Bonus--
					player:addItem("silver_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("silver_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("silver_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--silver Skill Bonus--
									s=s*2
									--silver Skill Bonus--
									player:addItem("silver_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=237000 and player.registry["smelter"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					--silver Skill Bonus--
					s=s*2
					--silver Skill Bonus--
					player:addItem("silver_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("silver_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("silver_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--silver Skill Bonus--
									s=s*2
									--silver Skill Bonus--
									player:addItem("silver_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end

			elseif(player.registry["smelter"]>=400000 and player.registry["smelter"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					--silver Skill Bonus--
					s=s*2
					--silver Skill Bonus--
					player:addItem("silver_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("silver_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("silver_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--silver Skill Bonus--
									s=s*2
									--silver Skill Bonus--
									player:addItem("silver_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					--silver Skill Bonus--
					s=s*2
					--silver Skill Bonus--
					player:addItem("silver_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("silver_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("silver_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--silver Skill Bonus--
									s=s*2
									--silver Skill Bonus--
									player:addItem("silver_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
	
			end





















		elseif(choice=="Iron ore" and player:hasItem("iron_ore",5) == true) then
			t={graphic=convertGraphic(291,"item"),color=26}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["smelter"]<18000) then
					player:dialogSeq({t,"You are not experienced enough to smelt Iron ore."})
					return
			end
			player:removeItem("iron_ore",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()

			if(player.registry["smelter"]>=18000 and player.registry["smelter"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					--iron Skill Bonus--
					s=s*3
					--iron Skill Bonus--
					player:addItem("iron_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("iron_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("iron_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--iron Skill Bonus--
									s=s*3
									--iron Skill Bonus--
									player:addItem("iron_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=50000 and player.registry["smelter"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					--iron Skill Bonus--
					s=s*3
					--iron Skill Bonus--
					player:addItem("iron_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("iron_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("iron_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--iron Skill Bonus--
									s=s*3
									--iron Skill Bonus--
									player:addItem("iron_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=124000 and player.registry["smelter"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					--iron Skill Bonus--
					s=s*3
					--iron Skill Bonus--
					player:addItem("iron_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("iron_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("iron_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--iron Skill Bonus--
									s=s*3
									--iron Skill Bonus--
									player:addItem("iron_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=237000 and player.registry["smelter"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					--iron Skill Bonus--
					s=s*3
					--iron Skill Bonus--
					player:addItem("iron_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("iron_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("iron_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--iron Skill Bonus--
									s=s*3
									--iron Skill Bonus--
									player:addItem("iron_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end

			elseif(player.registry["smelter"]>=400000 and player.registry["smelter"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					--iron Skill Bonus--
					s=s*3
					--iron Skill Bonus--
					player:addItem("iron_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("iron_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("iron_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--iron Skill Bonus--
									s=s*3
									--iron Skill Bonus--
									player:addItem("iron_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					--iron Skill Bonus--
					s=s*3
					--iron Skill Bonus--
					player:addItem("iron_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("iron_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("iron_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--iron Skill Bonus--
									s=s*3
									--iron Skill Bonus--
									player:addItem("iron_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
	
			end


















		elseif(choice=="Gold ore" and player:hasItem("gold_ore",5) == true) then
			t={graphic=convertGraphic(291,"item"),color=28}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["smelter"]<18000) then
					player:dialogSeq({t,"You are not experienced enough to smelt Iron ore."})
					return
			end
			player:removeItem("gold_ore",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()

			if(player.registry["smelter"]>=18000 and player.registry["smelter"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					--gold Skill Bonus--
					s=s*3
					--gold Skill Bonus--
					player:addItem("gold_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("gold_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("gold_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--gold Skill Bonus--
									s=s*3
									--gold Skill Bonus--
									player:addItem("gold_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=50000 and player.registry["smelter"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					--gold Skill Bonus--
					s=s*3
					--gold Skill Bonus--
					player:addItem("gold_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("gold_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("gold_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--gold Skill Bonus--
									s=s*3
									--gold Skill Bonus--
									player:addItem("gold_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=124000 and player.registry["smelter"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					--gold Skill Bonus--
					s=s*3
					--gold Skill Bonus--
					player:addItem("gold_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("gold_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("gold_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--gold Skill Bonus--
									s=s*3
									--gold Skill Bonus--
									player:addItem("gold_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=237000 and player.registry["smelter"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					--gold Skill Bonus--
					s=s*3
					--gold Skill Bonus--
					player:addItem("gold_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("gold_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("gold_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--gold Skill Bonus--
									s=s*3
									--gold Skill Bonus--
									player:addItem("gold_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end

			elseif(player.registry["smelter"]>=400000 and player.registry["smelter"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					--gold Skill Bonus--
					s=s*3
					--gold Skill Bonus--
					player:addItem("gold_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("gold_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("gold_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--gold Skill Bonus--
									s=s*3
									--gold Skill Bonus--
									player:addItem("gold_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
			elseif(player.registry["smelter"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					--gold Skill Bonus--
					s=s*3
					--gold Skill Bonus--
					player:addItem("gold_bar",1)
					player.registry["smelter"]=player.registry["smelter"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("gold_ore",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more Ore.",optscurrent)
						if(choice2=="Put more ore") then
							player:removeItem("gold_ore",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									--gold Skill Bonus--
									s=s*3
									--gold Skill Bonus--
									player:addItem("gold_bar",1)
									player.registry["smelter"]=player.registry["smelter"]+s
									player:dialogSeq({t,"You are successful."},1)
								else
									player:dialogSeq({t,"You are unsuccessful."},1)
								end
						else
							player:dialogSeq({t,"You are unsuccessful."},1)
						end
					else
						player:dialogSeq({t,"You are unsuccessful."},1)
					end
				else
					player:dialogSeq({t,"You are unsuccessful."},1)
				end
	
			end
			player:sendAnimation(46)

		--[[

			Put other ore than Tin here.
		--]]									
		

		end						
	
		
	end)
}
