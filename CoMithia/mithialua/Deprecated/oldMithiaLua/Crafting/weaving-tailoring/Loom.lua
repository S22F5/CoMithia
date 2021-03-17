loom = {
	click=async(function(player,npc)

		local opts = {}
		local optscurrent = { }
		local t={graphic=convertGraphic(742,"monster"),color=0}

                        player.npcGraphic=t.graphic
		        player.npcColor=t.color
	if(player:hasItem("wool",5) == true) then
		table.insert(opts,"Wool")
	end
	if(player:hasItem("romney_wool",5) == true) then
		table.insert(opts,"Romney wool")
	end
	if(player:hasItem("perendale_wool",5) == true) then
		table.insert(opts,"Perendale wool")
	end
	if(player:hasItem("shetland_wool",5) == true) then
		table.insert(opts,"Shetland wool")
	end
	if(player:hasItem("merino_wool",5) == true) then
		table.insert(opts,"Merino wool")
	end
	if(player:hasItem("rambouillet_wool",5) == true) then
		table.insert(opts,"Rambouillet wool")
	end
	table.insert(opts,"I do not have any wool to weave")



	table.insert(optscurrent,"Use more wool")
	table.insert(optscurrent,"Nevermind")
	
		local craftlevel="Beginner"
		if(player.registry["weaver"]>=1 and player.registry["weaver"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["weaver"]>=25 and player.registry["weaver"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["weaver"]>=220 and player.registry["weaver"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["weaver"]>=840 and player.registry["weaver"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["weaver"]>=2200 and player.registry["weaver"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["weaver"]>=6400 and player.registry["weaver"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["weaver"]>=18000 and player.registry["weaver"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["weaver"]>=50000 and player.registry["weaver"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["weaver"]>=124000 and player.registry["weaver"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["weaver"]>=237000 and player.registry["weaver"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["weaver"]>=400000 and player.registry["weaver"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["weaver"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("weaver")
		player:addLegend(""..craftlevel.." weaver","weaver",64,128)	



	local choice=player:menuString2("Hello, "..player.name..", What do you wish to weave?",opts)
		
		if(choice=="Wool" and player:hasItem("wool",5) == true) then
			t={graphic=convertGraphic(2770,"item"),color=0}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			player:removeItem("wool",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["weaver"]<25) then
				local x=math.random(1,100)
				if(x<10) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=10 and x<50) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=25 and player.registry["weaver"]<220) then
				local x=math.random(1,100)
				if(x<15) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=15 and x<55) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=220 and player.registry["weaver"]<840) then
				local x=math.random(1,100)
				if(x<20) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=20 and x<60) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=840 and player.registry["weaver"]<2200) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<60) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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

			elseif(player.registry["weaver"]>=2200 and player.registry["weaver"]<6400) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<65) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=6400 and player.registry["weaver"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=18000 and player.registry["weaver"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=50000 and player.registry["weaver"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=124000 and player.registry["weaver"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=237000 and player.registry["weaver"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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

			elseif(player.registry["weaver"]>=400000 and player.registry["weaver"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("wool_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem(242,5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("wool_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			player:sendAnimation(272)













			
		elseif(choice=="Romney wool" and player:hasItem("romney_wool",5) == true) then
			t={graphic=convertGraphic(2770,"item"),color=2}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["weaver"]<=220) then
				player:dialogSeq({t,"You are not experienced enough to weave Romney wool."})
				return
			end
			player:removeItem("romney_wool",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["weaver"]>=220 and player.registry["weaver"]<840) then
				local x=math.random(1,100)
				if(x<20) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=20 and x<60) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=840 and player.registry["weaver"]<2200) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<60) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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

			elseif(player.registry["weaver"]>=2200 and player.registry["weaver"]<6400) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<65) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=6400 and player.registry["weaver"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=18000 and player.registry["weaver"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=50000 and player.registry["weaver"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=124000 and player.registry["weaver"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=237000 and player.registry["weaver"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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

			elseif(player.registry["weaver"]>=400000 and player.registry["weaver"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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
			elseif(player.registry["weaver"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("romney_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+s
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("romney_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("romney_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("romney_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+s
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










		elseif(choice=="Perendale wool" and player:hasItem("perendale_wool",5) == true) then
			t={graphic=convertGraphic(2770,"item"),color=19}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["weaver"]<2200) then
				player:dialogSeq({t,"You are not experienced enough to work on Perendale wool."})
				return
			end
			player:removeItem("perendale_wool",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["weaver"]>=2200 and player.registry["weaver"]<6400) then
				local x=math.random(1,100)
				if(x<25) then
					local s=math.random(3,5)
					player:addItem("perendale_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=25 and x<65) then
					if(player:hasItem("perendale_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("perendale_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("perendale_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=6400 and player.registry["weaver"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("perendale_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("perendale_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("perendale_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("perendale_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=18000 and player.registry["weaver"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("perendale_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("perendale_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("perendale_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("perendale_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=50000 and player.registry["weaver"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("perendale_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("perendale_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("perendale_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("perendale_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=124000 and player.registry["weaver"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("perendale_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("perendale_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("perendale_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("perendale_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=237000 and player.registry["weaver"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("perendale_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("perendale_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("perendale_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("perendale_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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

			elseif(player.registry["weaver"]>=400000 and player.registry["weaver"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("perendale_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("perendale_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("perendale_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("perendale_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("perendale_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("perendale_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("perendale_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("perendale_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			player:sendAnimation(272)
			

















		elseif(choice=="Shetland wool" and player:hasItem("shetland_wool",5) == true) then
			t={graphic=convertGraphic(2770,"item"),color=4}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["weaver"]<6400) then
				player:dialogSeq({t,"You are not experienced enough to work on Shetland wool."})
				return
			end
			player:removeItem("shetland_wool",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["weaver"]>=6400 and player.registry["weaver"]<18000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("shetland_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<65) then
					if(player:hasItem("shetland_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("shetland_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("shetland_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=18000 and player.registry["weaver"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("shetland_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("shetland_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("shetland_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("shetland_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=50000 and player.registry["weaver"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("shetland_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("shetland_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("shetland_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("shetland_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=124000 and player.registry["weaver"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("shetland_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("shetland_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("shetland_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("shetland_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=237000 and player.registry["weaver"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("shetland_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("shetland_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("shetland_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("shetland_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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

			elseif(player.registry["weaver"]>=400000 and player.registry["weaver"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("shetland_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("shetland_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("shetland_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("shetland_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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
			elseif(player.registry["weaver"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("shetland_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*2)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("shetland_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("shetland_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("shetland_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*2)
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




















		elseif(choice=="Merino wool" and player:hasItem("merino_wool",5) == true) then
			t={graphic=convertGraphic(2770,"item"),color=8}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["weaver"]<18000) then
				player:dialogSeq({t,"You are not experienced enough to work on Merino wool."})
				return
			end
			player:removeItem("merino_wool",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["weaver"]>=18000 and player.registry["weaver"]<50000) then
				local x=math.random(1,100)
				if(x<30) then
					local s=math.random(3,5)
					player:addItem("merino_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=30 and x<70) then
					if(player:hasItem("merino_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("merino_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("merino_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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
			elseif(player.registry["weaver"]>=50000 and player.registry["weaver"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("merino_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("merino_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("merino_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("merino_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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
			elseif(player.registry["weaver"]>=124000 and player.registry["weaver"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("merino_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("merino_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("merino_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("merino_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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
			elseif(player.registry["weaver"]>=237000 and player.registry["weaver"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("merino_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("merino_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("merino_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("merino_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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

			elseif(player.registry["weaver"]>=400000 and player.registry["weaver"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("merino_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("merino_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("merino_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("merino_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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
			elseif(player.registry["weaver"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("merino_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("merino_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("merino_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("merino_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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













		elseif(choice=="Rambouillet wool" and player:hasItem("rambouillet_wool",5) == true) then
			t={graphic=convertGraphic(2770,"item"),color=8}
        		player.npcGraphic=t.graphic
	 		player.npcColor=t.color
			if(player.registry["weaver"]<50000) then
				player:dialogSeq({t,"You are not experienced enough to work on Rambouillet wool."})
				return
			end
			player:removeItem("rambouillet_wool",5)
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["weaver"]>=50000 and player.registry["weaver"]<124000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("rambouillet_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<70) then
					if(player:hasItem("rambouillet_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("rambouillet_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("rambouillet_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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
			elseif(player.registry["weaver"]>=124000 and player.registry["weaver"]<237000) then
				local x=math.random(1,100)
				if(x<35) then
					local s=math.random(3,5)
					player:addItem("rambouillet_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=35 and x<75) then
					if(player:hasItem("rambouillet_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("rambouillet_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("rambouillet_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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
			elseif(player.registry["weaver"]>=237000 and player.registry["weaver"]<400000) then
				local x=math.random(1,100)
				if(x<40) then
					local s=math.random(3,5)
					player:addItem("rambouillet_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=40 and x<80) then
					if(player:hasItem("rambouillet_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("rambouillet_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("rambouillet_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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

			elseif(player.registry["weaver"]>=400000 and player.registry["weaver"]<680000) then
				local x=math.random(1,100)
				if(x<45) then
					local s=math.random(3,5)
					player:addItem("rambouillet_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=45 and x<85) then
					if(player:hasItem("rambouillet_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("rambouillet_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("rambouillet_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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
			elseif(player.registry["weaver"]>=680000) then
				local x=math.random(1,100)
				if(x<50) then
					local s=math.random(3,5)
					player:addItem("rambouillet_fabric",1)
					player.registry["weaver"]=player.registry["weaver"]+(s*3)
					player:dialogSeq({t,"You are successful."},1)
				elseif(x>=50 and x<90) then
					if(player:hasItem("rambouillet_wool",5) == true) then
						local choice2=player:menuString2("You are making some progress, but you need to use some more wool.",optscurrent)
						if(choice2=="Use more wool") then
							player:removeItem("rambouillet_wool",5)
							local y=math.random(1,10)
								if(y<10) then
									local s=math.random(1,5)
									player:addItem("rambouillet_fabric",1)
									player.registry["weaver"]=player.registry["weaver"]+(s*3)
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

			Put other than wool here.
		--]]

								
		
		player:sendAnimation(272)
		end						
	
		
	end)
}
