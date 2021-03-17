crystalheart = {
		thrown = function(player)
		local bowrange=8
		
		local check={}
		local distcheck = 0
		local mobtable = {}

		for x=player.x-8,player.x+8 do
			for y=player.y-8,player.y+8 do


				distcheck = math.abs(player.x-x) + math.abs(player.y-y)

				if(distcheck<=8) then

					check=player:getObjectsInCell(player.m,x,y,BL_MOB)
					
					if(#check>0) then
						for z=1,#check do
							table.insert(mobtable,check[z].ID)
						end
					end
				end
			end
		end

		if(#mobtable>0) then
	
			local r = math.random(1,#mobtable)
			if(Mob(mobtable[r]).x == player.x and Mob(mobtable[r]).y == player.y) then
				if(player.side==0) then
					player:throw(player.x,player.y-bowrange,1268,0,1)
				elseif(player.side==1) then
					player:throw(player.x+bowrange,player.y,1268,0,1)
				elseif(player.side==2) then
					player:throw(player.x,player.y+bowrange,1268,0,1)
				elseif(player.side==3) then
					player:throw(player.x-bowrange,player.y,1268,0,1)
				end
				player:sendMinitext("You didn't hit anything.")
			end
			if(player.side==0) then
				player:throw(Mob(mobtable[r]).x,Mob(mobtable[r]).y,1268,0,1)
			elseif(player.side==1) then
				player:throw(Mob(mobtable[r]).x,Mob(mobtable[r]).y,1268,0,1)
			elseif(player.side==2) then
				player:throw(Mob(mobtable[r]).x,Mob(mobtable[r]).y,1268,0,1)
			elseif(player.side==3) then
				player:throw(Mob(mobtable[r]).x,Mob(mobtable[r]).y,1268,0,1)
			end
			
			if(player.magic > 3300) then
				player:addMana(-3300)
				player:sendMinitext("Fireball thrown")
				Mob(mobtable[r]).attacker=player.ID
				Mob(mobtable[r]):sendAnimation(8)
				Mob(mobtable[r]):removeHealthExtend(10550, 1, 1, 1, 1, 0)
			else
				player:sendMinitext("You do not have enough mana!")
			end

		else	
			if(player.side==0) then
				player:throw(player.x,player.y-bowrange,1268,0,1)
			elseif(player.side==1) then
				player:throw(player.x+bowrange,player.y,1268,0,1)
			elseif(player.side==2) then
				player:throw(player.x,player.y+bowrange,1268,0,1)
			elseif(player.side==3) then
				player:throw(player.x-bowrange,player.y,1268,0,1)
			end
			player:sendMinitext("You didn't hit anything.")
		end
		
	end
}