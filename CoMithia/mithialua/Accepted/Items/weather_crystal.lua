weather_crystal = {
use = function(player)
	local duration = 120
	local weather
	if (player.mapRegistry["artificial_weather_timer"] < os.time() or player:hasDuration("weather_override")) then
		repeat
			weather = math.random(0, 3)
		until (weather ~= getWeatherM(player.m))
		
		player.mapRegistry["artificial_weather_timer"] = 0
		setWeatherM(player.m, weather)
		player.mapRegistry["artificial_weather_timer"] = os.time() + duration
		
		if (weather == WSUN) then
			player:broadcast(player.m, player.className.." "..player.name.." has changed the weather to: Sunny")
		elseif (weather == WRAIN) then
			player:broadcast(player.m, player.className.." "..player.name.." has changed the weather to: Rainy")
		elseif (weather == WSNOW) then
			player:broadcast(player.m, player.className.." "..player.name.." has changed the weather to: Snowy")
		elseif (weather == WBIRD) then
			player:broadcast(player.m, player.className.." "..player.name.." has changed the weather to: Windy")
		else
			player:broadcast(-1, player.className.." "..player.name.." is hacking.")
		end
		
		if (player:hasDuration("weather_override")) then
			player:removeItemSlot(player.invSlot, 2)
		else
			player:removeItemSlot(player.invSlot, 1)
		end
		player:setDuration("weather_override", 0)
	else
		player:setDuration("weather_override", 5000)
		player:sendMinitext("This is in effect for "..(player.mapRegistry["artificial_weather_timer"] - os.time()).."s, use another to override.")
	end
end
}