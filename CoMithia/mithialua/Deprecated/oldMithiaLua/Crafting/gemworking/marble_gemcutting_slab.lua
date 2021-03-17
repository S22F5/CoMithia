marble_gemcutting_slab = {
	click=async(function(player,npc)
	
		local gm = 0
		
		local opts = {}
		local optscurrent = { }
		local t={graphic=convertGraphic(1025,"monster"),color=0}

        player.npcGraphic=t.graphic
		player.npcColor=t.color


	if(player:hasItem("amethyst",1) == true) then
		table.insert(opts,"Amethyst")
	end
	if(player:hasItem("chrysocolla",1) == true) then
		table.insert(opts,"Chrysocolla")
	end
	if(player:hasItem("tigers_eye",1) == true) then
		table.insert(opts,"Tiger's eye")
	end

	table.insert(opts,"I do not have any gem to cut")

	local b=0
	local l=math.random(1,player.registry["gemcutter"]+1)
	local k=player.registry["gemcutter"]+1

	if(l/k>0.33) then b=1 end
	if(l/k>0.66) then b=2 end
	if(l/k>0.85) then b=3 end

		local craftlevel="Beginner"
		if(player.registry["gemcutter"]>=1 and player.registry["gemcutter"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["gemcutter"]>=25 and player.registry["gemcutter"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["gemcutter"]>=220 and player.registry["gemcutter"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["gemcutter"]>=840 and player.registry["gemcutter"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["gemcutter"]>=2200 and player.registry["gemcutter"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["gemcutter"]>=6400 and player.registry["gemcutter"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["gemcutter"]>=18000 and player.registry["gemcutter"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["gemcutter"]>=50000 and player.registry["gemcutter"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["gemcutter"]>=124000 and player.registry["gemcutter"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["gemcutter"]>=237000 and player.registry["gemcutter"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["gemcutter"]>=400000 and player.registry["gemcutter"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["gemcutter"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("gemcutter")
		player:addLegend(""..craftlevel.." gemcutter","gemcutter",99,128)	


	local choice=player:menuString2("Hello, "..player.name..", Which kind of gems do you wish to cut?",opts)
--FF GEMCUTTING
		if (gm == 1) then
		if(choice=="Amethyst" and player:hasItem("amethyst",1) == true) then
		--while (player:hasItem("amethyst", 1) == true) do
		repeat
			local t=math.random(1,100)
			local r=math.random(1,3)
			r=r+b
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["gemcutter"]<220) then
				if(t<=75) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>75) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=220 and player.registry["gemcutter"]<840) then
				if(t<=70) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>70) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=840 and player.registry["gemcutter"]<2200) then
				if(t<=65) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>65) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=2200 and player.registry["gemcutter"]<6400) then
				if(t<=60) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>60) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=6400 and player.registry["gemcutter"]<18000) then
				if(t<=55) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>55) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=18000 and player.registry["gemcutter"]<50000) then
				if(t<=50) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>50) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=50000 and player.registry["gemcutter"]<124000) then
				if(t<=45) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>45) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=124000 and player.registry["gemcutter"]<237000) then
				if(t<=40) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>40) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=237000 and player.registry["gemcutter"]<400000) then
				if(t<=35) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>35) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=400000 and player.registry["gemcutter"]<680000) then
				if(t<=30) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>30) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=680000) then
				if(t<=25) then
					player:removeItem("amethyst",1)
					player:sendMinitext("You broke it.")
					--return
				elseif(t>25) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			end
		until (player:hasItem("amethyst", 1) ~= true)
		--end
		return
		end
		end
