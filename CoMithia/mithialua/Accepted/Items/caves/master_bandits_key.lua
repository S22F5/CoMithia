master_bandits_key = {

use = function(player)
	local spellg = 332
	if(player.m == 90 and getTile(player.m,player.x,player.y) == 27936 and player.x == 1 and player.y == 16
	and getTile(90, 1, 13) == 27910) then
		setTile(90,1,13,1785)
		setTile(90,2,13,1786)
		setTile(90,3,13,1787)
		setTile(90,1,14,1788)
		setTile(90,2,14,1789)
		setTile(90,3,14,1790)
		player:sendAnimationXY(spellg,1,14,1)
		player:sendAnimationXY(spellg,2,14,1)
		player:sendAnimationXY(spellg,3,14,1)
		r2_ruins_cellar_leftstairs.setCloseTimer()
	elseif(player.m == 90 and getTile(player.m,player.x,player.y) == 27936 and player.x == 1 and player.y == 16
	and getTile(90, 1, 13) == 1785) then
		setTile(90,1,13,27910)
		setTile(90,2,13,27910)
		setTile(90,3,13,27910)
		setTile(90,1,14,27910)
		setTile(90,2,14,27910)
		setTile(90,3,14,27910)
		player:sendAnimationXY(spellg,1,14,1)
		player:sendAnimationXY(spellg,2,14,1)
		player:sendAnimationXY(spellg,3,14,1)
		r2_ruins_cellar_leftstairs.clearCloseTimer()
	elseif(player.m == 200 and getObject(200,6,2) == 11739 and (player.x == 6 or player.x == 7) and player.y == 3) then
		player:talk(2,"Click!")
		r2_newruins_1stdoor.openDoor()
	elseif(player.m == 200 and getObject(200,26,2) == 11739 and (player.x == 26 or player.x == 27) and player.y == 3) then
		player:talk(2,"Click!")
		r2_newruins_2nddoor.openDoor()
	elseif(player.m == 202 and getObject(202,14,9) == 11739 and (player.x == 14 or player.x == 15) and player.y == 10) then
		player:talk(2,"Click!")
		r2_newruins_3rddoor.openDoor()
	elseif(player.m == 201 and getObject(201,14,9) == 11739 and (player.x == 14 or player.x == 15) and player.y == 10) then
		player:talk(2,"Click!")
		r2_newruins_4thdoor.openDoor()
	elseif(player.m == 205 and getObject(205,17,2) == 11739 and (player.x == 17 or player.x == 18) and player.y == 3) then
		player:talk(2,"Click!")
		r2_newruins_4thdoor.openDoor()
	end
end

}