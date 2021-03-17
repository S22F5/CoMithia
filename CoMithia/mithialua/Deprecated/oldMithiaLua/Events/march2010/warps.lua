hid175401 = {
	click=function(player)
			if(player.level>=25) then	
                        	player:warp(40001,math.random(5,8),3)
			else
				player:warp(17,54,5)
				player:popUp("The cave looks very dark\n\n\nIt would be way too dangerous to try and travel in there.")
                	end
	end
}
hid400011939 = {
	click=function(player)

			local check=0
			local checkmob={}
			for x=0,15 do
				for y=0,13 do
					checkmob=player:getObjectsInCell(40002,x,y,BL_MOB)
					if(#checkmob>0) then
						check=check+1
					end
				end
			end
			if(check>0) then
				if(player:hasItem("safety_token",1) == true) then
					player:warp(40002,math.random(1,14),math.random(3,12))
					player:sendMinitext("Lured by unusual sounds, you jump in the pit")
				else
					player:warp(40001,19,34)
					player:sendMinitext("It would not be wise jumping down there without a Safety Token, there could be no going back.")
				end
			else
				player:sendMinitext("You quickly jump back as you realize you almost fell in a pit")
				player:warp(40001,19,34)
			end

	end
}

hid400012039 = {
	click=function(player)

			local check=0
			local checkmob={}
			for x=0,15 do
				for y=0,13 do
					checkmob=player:getObjectsInCell(40002,x,y,BL_MOB)
					if(#checkmob>0) then
						check=check+1
					end
				end
			end
			if(check>0) then
				if(player:hasItem("safety_token",1) == true) then
					player:warp(40002,math.random(1,14),math.random(3,12))
					player:sendMinitext("Lured by unusual sounds, you jump in the pit")
				else
					player:warp(40001,20,34)
					player:sendMinitext("It would not be wise jumping down there without a Safety Token, there could be no going back.")
				end
			else
				player:sendMinitext("You quickly jump back as you realize you almost fell in a pit")
				player:warp(40001,20,34)
			end

	end
}

hid400030103 = {
	click=function(player)

			local check=0
			local checkmob={}
			for x=0,15 do
				for y=0,13 do
					checkmob=player:getObjectsInCell(40003,x,y,BL_MOB)
					if(#checkmob>0) then
						check=check+1
					end
				end
			end
			if(check>0) then
				player:warp(40003,math.random(3,14),math.random(3,12))
				player:sendMinitext("You cannot jump until the room is clear, the monsters could follow you and stab you in the back!")
			else
				player:sendMinitext("You jump down the pit!")
				player:warp(40002,math.random(1,14),math.random(3,12))
			end

	end
}


