red_bobber = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1) then
		player:sendMinitext("Yeah nice try...")
	end
	
	if(player:hasItem("red_bobber",1)) then
		player:sendAnimation(16,1)
		player:removeItem("red_bobber",1)
		player:sendAction(6,20)
		player:playSound(64)
		player.registry["bobberColor"] = 0
		player:refresh()
	end
end
}

yellow_bobber = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1) then
		player:sendMinitext("Yeah nice try...")
	end
	
	if(player:hasItem("yellow_bobber",1)) then
		player:sendAnimation(16,1)
		player:removeItem("yellow_bobber",1)
		player:sendAction(6,20)
		player:playSound(64)
		player.registry["bobberColor"] = 1
		player:refresh()
	end
end
}

green_bobber = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1) then
		player:sendMinitext("Yeah nice try...")
	end
	
	if(player:hasItem("green_bobber",1)) then
		player:sendAnimation(16,1)
		player:removeItem("green_bobber",1)
		player:sendAction(6,20)
		player:playSound(64)
		player.registry["bobberColor"] = 2
		player:refresh()
	end
end
}

white_bobber = {
use = function(player)
	
	if(player.state == 1) then
		player:sendMinitext("Spirits can't use this item")
		return
	elseif (player.state == 3) then
		player:sendMinitext("You can not do this right now")
		return
	elseif (player.registry["inCarnage"] == 1) then
		player:sendMinitext("Yeah nice try...")
	end
	
	if(player:hasItem("white_bobber",1)) then
		player:sendAnimation(16,1)
		player:removeItem("white_bobber",1)
		player:sendAction(6,20)
		player:playSound(64)
		player.registry["bobberColor"] = 3
		player:refresh()
	end
end
}