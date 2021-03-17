green_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("green_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("green_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 1
		player:refresh()
	end
end
}

white_dye = {
use = function(player)
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("white_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("white_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 29
		player:refresh()
	end
end
}

black_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("black_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("black_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 28
		player:refresh()
	end
end
}

red_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("red_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("red_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 31
		player:refresh()
	end
end
}

blue_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("blue_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("blue_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 17
		player:refresh()
	end
end
}

yellow_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("yellow_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("yellow_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 30
		player:refresh()
	end
end
}

orange_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("orange_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("orange_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 20
		player:refresh()
	end
end
}

dark_green_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("dark_green_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("dark_green_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 73
		player:refresh()
	end
end
}

tan_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("tan_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("tan_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 9
		player:refresh()
	end
end
}

bondi_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("bondi_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("bondi_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 50
		player:refresh()
	end
end
}

maroon_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("maroon_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("maroon_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 88
		player:refresh()
	end
end
}

purple_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("purple_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("purple_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 128
		player:refresh()
	end
end
}

pink_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("pink_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("pink_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 174
		player:refresh()
	end
end
}

burnt_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("burnt_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("burnt_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 134
		player:refresh()
	end
end
}

grey_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("grey_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("grey_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 142
		player:refresh()
	end
end
}

hot_pink_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("hot_pink_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("hot_pink_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 162
		player:refresh()
	end
end
}

gold_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("gold_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("gold_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 171
		player:refresh()
	end
end
}

shiny_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("shiny_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("shiny_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 249
		player:refresh()
	end
end
}

elegant_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("elegant_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("elegant_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 26
		player:refresh()
	end
end
}

bright_elegant_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("bright_elegant_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("bright_elegant_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 27
		player:refresh()
	end
end
}

dark_blue_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("dark_blue_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("dark_blue_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 69
		player:refresh()
	end
end
}

sky_blue_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("sky_blue_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("sky_blue_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 18
		player:refresh()
	end
end
}

salmon_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("salmon_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("salmon_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 213
		player:refresh()
	end
end
}

turquoise_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("turquoise_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("turquoise_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 193
		player:refresh()
	end
end
}

brown_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("brown_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("brown_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 12
		player:refresh()
	end
end
}

murky_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("murky_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("murky_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 23
		player:refresh()
	end
end
}

emerald_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("emerald_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("emerald_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 22
		player:refresh()
	end
end
}

steel_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("steel_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("steel_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 111
		player:refresh()
	end
end
}

woodland_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("woodland_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("woodland_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 245
		player:refresh()
	end
end
}

ocean_dye = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1 or (player.m >= 7000 and player.m < 8000)) then
		player:sendMinitext("Yeah nice try...")
		return
	end
	
	if(player:hasItem("ocean_dye",1)) then
		player:sendAnimation(16,1)
		player:removeItem("ocean_dye",1)
		player:sendAction(6,60)
		player:playSound(86)
		player.armorColor = 19
		player:refresh()
	end
end
}