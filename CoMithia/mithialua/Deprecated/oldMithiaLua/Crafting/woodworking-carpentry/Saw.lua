saw = {
	click=async(function(player,npc)

		local opts = {}
		local optscurrent = { }
		local t={graphic=convertGraphic(743,"monster"),color=0}

                        player.npcGraphic=t.graphic
		        player.npcColor=t.color
	if(player:hasItem("ash_log",5) == true) then
		table.insert(opts,"Ash log")
	end
	if(player:hasItem("cedar_log",5) == true) then
		table.insert(opts,"Cedar log")
	end
	if(player:hasItem("oak_log",5) == true) then
		table.insert(opts,"Oak log")
	end

		local craftlevel="Beginner"
		if(player.registry["woodworker"]>=1 and player.registry["woodworker"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["woodworker"]>=25 and player.registry["woodworker"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["woodworker"]>=220 and player.registry["woodworker"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["woodworker"]>=840 and player.registry["woodworker"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["woodworker"]>=2200 and player.registry["woodworker"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["woodworker"]>=6400 and player.registry["woodworker"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["woodworker"]>=18000 and player.registry["woodworker"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["woodworker"]>=50000 and player.registry["woodworker"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["woodworker"]>=124000 and player.registry["woodworker"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["woodworker"]>=237000 and player.registry["woodworker"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["woodworker"]>=400000 and player.registry["woodworker"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["woodworker"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("woodworker")
		player:addLegend(""..craftlevel.." woodworker","woodworker",41,128)									
		player:sendAnimation(269)


	table.insert(opts,"I do not have any wood to saw")



	table.insert(optscurrent,"Use more logs")
	table.insert(optscurrent,"Nevermind")
	
	local choice=player:menuString2("Hello, "..player.name..", Which kind of logs do you wish to saw?",opts)
		
		if(choice=="Ash log" and player:hasItem("ash_log",5) == true) then
			t={graphic=convertGraphic(2886,"item"),color=0}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			player:removeItem(185,5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["woodworker"]<25) then
				local x=math.random(1,100)
				if(x<10) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=10 and x<50) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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
			elseif(player.registry["woodworker"]>=25 and player.registry["woodworker"]<220) then
				local x=math.random(1,100)
				if(x<15) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=15 and x<55) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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
			elseif(player.registry["woodworker"]>=220 and player.registry["woodworker"]<840) then
				local x=math.random(1,100)
				if(x<20) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=20 and x<60) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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
			elseif(player.registry["woodworker"]>=840 and player.registry["woodworker"]<2200) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<60) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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

			elseif(player.registry["woodworker"]>=2200 and player.registry["woodworker"]<6400) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<65) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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
			elseif(player.registry["woodworker"]>=6400 and player.registry["woodworker"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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
			elseif(player.registry["woodworker"]>=18000 and player.registry["woodworker"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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
			elseif(player.registry["woodworker"]>=50000 and player.registry["woodworker"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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
			elseif(player.registry["woodworker"]>=124000 and player.registry["woodworker"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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
			elseif(player.registry["woodworker"]>=237000 and player.registry["woodworker"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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

			elseif(player.registry["woodworker"]>=400000 and player.registry["woodworker"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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
			elseif(player.registry["woodworker"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("ash_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("ash_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem(185,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("ash_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+s
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







		elseif(choice=="Cedar log" and player:hasItem("cedar_log",5) == true) then
			t={graphic=convertGraphic(2886,"item"),color=30}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["woodworker"]<2200) then
				player:dialogSeq({t,"You are not experienced enough to work on Cedar wood."})
				return
			end
			player:removeItem("cedar_log",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["woodworker"]>=2200 and player.registry["woodworker"]<6400) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("cedar_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<65) then
					if(player:hasItem("cedar_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("cedar_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("cedar_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=6400 and player.registry["woodworker"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("cedar_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("cedar_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("cedar_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("cedar_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=18000 and player.registry["woodworker"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("cedar_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("cedar_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("cedar_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("cedar_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=50000 and player.registry["woodworker"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("cedar_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("cedar_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("cedar_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("cedar_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=124000 and player.registry["woodworker"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("cedar_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("cedar_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("cedar_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("cedar_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=237000 and player.registry["woodworker"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("cedar_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("cedar_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("cedar_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("cedar_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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

			elseif(player.registry["woodworker"]>=400000 and player.registry["woodworker"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("cedar_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("cedar_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("cedar_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("cedar_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("cedar_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("cedar_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("cedar_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("cedar_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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









		elseif(choice=="Oak log" and player:hasItem("oak_log",5) == true) then
			t={graphic=convertGraphic(2886,"item"),color=10}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["woodworker"]<18000) then
				player:dialogSeq({t,"You are not experienced enough to work on Oak wood."})
				return
			end
			player:removeItem("oak_log",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["woodworker"]>=18000 and player.registry["woodworker"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("oak_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("oak_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("oak_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("oak_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=50000 and player.registry["woodworker"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("oak_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("oak_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("oak_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("oak_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=124000 and player.registry["woodworker"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("oak_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("oak_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("oak_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("oak_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=237000 and player.registry["woodworker"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("oak_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("oak_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("oak_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("oak_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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

			elseif(player.registry["woodworker"]>=400000 and player.registry["woodworker"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("oak_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("oak_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("oak_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("oak_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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
			elseif(player.registry["woodworker"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("oak_board",1)
					player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("oak_log",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wood.",optscurrent)
						if(choice2=="Use more logs") then
							player:removeItem("oak_log",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("oak_board",1)
									player.registry["woodworker"]=player.registry["woodworker"]+(s*3)
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

		--[[

			Put other wood than Ash here.
		--]]

	


		end						
		
		
	end)
}
