hid000728 = {
	click=function(player)
		if(player.registry["tut2"]<3) then
			player:warp(0,7,26)
			player:sendMinitext("A strange force pushes you back...")
		end
	end
}

hid000628 = {
	click=function(player)
		if(player.registry["tut2"]<3) then
			player:warp(0,6,26)
			player:sendMinitext("A strange force pushes you back...")
		end
	end
}
hid020803 = {
	click=function(player)
		if(player.registry["tut2"]<4) then
			player:warp(2,5,3)
			player:sendMinitext("Maybe you should talk to Ralf first...")
		end
	end
}
hid176367 = {
	click=function(player)
		if(player.side==0) then
			player:sendMinitext("Mithia's butcher")
		end
	end
}
hid176467 = {
	click=function(player)
		if(player.side==0) then
			player:sendMinitext("Mithia's butcher")
		end
	end
}		