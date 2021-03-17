innerStrength = {


action = function(npc)
	--mob id's or ynames?
	local id = {}--Position determines what wave they belong to
	--amount of each mob
	local amount = {}--Position determines what wave they belong to
	local wave = npc.mapRegistry["wave"]
	local waveMax = 5
	local x, y, i, j
	local xBoundaries = {3, 14}
	local yBoundaries = {3, 12}
	local breakLoop = 50
	
	for i = 1, amount[wave] do
		j = 0
		x = math.random(xBoundaries[1], xBoundaries[2])
		y = math.random(yBoundaries[1], yBoundaries[2])
		local mobBlock = npc:getObjectsInCell(npc.m, x, y, BL_MOB)
		local pcBlock = npc:getObjectsInCell(npc.m, x, y, BL_PC)
		repeat
			x = math.random(xBoundaries[1], xBoundaries[2])
			y = math.random(yBoundaries[1], yBoundaries[2])
			mobBlock = npc:getObjectsInCell(npc.m, x, y, BL_MOB)
			pcBlock = npc:getObjectsInCell(npc.m, x, y, BL_PC)
			j = j + 1
			if (j > breakLoop) then
				break
			end
		until (#mobBlock == 0 and #pcBlock == 0)
		--Spawning time
		npc:spawn(id[wave], x, y, amount[wave], npc.m)
	end
	
	npc:talk(0, ""..npc.name..": Wave "..wave..".")
		
	if (wave == waveMax) then	
		--do ending
	end
end
}