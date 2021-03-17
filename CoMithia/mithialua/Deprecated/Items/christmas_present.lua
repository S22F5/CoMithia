christmas_present = {
	use = async(function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		local t={graphic=convertGraphic(430,"item"),color=8}
	        local opts = { }
		player.npcGraphic=t.graphic
		player.npcColor=t.color
		
		-- let's keep this list with major items, nothing too useless
		local r =math.random(1,2000) -- random chance for 1 in 2000 for legendary - Note to Loki : 1/400 Way too easy, already 3 Legendaries opened in not even two days
		local rr=math.random(1,2) -- 1 for spear, 2 for staff
		local ra=math.random(1,39) -- if you do not get legendary
		
	
		player:dialogSeq({t,"Do you wish to open your Present?"},1)
		local choice=player:menuString2("Open your present?",{"Yes","No"})
			if(choice=="Yes") then
			if(player:hasItem("christmas_present",1) ~= true) then
					player:dialogSeq({t,"You do not have any present."})
					return
			end
			player:removeItem("christmas_present",1)
				if(r==1) then
					if(rr==1) then
						player:addItem("chaos",1)						
					elseif(rr==2) then
						player:addItem("shadow",1)
					end
					player:broadcast(-1,""..player.name.." opened a rare present!")
				else
					if(ra==1) then
						player:addItem("banana_sword",1)
					elseif(ra==2) then
						player:addItem("brute",1)
					elseif(ra==3) then
						player:addItem("crystalheart",1)
					elseif(ra==4) then
						player:addItem("face_smasher",1)
					elseif(ra==5) then
						player:addItem("queen_staff",1)
					elseif(ra==6) then
						player:addItem("quickblade",1)
					elseif(ra==7) then
						player:addItem("twilight",1)					
					elseif(ra==8) then
						player:addItem("eternal_binding",1)
					elseif(ra==9) then
						player:addItem("gladiator_glove",1)
					elseif(ra==10) then
						player:addItem("gold_plated_band",1)
					elseif(ra==11) then
						player:addItem("trapped_soul",1)					
					elseif(ra==12) then
						player:addItem("holy_barrier",1)
					elseif(ra==13) then
						player:addItem("ancient_texts",1)
					elseif(ra==14) then
						player:addItem("light_shield",1)
					elseif(ra==15) then
						player:addItem("spell_book",1)					
					elseif(ra==16) then
						player:addItem("blue_crystal_shard",1)
					elseif(ra==17) then
						player:addItem("red_crystal_shard",1)
					elseif(ra==18) then
						player:addItem("yellow_crystal_shard",1)
					elseif(ra==19) then
						player:addItem("green_crystal_shard",1)	
					elseif(ra==20) then
						player:addItem("lucky_fox_charm",1)
					elseif(ra==21) then
						player:addItem("amethyst",65)
					elseif(ra==22) then
						player:addItem("chrysocolla",40)
					elseif(ra==23) then
						player:addItem("tigers_eye",20)
					elseif(ra==24) then
						player:addItem("tourmaline",3)
					elseif(ra==25) then
						player:addItem("amethyst",65)
					elseif(ra==26) then
						player:addItem("amethyst",65)
					elseif(ra==27) then
						player:addItem("amethyst",65)
					elseif(ra==28) then
						player:addItem("amethyst",65)
					elseif(ra==29) then
						player:addItem("amethyst",65)
					elseif(ra==30) then
						player:addItem("amethyst",65)
					elseif(ra==31) then
						player:addItem("amethyst",65)
					elseif(ra==32) then
						player:addItem("amethyst",65)
					elseif(ra==33) then
						player:addItem("chrysocolla",40)
					elseif(ra==34) then
						player:addItem("chrysocolla",40)
					elseif(ra==35) then
						player:addItem("chrysocolla",40)
					elseif(ra==36) then
						player:addItem("chrysocolla",40)
					elseif(ra==37) then
						player:addItem("chrysocolla",40)
					elseif(ra==38) then
						player:addItem("chrysocolla",40)
					elseif(ra==39) then
						player:addItem("chrysocolla",40)
					elseif(ra==40) then
						player:addItem("chrysocolla",40)
					elseif(ra==41) then
						player:addItem("tigers_eye",20)
					elseif(ra==42) then
						player:addItem("tigers_eye",20)
					elseif(ra==43) then
						player:addItem("tigers_eye",20)
					elseif(ra==44) then
						player:addItem("tigers_eye",20)
					elseif(ra==45) then
						player:addItem("tigers_eye",20)
					end
				end
			end			
					
	end)
}