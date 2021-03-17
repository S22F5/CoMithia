chemists_table = { 
	click=async(function(player,npc)
	
		local npcG = {graphic = convertGraphic(835, "monster"), color=0}
		player.dialogType = 0
		player.npcGraphic = npcG.graphic
		player.npcColor = npcG.color
		
		local token = "alcohol_bottle"
		--materialTable contains: [1]-yname of craftable [2]yname of product [3]amount crafted per token [4]seconds for each to craft [5]sucess rate 0-100 [6]skill advance [7] materialID [8] amount in inventory
		local alcoholTable = {{"scarlet_bloom_item", "scarlet_tincture", 50, 30, 100, "chemist", 1, 1}}
		refining.refine(player, npcG, "chemist", 91, token, alcoholTable, 1, { })
	end)
}