--	FF GEMCUTTING
		if(choice=="Amethyst" and player:hasItem("amethyst",1) == true) then
			local t=math.random(1,100)
			local r=math.random(1,3)
			r=r+b
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["gemcutter"]<220) then
				if(t<=75) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>75) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=220 and player.registry["gemcutter"]<840) then
				if(t<=70) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>70) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=840 and player.registry["gemcutter"]<2200) then
				if(t<=65) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>65) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=2200 and player.registry["gemcutter"]<6400) then
				if(t<=60) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>60) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=6400 and player.registry["gemcutter"]<18000) then
				if(t<=55) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>55) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=18000 and player.registry["gemcutter"]<50000) then
				if(t<=50) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>50) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=50000 and player.registry["gemcutter"]<124000) then
				if(t<=45) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>45) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=124000 and player.registry["gemcutter"]<237000) then
				if(t<=40) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>40) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=237000 and player.registry["gemcutter"]<400000) then
				if(t<=35) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>35) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=400000 and player.registry["gemcutter"]<680000) then
				if(t<=30) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>30) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			elseif(player.registry["gemcutter"]>=680000) then
				if(t<=25) then
					player:removeItem("amethyst",1)
					player:dialogSeq({t,"Your attempt at working on the Amethyst crushed it to fine dust."})
					return
				elseif(t>25) then
					player:removeItem("amethyst",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_amethyst",1)
				end
			end













		elseif(choice=="Chrysocolla" and player:hasItem("chrysocolla",1) == true) then
			local t=math.random(1,100)
			local r=math.random(1,3)
			r=r+b
			if(player.registry["gemcutter"]>2200) then
				player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
				player:sendStatus()
			end
			if(player.registry["gemcutter"]<2200) then
				player:dialogSeq({t,"You are not experienced enough to work on Chrysocollas"})
				return
			end
			if(player.registry["gemcutter"]>=2200 and player.registry["gemcutter"]<6400) then
				if(t<=75) then
					player:removeItem("chrysocolla",1)
					player:dialogSeq({t,"Your attempt at working on the Chrysocolla crushed it to fine dust."})
					return
				elseif(t>75) then
					player:removeItem("chrysocolla",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_chrysocolla",1)
				end
			elseif(player.registry["gemcutter"]>=6400 and player.registry["gemcutter"]<18000) then
				if(t<=70) then
					player:removeItem("chrysocolla",1)
					player:dialogSeq({t,"Your attempt at working on the Chrysocolla crushed it to fine dust."})
					return
				elseif(t>70) then
					player:removeItem("chrysocolla",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_chrysocolla",1)
				end
			elseif(player.registry["gemcutter"]>=18000 and player.registry["gemcutter"]<50000) then
				if(t<=65) then
					player:removeItem("chrysocolla",1)
					player:dialogSeq({t,"Your attempt at working on the Chrysocolla crushed it to fine dust."})
					return
				elseif(t>65) then
					player:removeItem("chrysocolla",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_chrysocolla",1)
				end
			elseif(player.registry["gemcutter"]>=50000 and player.registry["gemcutter"]<124000) then
				if(t<=60) then
					player:removeItem("chrysocolla",1)
					player:dialogSeq({t,"Your attempt at working on the Chrysocolla crushed it to fine dust."})
					return
				elseif(t>60) then
					player:removeItem("chrysocolla",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_chrysocolla",1)
				end
			elseif(player.registry["gemcutter"]>=124000 and player.registry["gemcutter"]<237000) then
				if(t<=55) then
					player:removeItem("chrysocolla",1)
					player:dialogSeq({t,"Your attempt at working on the Chrysocolla crushed it to fine dust."})
					return
				elseif(t>55) then
					player:removeItem("chrysocolla",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_chrysocolla",1)
				end
			elseif(player.registry["gemcutter"]>=237000 and player.registry["gemcutter"]<400000) then
				if(t<=50) then
					player:removeItem("chrysocolla",1)
					player:dialogSeq({t,"Your attempt at working on the Chrysocolla crushed it to fine dust."})
					return
				elseif(t>50) then
					player:removeItem("chrysocolla",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_chrysocolla",1)
				end
			elseif(player.registry["gemcutter"]>=400000 and player.registry["gemcutter"]<680000) then
				if(t<=45) then
					player:removeItem("chrysocolla",1)
					player:dialogSeq({t,"Your attempt at working on the Chrysocolla crushed it to fine dust."})
					return
				elseif(t>45) then
					player:removeItem("chrysocolla",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_chrysocolla",1)
				end
			elseif(player.registry["gemcutter"]>=680000) then
				if(t<=40) then
					player:removeItem("chrysocolla",1)
					player:dialogSeq({t,"Your attempt at working on the Chrysocolla crushed it to fine dust."})
					return
				elseif(t>40) then
					player:removeItem("chrysocolla",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_chrysocolla",1)
				end
			end








		elseif(choice=="Tiger's eye" and player:hasItem("tigers_eye",1) == true) then
			local t=math.random(1,100)
			local r=math.random(1,3)
			r=r+b
			if(player.registry["gemcutter"]>18000) then
				player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
				player:sendStatus()
			end
			if(player.registry["gemcutter"]<18000) then
				player:dialogSeq({t,"You are not experienced enough to work on Tiger's eyes"})
				return
			end
			if(player.registry["gemcutter"]>=18000 and player.registry["gemcutter"]<50000) then
				if(t<=75) then
					player:removeItem("tigers_eye",1)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>75) then
					player:removeItem("tigers_eye",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_tigers_eye",1)
				end
			elseif(player.registry["gemcutter"]>=50000 and player.registry["gemcutter"]<124000) then
				if(t<=70) then
					player:removeItem("tigers_eye",1)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>70) then
					player:removeItem("tigers_eye",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_tigers_eye",1)
				end
			elseif(player.registry["gemcutter"]>=124000 and player.registry["gemcutter"]<237000) then
				if(t<=65) then
					player:removeItem("tigers_eye",1)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>65) then
					player:removeItem("tigers_eye",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_tigers_eye",1)
				end
			elseif(player.registry["gemcutter"]>=237000 and player.registry["gemcutter"]<400000) then
				if(t<=60) then
					player:removeItem("tigers_eye",1)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>60) then
					player:removeItem("tigers_eye",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_tigers_eye",1)
				end
			elseif(player.registry["gemcutter"]>=400000 and player.registry["gemcutter"]<680000) then
				if(t<=55) then
					player:removeItem("tigers_eye",1)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>55) then
					player:removeItem("tigers_eye",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_tigers_eye",1)
				end
			elseif(player.registry["gemcutter"]>=680000) then
				if(t<=50) then
					player:removeItem("tigers_eye",1)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>50) then
					player:removeItem("tigers_eye",1)
					player.registry["gemcutter"]=player.registry["gemcutter"]+r
					player:addItem("shining_tigers_eye",1)
				end
			end









	

			


		--[[

			Put other Gems than amethyst here.
		--]]

	
								
		

		end
		player:sendAnimation(312)						
	
		
	end)
}
