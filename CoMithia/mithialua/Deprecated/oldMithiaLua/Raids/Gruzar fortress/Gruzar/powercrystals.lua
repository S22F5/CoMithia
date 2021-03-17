red_power_crystal = {
		cast=function(player,target)
		end,

		while_cast=function(player)

			player:sendAnimation(209)
			player.mapRegistry["redcrystal"]=1
		end,

		uncast=function(player)
			player:broadcast(player.m,"-"..player.name.." stops focusing the Red crystal.")
			player.mapRegistry["redcrystal"]=0
			player.paralyzed=false


		end
}

yellow_power_crystal = {
		cast=function(player,target)
		end,

		while_cast=function(player)

			player:sendAnimation(210)
			player.mapRegistry["yellowcrystal"]=1
		end,

		uncast=function(player)
			player:broadcast(player.m,"-"..player.name.." stops focusing the Yellow crystal.")
			player.mapRegistry["yellowcrystal"]=0
			player.paralyzed=false


		end
}

green_power_crystal = {
		cast=function(player,target)
		end,

		while_cast=function(player)

			player:sendAnimation(211)
			player.mapRegistry["greencrystal"]=1

		end,

		uncast=function(player)
			player:broadcast(player.m,"-"..player.name.." stops focusing the Green crystal.")
			player.mapRegistry["greencrystal"]=0
			player.paralyzed=false


		end
}

blue_power_crystal = {
		cast=function(player,target)
		end,

		while_cast=function(player)

			player:sendAnimation(212)
			player.mapRegistry["bluecrystal"]=1

		end,

		uncast=function(player)
			player:broadcast(player.m,"-"..player.name.." stops focusing the Blue crystal.")
			player.mapRegistry["bluecrystal"]=0
			player.paralyzed=false


		end
}

