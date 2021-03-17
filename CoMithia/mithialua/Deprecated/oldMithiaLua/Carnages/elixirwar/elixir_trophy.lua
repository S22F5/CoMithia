elixir_trophy = {
	use = function(player)
		if(player.armorColor~=player.registry["elixircolor"]) then
				return
		end
		if(player.side==0) then
			local check=player:getObjectsInCell(player.m,player.x,player.y-1,BL_MOB)
			if(#check>0) then
				for z=1,#check do
					if(check[z].name=="Referee") then
						player:removeItem("elixir_trophy",1)
						if(player.armorColor==63) then
							player:broadcast(player.m,"-Elixir: "..player.name.." from The RED Team brings back the trophy!")
						elseif(player.armorColor==65) then
							player:broadcast(player.m,"-Elixir: "..player.name.." from The BLUE Team brings back the trophy!")
						end
					end
				end
			end
		elseif(player.side==1) then
			local check=player:getObjectsInCell(player.m,player.x+1,player.y,BL_MOB)
			if(#check>0) then
				for z=1,#check do
					if(check[z].name=="Referee") then
						player:removeItem("elixir_trophy",1)
						if(player.armorColor==63) then
							player:broadcast(player.m,"-Elixir: "..player.name.." from The RED Team brings back the trophy!")
						elseif(player.armorColor==65) then
							player:broadcast(player.m,"-Elixir: "..player.name.." from The BLUE Team brings back the trophy!")
						end
					end
				end
			end
		elseif(player.side==2) then
			local check=player:getObjectsInCell(player.m,player.x,player.y+1,BL_MOB)
			if(#check>0) then
				for z=1,#check do
					if(check[z].name=="Referee") then
						player:removeItem("elixir_trophy",1)
						if(player.armorColor==63) then
							player:broadcast(player.m,"-Elixir: "..player.name.." from The RED Team brings back the trophy!")
						elseif(player.armorColor==65) then
							player:broadcast(player.m,"-Elixir: "..player.name.." from The BLUE Team brings back the trophy!")
						end
					end
				end
			end
		elseif(player.side==3) then
			local check=player:getObjectsInCell(player.m,player.x-1,player.y,BL_MOB)
			if(#check>0) then
				for z=1,#check do
					if(check[z].name=="Referee") then
						player:removeItem("elixir_trophy",1)
						if(player.armorColor==63) then
							player:broadcast(player.m,"-Elixir: "..player.name.." from The RED Team brings back the trophy!")
						elseif(player.armorColor==65) then
							player:broadcast(player.m,"-Elixir: "..player.name.." from The BLUE Team brings back the trophy!")
						end
					end
				end
			end
		end
	end
}