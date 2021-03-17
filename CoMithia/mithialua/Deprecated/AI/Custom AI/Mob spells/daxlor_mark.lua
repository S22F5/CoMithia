daxlor_mark = {
	cast=function(player,target)                               
        end,
        uncast=function(player)
		player.registry["daxlormarkcount"]=0
		player:sendMinitext("Daxlor doesn't seem to remember you anymore!")
		
	end,
        recast=function(player)
        end


}