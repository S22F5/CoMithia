backupfi = {
		cast=function(player,target)
		
		player:sendMinitext("debug")
		local ra=math.random(1,100)
		local ra2=math.random(1,100)
		local m1=math.random(1,4)
		local x=math.random(1,2)
		local opts = { }
		table.insert(opts,"Pull harder")
		table.insert(opts,"Let it go")
		
		if(player:hasItem("fishing_pole",1) ~= true) then
			player:sendMinitext("You need a Fishing pole to fish!.")
			return
		end
		if(target.name~="Fish") then
			player:sendMinitext("You can't do that.")
			return
		end
		if(target.x<player.x-7 or target.x>player.x+7) then
			player:sendMinitext("Your pole is too short to fish that far away")
			return
		end
		if(target.y<player.y-6 or target.y>player.y+6) then
			player:sendMinitext("Your pole is too short to fish that far away")
			return
		end

		if(target.blType==BL_MOB and target.name=="Fish") then
			player:sendAnimation(326)
			player:sendAction(6,35)
			if(player.registry["fisherman"]>=0 and player.registry["fisherman"]<=25) then
				if(ra>=0 and ra<=20) then
	                		target.attacker=player.ID
                      			target:removeHealth(1000000000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>20 and ra<=70) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>70 and ra<=95) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=80) then
				        		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>80) then
							target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
						target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>95) then
					target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end


			elseif(player.registry["fisherman"]>25 and player.registry["fisherman"]<=220) then
				if(ra>=0 and ra<=20) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>20 and ra<=70) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>70 and ra<=95) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=75) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>75) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
		                		target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>95) then
			                target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end

			elseif(player.registry["fisherman"]>220 and player.registry["fisherman"]<=840) then
				if(ra>=0 and ra<=15) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>15 and ra<=65) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>65 and ra<=90) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=70) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>70) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
		                		target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>90) then
		                	target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			elseif(player.registry["fisherman"]>840 and player.registry["fisherman"]<=2200) then
				if(ra>=0 and ra<=15) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>15 and ra<=60) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>60 and ra<=90) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=65) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>65) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
		                		target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>90) then
		                	target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			elseif(player.registry["fisherman"]>2200 and player.registry["fisherman"]<=6400) then
				if(ra>=0 and ra<=15) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>15 and ra<=55) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>55 and ra<=85) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=60) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>60) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
		                		target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>85) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			elseif(player.registry["fisherman"]>6400 and player.registry["fisherman"]<=18000) then
				if(ra>=0 and ra<=10) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>10 and ra<=50) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>50 and ra<=80) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=55) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>55) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
		                		target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>80) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			elseif(player.registry["fisherman"]>18000 and player.registry["fisherman"]<=50000) then
				if(ra>=0 and ra<=10) then
		                	target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>10 and ra<=40) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>40 and ra<=75) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=50) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>50) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
			                	target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>75) then
			                target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			elseif(player.registry["fisherman"]>50000 and player.registry["fisherman"]<=124000) then
				if(ra>=0 and ra<=10) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>10 and ra<=35) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>35 and ra<=75) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=45) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>45) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
		                		target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>75) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			elseif(player.registry["fisherman"]>124000 and player.registry["fisherman"]<=237000) then
				if(ra>=0 and ra<=5) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>5 and ra<=30) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>30 and ra<=70) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=40) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>40) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
	                			target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>70) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			elseif(player.registry["fisherman"]>237000 and player.registry["fisherman"]<=400000) then
				if(ra>=0 and ra<=5) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>5 and ra<=25) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>25 and ra<=65) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=35) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>35) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
		                		target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>65) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			elseif(player.registry["fisherman"]>400000 and player.registry["fisherman"]<=680000) then
				if(ra>=0 and ra<=5) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>5 and ra<=20) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>20 and ra<=60) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=30) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>30) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
		                		target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>60) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			elseif(player.registry["fisherman"]>680000) then
				if(ra>=0 and ra<=5) then
	                		target.attacker=player.ID
					target:removeHealth(1100000)
					player:dialogSeq({"You pull on your pole too hard and end up eviscerating your catch."})
				elseif(ra>5 and ra<=20) then
	                		target.attacker=player.ID
					target:removeHealth(350000)
					player:dialogSeq({"You pull on you pole as your catch bites, but only end up hurting it."})
				elseif(ra>20 and ra<=55) then
					local choice=player:menuString2("Your catch bites, but resists. What do you wish to do?",opts)
					if(choice=="Pull harder") then
						if(ra2<=25) then
			                		target.attacker=player.ID
							target:removeHealth(350000)
							player:dialogSeq({"You pull too hard on your pole and hurt your catch."})
						elseif(ra2>25) then
			                		target.attacker=player.ID
							target:removeHealth(1100000)
							player:sendMinitext("You caught a Fish!")
							player:addItem("fish",1)
							player.registry["fisherman"]=player.registry["fisherman"]+m1
							player:dialogSeq({"You manage to catch it!"},1)
						end
					else
			                	target.attacker=player.ID
						target:removeHealth(100000)
					end
				elseif(ra>55) then
		                	target.attacker=player.ID
					target:removeHealth(1100000)
					player:sendMinitext("You caught a Fish!")
					player:addItem("fish",1)
					player.registry["fisherman"]=player.registry["fisherman"]+(m1*x)
					player:dialogSeq({"You manage to catch it!"},1)
				end
			end


		--[[

			Put other fishes here.
		--]]


		end

		local craftlevel="Beginner"
		if(player.registry["fisherman"]>=1 and player.registry["fisherman"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["fisherman"]>=25 and player.registry["fisherman"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["fisherman"]>=220 and player.registry["fisherman"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["fisherman"]>=840 and player.registry["fisherman"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["fisherman"]>=2200 and player.registry["fisherman"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["fisherman"]>=6400 and player.registry["fisherman"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["fisherman"]>=18000 and player.registry["fisherman"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["fisherman"]>=50000 and player.registry["fisherman"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["fisherman"]>=124000 and player.registry["fisherman"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["fisherman"]>=237000 and player.registry["fisherman"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["fisherman"]>=400000 and player.registry["fisherman"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["fisherman"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("fisher")
		player:addLegend(""..craftlevel.." fisherman","fisher",17,128)
		
		end
}