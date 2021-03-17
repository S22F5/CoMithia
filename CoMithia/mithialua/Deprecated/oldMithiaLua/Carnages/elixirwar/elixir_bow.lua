elixir_bow = {
	thrown = function(player,target)
		if(player.m<2081 or player.m>2099) then
			player:sendAction(1,30)
			return
		end
		if(player.registry["elixirarrowsleft"]<=0) then
			player:sendMinitext("You are out of arrows.")
			player:sendAction(1,30)
			return
		end
		if(player.armorColor==15) then
			player:sendMinitext("You can not shoot arrows when you're hosting.")
			return
		end




		local check={}
		check=player:calcThrow()
		if(check~=nil and check[1].blType~=BL_NPC and check[1].blType~=BL_MOB) then
			if(player.side==0) then
				player:throw(check[1].x,check[1].y,6,0,1)
			elseif(player.side==1) then
				player:throw(check[1].x,check[1].y,7,0,1)
			elseif(player.side==2) then
				player:throw(check[1].x,check[1].y,8,0,1)
			elseif(player.side==3) then
				player:throw(check[1].x,check[1].y,9,0,1)
			end
			if(player.mapRegistry["bowrate"]<math.random(1,100)) then
				player:sendMinitext("You missed!")
				player.registry["elixirarrowsleft"]=player.registry["elixirarrowsleft"]-1
				player:sendMinitext("You have "..player.registry["elixirarrowsleft"].." arrows left.")
				return
			end
			if(check[1].armorColor~=15) then
				if(player.registry["elixircolor"]==63) then
					if(check[1].registry["elixircolor"]==65) then
						if(check[1].armorColor~=21) then
							check[1].registry["elixirkiller"]=player.ID
						end
						check[1].armorColor=21
					elseif(check[1].registry["elixircolor"]==63) then
						check[1].armorColor=63
					end
				elseif(player.registry["elixircolor"]==65) then
					if(check[1].registry["elixircolor"]==65) then
						check[1].armorColor=65
					elseif(check[1].registry["elixircolor"]==63) then
						if(check[1].armorColor~=19) then
							check[1].registry["elixirkiller"]=player.ID
						end
						check[1].armorColor=19
					end
				end
				check[1].registry["elixirx"]=check[1].x
				check[1].registry["elixiry"]=check[1].y
				check[1]:sendStatus()
				check[1]:updateState()
			end
		elseif(check~=nil and (check[1].blType==BL_NPC or check[1].blType==BL_MOB)) then
			if(player.side==0) then
				player:throw(check[1].x,check[1].y,6,0,1)
			elseif(player.side==1) then
				player:throw(check[1].x,check[1].y,7,0,1)
			elseif(player.side==2) then
				player:throw(check[1].x,check[1].y,8,0,1)
			elseif(player.side==3) then
				player:throw(check[1].x,check[1].y,9,0,1)
			end
			player:sendMinitext("You did not hit a player!")
		else
			local bowrange=player.mapRegistry["bowrange"]
			if(player.side==0) then
				player:throw(player.x,player.y-bowrange,6,0,1)
			elseif(player.side==1) then
				player:throw(player.x+bowrange,player.y,7,0,1)
			elseif(player.side==2) then
				player:throw(player.x,player.y+bowrange,8,0,1)
			elseif(player.side==3) then
				player:throw(player.x-bowrange,player.y,9,0,1)
			end
			player:sendMinitext("You didn't hit anything.")
		end
		player:sendAction(1,30)
		player.registry["elixirarrowsleft"]=player.registry["elixirarrowsleft"]-1
		player:sendMinitext("You have "..player.registry["elixirarrowsleft"].." arrows left.")

		

	end
}