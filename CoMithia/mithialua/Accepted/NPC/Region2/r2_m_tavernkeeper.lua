r2_m_tavernkeeper = {
click = async(function(player,npc)
	local t={graphic=convertGraphic(185,"monster"),color=4}
	local opts = { }
	local optsPO = {}
	local welcomemsg = {"Welcome to my inn. How can I help you?",
	"Welcome!","Welcome, how may I help you?",
	"Welcome, we have the finest wine barrels!",
	"Welcome "..player.name..". Would you fancy some liquor?"}
	local rwelcome = math.random(#welcomemsg)
	local buymsg = {"What do you wish to buy?","What do you wish to buy today?","What would you like to buy?","What can I offer you?"}
	local rbuy = math.random(#buymsg)
	local sellmsg = {"What do you wish to sell?","What would you like to sell?","What would you like to sell today?"}
	local rsell = math.random(#sellmsg)
	local offer_items = {}
		if (player.sex == 0) then
			offer_items = {200000007,200000041,200000075,200000109}
		else
			offer_items = {200000008,200000042,200000076,200000110}
		end
	local offer_item = offer_items[math.random(#offer_items)]
	
	player.npcGraphic=t.graphic
	player.npcColor=t.color
	player.dialogType = 0
	table.insert(opts,"Buy")
	table.insert(opts,"Sell")
	table.insert(opts,"Power Nap")
	table.insert(opts,"Deposit Item")
	table.insert(opts,"Withdraw Item")
	table.insert(opts,"Deposit Money")
	table.insert(opts,"Withdraw Money")
	table.insert(opts,"Post Office Services")
		
	if(#opts~=0) then
		local menuOption=player:menuString(""..welcomemsg[rwelcome],opts)
		if(menuOption=="Buy") then
			player:buyExtend(buymsg[rbuy],{170})
		elseif(menuOption=="Sell") then
			player:sellExtend(sellmsg[rsell],{0})
		elseif(menuOption=="Power Nap") then
			player:dialogSeq({t, "A power nap allows you to borrow one of our beds for a nap. Power naps are used by the strongest of adventurers to regain their health and mana."}, 1)
			local nap = player:menuString("Would you like to spend "..(player.level * 50).." gold to power nap?", {"Yes", "No"})
			if (nap == "Yes") then
				if (player:removeGold(player.level * 50)) then
					power_nap.cast(npc, player)
				end
			end
		elseif(menuOption=="Deposit Item") then
			player:showBankAdd("What do you wish to deposit?")
		elseif(menuOption=="Withdraw Item") then
			--player.registry["isBanking"] = 1
			player:showBank("What do you wish to withdraw?")
			--player.registry["isBanking"] = 0
		elseif(menuOption=="Deposit Money") then
			player:bankAddMoney()
		elseif(menuOption=="Withdraw Money") then
			player:bankWithdrawMoney()
		elseif(menuOption=="Post Office Services") then
			local item = player:getParcel()
			table.insert(optsPO,"Send")
			if (item ~= false) then
				table.insert(optsPO,"Receive")
			end
			local menuOptionPO=player:menuString("Post Office Services",optsPO)
			if (menuOptionPO=="Send") then
				player:sendParcelTo(npc)
			elseif (menuOptionPO=="Receive") then
				player:receiveParcelFrom(npc)
			end

		end
	end
end)
}