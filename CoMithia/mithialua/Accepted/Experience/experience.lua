totalExp = function(level)
	local total = 0
	
	for L = 1, level, 1 do
		total = total + toNextLevel(level)
	end
	
	return total
end

toNextLevel = function(level)
    return expCostAtLevel(level)*sellCount(level)
end


-- Sell count -> Ceiling[Ceiling[L/50]*3/2]
sellCount = function(level)
	if (level == 0) then
		return 2
	end
	return math.ceil(math.ceil(level/50)*1.5)
end

-- Sum[StatBuysLevel[l], {l, 1, L}]*100
totalStatAtLevel = function(level)
	local total = 0
	
	for L= 1, level, 1 do
		total = total + sellCount(L-1)*100
	end
	
	return total
end

--Ceiling[((Floor[(Sum[StatBuysLevel[l], {l, 1, L}]*100)/2]*5)*1.0008^L)/1000]*1000
expCostAtLevel = function(level)
	local sbl = totalStatAtLevel(level)
    
	return math.ceil(((math.floor(sbl/2)*5)*math.pow(1.0008,level))/1000)*1000 
end

totalSellsAtLevel = function(level)
	local total = 0
	
	for L= 0, level, 1 do
		total = total + sellCount(L)
	end
	
	return total
end

debug_exp = function(player, level)
	player:talk(0,"Total Exp required to level to "..level.." is "..format_number(totalExp(level)))
	player:talk(0,"Sells to level at "..level.." is "..format_number(sellCount(level)))
	player:talk(0,"Cost of stat at level "..level.." is "..format_number(expCostAtLevel(level)))
	player:talk(0,"Experience required to level from "..level.." to "..(level+1).." is "..format_number(toNextLevel(level)))
	player:talk(0,"Cumulative stats on you at start of "..level..format_number(totalStatAtLevel(level)))
end

debug_clock = function()

	local dt = mithia_lore_time()
	broadcast(-1, "Raw data: ["..curYear().." = curYear ] ["..curSeason().." = curSeason] ["..curDay().." = curDay] [".. curTime().."= curTime]")
	broadcast(-1, "["..dt.Year.." = year] ["..dt.SeasonOfYear.." = season] ["..dt.DayOfSeason.." = date] ["..
	                  dt.DayOfWeek.." = day] ["..dt.MonthOfYear.." = month] ["..dt.DayOfMonth.."= dayOfMonth] ["..dt.Time.."= time]")
	broadcast(-1, "Sento "..dt.Year.." |  "..dt.SeasonOfYear..", "..dt.DayOfWeek..", "..dt.MonthOfYear.." "..dt.DayOfMonth.." - "..dt.Time.." o' clock")
end