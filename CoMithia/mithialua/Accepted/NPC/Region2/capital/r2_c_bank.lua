r2_c_bank = {
click = async(function(player,npc)
	local npcG = {graphic = convertGraphic(1154, "monster"), color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0
	local options = {}
	table.insert(options,"Deposit Item")
	table.insert(options,"Withdraw Item")
	--table.insert(options,"Deposit Money")
	--table.insert(options,"Withdraw Money")

	if(#options ~= 0) then
		local menuOption = player:menuString("Here to deposit or donate?", options)
		if(menuOption=="Deposit Item") then
			player:showBankAdd("What do you wish to deposit?")
		elseif(menuOption=="Withdraw Item") then
			--player.registry["isBanking"] = 1
			player:showBank("What do you wish to withdraw?")
			--player.registry["isBanking"] = 0
		elseif(menuOption=="Deposit Money") then
			player:bankAddMoney()
		elseif(menuOption=="Withdraw Money") then
			player:bankWithdrawMoney()
		else
			player:broadcast(-1, ""..player.name.." is trying to hack the bank.")
		end
	end
end)
}