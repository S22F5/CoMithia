hid17002710 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1702,17,29)
		elseif(player.level>=70) then
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		else
			player:warp(1700,27,11)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid17002810 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1702,18,29)
		elseif(player.level>=70) then
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		else
			player:warp(1700,28,11)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}


hid17013017 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1702,6,17)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17013018 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1702,6,18)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17020517 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1701,29,17)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17020518 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1701,29,18)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17021730 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1700,27,11)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17021830 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1700,28,11)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17023012 = {
	click=function(player)		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1703,6,12)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17023013 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1703,6,13)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17030512 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1702,29,12)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17030513 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1702,29,13)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17031705 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1706,17,29)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17031805 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1706,18,29)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17061730 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1703,17,6)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17061830 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1703,18,6)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17061705 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1709,17,29)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17061805 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1709,18,29)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17060512 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1705,29,12)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17060513 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1705,29,13)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17053012 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1706,6,12)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17053013 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1706,6,13)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17050517 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1704,29,17)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17050518 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1704,29,18)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17043017 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1705,6,17)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17043018 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1705,6,18)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17041205 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1707,12,29)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17041305 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1707,13,29)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17071230 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1704,12,6)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17071330 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1704,13,6)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17073017 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1708,6,17)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17073018 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1708,6,18)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17080517 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1707,29,17)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17080518 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1707,29,18)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17081705 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1710,17,29)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17081805 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1710,18,29)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17091730 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1706,17,6)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17091830 = {
	click=function(player)
		if(player.state==1) then
			player:sendMinitext("You can't go in there if you're dead.")
			return
		end
		local r=math.random(1,10)
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			player:warp(1706,18,6)
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end
}
hid17101730 = {
	click=async(function(player,npc)
		local opts = { }
		local r=math.random(1,10)
		table.insert(opts,"Yes, I do.")
		table.insert(opts,"No, I do not.")
		player.npcGraphic=0
		player.npcColor=0
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			local menuOption=player:menuString2("Do you wish to be transported back to the Entrance Room?",opts)
				if(menuOption=="Yes, I do.") then
					player:warp(1700,27,11)
				end
		end
	end)
}
hid17101830 = {
	click=async(function(player,npc)
		local opts = { }
		local r=math.random(1,10)
		table.insert(opts,"Yes, I do.")
		table.insert(opts,"No, I do not.")
		player.npcGraphic=0
		player.npcColor=0
		if(player:hasItem("labyrinth_map",1) and player.registry["icelabyrinthquest"]>=6  and player.level>=70) then
			local menuOption=player:menuString2("Do you wish to be transported back to the Entrance Room?",opts)
				if(menuOption=="Yes, I do.") then
					player:warp(1700,28,11)
				end
		else
			if(r==1) then
				player:warp(1701,29,17)
			elseif(r==2) then
				player:warp(1702,17,29)
			elseif(r==3) then
				player:warp(1703,6,12)
			elseif(r==4) then
				player:warp(1704,29,17)
			elseif(r==5) then
				player:warp(1705,29,12)
			elseif(r==6) then
				player:warp(1706,17,29)
			elseif(r==7) then
				player:warp(1707,12,29)
			elseif(r==8) then
				player:warp(1708,6,17)
			elseif(r==9) then
				player:warp(1709,17,29)
			elseif(r==10) then
				player:warp(1700,27,11)
			end
			player:sendMinitext("...you feel lost...")
		end
	end)
}


