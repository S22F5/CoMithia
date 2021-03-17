auction_master = {
	click =async(function(player,npc)


	player:dialogSeq({"Disabled until SQL Auction House Implementation"})

	local t={graphic=convertGraphic(877,"monster"),color=0}
	local auctioneditems = {}
	local sellbuy = {}
	local ownitems ={}
	local criterias = {}
	local itemsbyname = {}
	local itemsbycost = {}
	local earningschoice = {}

        player.npcGraphic=t.graphic
	player.npcColor=t.color

	table.insert(sellbuy,"Put item on sale")
	table.insert(sellbuy,"Cancel sale")
	table.insert(sellbuy,"Check items on sale")
	table.insert(sellbuy,"Sales search by criterias")
	table.insert(sellbuy,"============================")
	table.insert(sellbuy,"Auction an item")
	table.insert(sellbuy,"Place a bid on an item")
	table.insert(sellbuy,"Auctions search by criterias")
	table.insert(sellbuy,"============================")
	table.insert(sellbuy,"Collect earnings")

	table.insert(criterias,"Item name")
	table.insert(criterias,"Cost range")

	table.insert(earningschoice,"Money")
	table.insert(earningschoice,"Items")
	
	local menuChoice=player:menuString("How can I help you?",sellbuy)


	if(menuChoice=="Check items on sale") then

		for i=1,player.mapRegistry["auctionhousecurrentnumber"] do
			if(player.mapRegistry["auctionhouse"..i.."id"]>0 and player.mapRegistry["auctionhouse"..i.."count"]>0 and player.mapRegistry["auctionhouse"..i.."price"]>0 and player.mapRegistry["auctionhouse"..i.."sellerid"]>0 and (player.mapRegistry["auctionhouse"..i.."timelimit"]>os.time() or player.mapRegistry["auctionhouse"..i.."timelimit"]==0)) then
				table.insert(auctioneditems,"("..i..") : "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name.." ("..player.mapRegistry["auctionhouse"..i.."count"]..") - "..player.mapRegistry["auctionhouse"..i.."price"].." coins")
			end
		end

		if(#auctioneditems==0) then
			player:dialogSeq({t,"No items are currently being sold, sorry."})
			return
		end

		local choice=player:menuString2("Items for sale :",auctioneditems)


		for i=1,player.mapRegistry["auctionhousecurrentnumber"] do
			if(choice=="("..i..") : "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name.." ("..player.mapRegistry["auctionhouse"..i.."count"]..") - "..player.mapRegistry["auctionhouse"..i.."price"].." coins") then
			local itemname=player.mapRegistry["auctionhouse"..i.."id"]
			local itemprice=player.mapRegistry["auctionhouse"..i.."price"]
			local itemcount=player.mapRegistry["auctionhouse"..i.."count"]
			local itemsellerid=player.mapRegistry["auctionhouse"..i.."sellerid"]
			if(player.mapRegistry["auctionhouse"..i.."sellerid"]==player.ID) then
				player:dialogSeq({t,"You may not buy your own items."})
			end	
			player:dialogSeq({t,"You are about to pay "..player.mapRegistry["auctionhouse"..i.."price"].." coins for "..player.mapRegistry["auctionhouse"..i.."count"].." "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name..". Are you certain of your decision? If You are, click next to proceed."},1)
				if(player.money>=player.mapRegistry["auctionhouse"..i.."price"]) then
					local salewithdrawchoice=player:menuString2("Where to you wish to direct the item? ((Attention: If you choose inventory and you do not have enough space to hold everything, the rest of the items will fall on the ground!))",{"My inventory","My bank"})
					if(salewithdrawchoice=="My inventory") then
						if(player.mapRegistry["auctionhouse"..i.."id"]==itemname and player.mapRegistry["auctionhouse"..i.."count"]==itemcount and player.mapRegistry["auctionhouse"..i.."price"]==itemprice and player.mapRegistry["auctionhouse"..i.."sellerid"]==itemsellerid) then
							player.mapRegistry["sellerid"..itemsellerid.."total"]=player.mapRegistry["sellerid"..itemsellerid.."total"]+itemprice
							if(player.mapRegistry["sellerid"..itemsellerid.."usedslots"]>0) then
								player.mapRegistry["sellerid"..itemsellerid.."usedslots"]=player.mapRegistry["sellerid"..itemsellerid.."usedslots"]-1
							end
							player.mapRegistry["auctionhouse"..i.."id"]=0
							player.mapRegistry["auctionhouse"..i.."price"]=0
							player.mapRegistry["auctionhouse"..i.."count"]=0
							player.mapRegistry["auctionhouse"..i.."sellerid"]=0
							player.mapRegistry["auctionhouse"..i.."timelimit"]=0
							player:addItem(itemname,itemcount)
							player.money=player.money-itemprice
							player:sendStatus()
						else
							player:dialogSeq({t,"Sorry, but this item has already been sold or the sale was cancelled"})
						end
					elseif(salewithdrawchoice=="My bank") then
						if(not Item(itemname).depositable) then
								player:dialogSeq({t,"This item can't be banked."})
						end
						if(player.mapRegistry["auctionhouse"..i.."id"]==itemname and player.mapRegistry["auctionhouse"..i.."count"]==itemcount and player.mapRegistry["auctionhouse"..i.."price"]==itemprice and player.mapRegistry["auctionhouse"..i.."sellerid"]==itemsellerid) then
							local itemname=player.mapRegistry["auctionhouse"..i.."id"]
							local itemcount=player.mapRegistry["auctionhouse"..i.."count"]
							player.mapRegistry["sellerid"..itemsellerid.."total"]=player.mapRegistry["sellerid"..itemsellerid.."total"]+itemprice
							if(player.mapRegistry["sellerid"..itemsellerid.."usedslots"]>0) then
								player.mapRegistry["sellerid"..itemsellerid.."usedslots"]=player.mapRegistry["sellerid"..itemsellerid.."usedslots"]-1
							end
							player.mapRegistry["auctionhouse"..i.."id"]=0
							player.mapRegistry["auctionhouse"..i.."price"]=0
							player.mapRegistry["auctionhouse"..i.."count"]=0
							player.mapRegistry["auctionhouse"..i.."sellerid"]=0
							player.mapRegistry["auctionhouse"..i.."timelimit"]=0
							player.money=player.money-itemprice
							player:sendStatus()
							local count=player.registry["bankcount"]
	
							if(count==0) then
								player.registry["bankcount"]=1
								player.registry["bank1"]=itemname
								player.registry["bank1count"]=itemcount
								player:dialogSeq({t,"The item has been transfered to your bank"})		
							end
	
							for i=1,count do
								if(player.registry["bank" .. i]==itemname) then
									player.registry["bank" .. i .. "count"]=player.registry["bank" .. i .. "count"]+itemcount
									player:dialogSeq({t,"The item has been transfered to your bank"})
									return
								end
							end
	
							player.registry["bankcount"]=count+1
							player.registry["bank" .. count+1]=itemname
							player.registry["bank" .. count+1 .. "count"]=itemcount
							player:sendStatus()
							player:dialogSeq({t,"The item has been transfered to your bank"})
						else
							player:dialogSeq({t,"Sorry, but this item has already been sold or the sale was cancelled"})
						end
					end
				else
					player:dialogSeq({t,"You do not have enough money."})
				end
			end
		end

	elseif(menuChoice=="Collect earnings") then
		player:dialogSeq({t,"This tool allows you to collect profits from sales, but also any bid you made that was outbid as well as the Items from the Auctions you won."},1)

		local earningmenu=player:menuString2("Which of your earnings do you wish to collect?",earningschoice)

			if(earningmenu=="Money") then
				if(player.mapRegistry["sellerid"..player.ID.."total"]>=0) then

					for i=1,player.mapRegistry["ahauctioncurrentnumber"] do

						if(player.mapRegistry["ahauction"..i.."sellerid"]==player.ID and os.time()>=player.mapRegistry["ahauction"..i.."endingtime"] and player.mapRegistry["ahauction"..i.."price"]>0 and player.mapRegistry["ahauction"..i.."currentbidderid"]~=0) then
							player.mapRegistry["sellerid"..player.ID.."total"]=player.mapRegistry["sellerid"..player.ID.."total"]+player.mapRegistry["ahauction"..i.."price"]
							if(player.mapRegistry["ahauction"..i.."sellerid"]==player.ID) then
								player.mapRegistry["sellerid"..itemsellerid.."ahusedslots"]=player.mapRegistry["sellerid"..itemsellerid.."ahusedslots"]-1
							end
							player.mapRegistry["ahauction"..i.."price"]=0
							player.mapRegistry["ahauction"..i.."sellerid"]=0
						end

					end
					local tot=player.mapRegistry["sellerid"..player.ID.."total"]
					player:dialogSeq({t,"I am currently holding "..player.mapRegistry["sellerid"..player.ID.."total"].." coins from your sale(s) and failed bids. Click next if you want to collect them now."},1)
					player.money=player.money+tot
					player.mapRegistry["sellerid"..player.ID.."total"]=player.mapRegistry["sellerid"..player.ID.."total"]-tot
					player:sendStatus()
				else
					player:dialogSeq({t,"I am sorry, but none of the gold I am holding belongs to you."})
				end

			elseif(earningmenu=="Items") then

				for i=1,player.mapRegistry["ahauctioncurrentnumber"] do
					if(player.mapRegistry["ahauction"..i.."id"]>0 and player.mapRegistry["ahauction"..i.."count"]>0) then
						if((player.mapRegistry["ahauction"..i.."currentbidderid"]==0 and player.mapRegistry["ahauction"..i.."sellerid"]==player.ID) or player.mapRegistry["ahauction"..i.."currentbidderid"]==player.ID) then
							if(os.time()>=player.mapRegistry["ahauction"..i.."endingtime"]) then
								table.insert(auctioneditems,"("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..")")
							end
						end
					end
				end
				for j=1,player.mapRegistry["auctionhousecurrentnumber"] do
					if(player.mapRegistry["auctionhouse"..j.."id"]>0 and player.mapRegistry["auctionhouse"..j.."count"]>0 and player.mapRegistry["auctionhouse"..j.."sellerid"]==player.ID and player.mapRegistry["auctionhouse"..j.."timelimit"]<os.time()) then
						table.insert(auctioneditems,"("..j..") : "..Item(player.mapRegistry["auctionhouse"..j.."id"]).name.." ("..player.mapRegistry["auctionhouse"..j.."count"]..")")
					end
				end
						
				if(#auctioneditems==0) then
					player:dialogSeq({"I am sorry, but I am not currently holding any of your items."})
					return
				end
				
				local earningmenuitems=player:menuString2("Here are the items I am holding for you",auctioneditems)

				for i=1,player.mapRegistry["ahauctioncurrentnumber"] do
					if(earningmenuitems=="("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..")") then
						local earningswithdraw=player:menuString("Where do you wish to direct this item ? ((Attention: If you choose inventory and you do not have enough space to hold everything, the rest of the items will fall on the ground!))",{"My inventory","My bank"})
						if(earningswithdraw=="My inventory") then
							local itemname=player.mapRegistry["ahauction"..i.."id"]
							local itemcount=player.mapRegistry["ahauction"..i.."count"]
							local itemsellerid=player.mapRegistry["ahauction"..i.."sellerid"]
							player.mapRegistry["ahauction"..i.."currentbidderid"]=0
							player.mapRegistry["ahauction"..i.."id"]=0
							player.mapRegistry["ahauction"..i.."count"]=0
							if(itemsellerid==player.ID) then
								player.mapRegistry["sellerid"..itemsellerid.."ahusedslots"]=player.mapRegistry["sellerid"..itemsellerid.."ahusedslots"]-1
							end
							player:addItem(itemname,itemcount)
						elseif(earningswithdraw=="My bank") then
							local itemname=player.mapRegistry["ahauction"..i.."id"]
							local itemcount=player.mapRegistry["ahauction"..i.."count"]
							local itemsellerid=player.mapRegistry["ahauction"..i.."sellerid"]
							if(not Item(itemname).depositable) then
								player:dialogSeq({t,"This item can't be banked."})
							end
							player.mapRegistry["ahauction"..i.."currentbidderid"]=0
							player.mapRegistry["ahauction"..i.."id"]=0
							player.mapRegistry["ahauction"..i.."count"]=0
							if(itemsellerid==player.ID) then
								player.mapRegistry["sellerid"..itemsellerid.."ahusedslots"]=player.mapRegistry["sellerid"..itemsellerid.."ahusedslots"]-1
							end
							local max=player.registry["bankcount"]
	
							if(max==0) then
								player.registry["bankcount"]=1
								player.registry["bank1"]=itemname
								player.registry["bank1count"]=itemcount
								player:dialogSeq({t,"The item has been transfered to your bank"})		
							end
	
							for i=1,max do
								if(player.registry["bank" .. i]==itemname) then
									player.registry["bank" .. i .. "count"]=player.registry["bank" .. i .. "count"]+itemcount
									player:dialogSeq({t,"The item has been transfered to your bank"})
								end
							end
	
							player.registry["bankcount"]=max+1
							player.registry["bank" .. max+1]=itemname
							player.registry["bank" .. max+1 .. "count"]=itemcount
							player:dialogSeq({t,"The item has been transfered to your bank"})
						end
					end
				end

				for j=1,player.mapRegistry["auctionhousecurrentnumber"] do
					if(earningmenuitems=="("..j..") : "..Item(player.mapRegistry["auctionhouse"..j.."id"]).name.." ("..player.mapRegistry["auctionhouse"..j.."count"]..")") then
						local earningswithdraw=player:menuString("Where do you wish to direct this item ? ((Attention: If you choose inventory and you do not have enough space to hold everything, the rest of the items will fall on the ground!))",{"My inventory","My bank"})
						if(earningswithdraw=="My inventory") then
							local itemname=player.mapRegistry["auctionhouse"..j.."id"]
							local itemcount=player.mapRegistry["auctionhouse"..j.."count"]
							local itemsellerid=player.mapRegistry["auctionhouse"..i.."sellerid"]
							player.mapRegistry["auctionhouse"..j.."itemsellerid"]=0
							player.mapRegistry["auctionhouse"..j.."id"]=0
							player.mapRegistry["auctionhouse"..j.."count"]=0
							player.mapRegistry["auctionhouse"..j.."price"]=0
							player.mapRegistry["auctionhouse"..j.."timelimit"]=0
							if(player.mapRegistry["sellerid"..itemsellerid.."usedslots"]>0) then
								player.mapRegistry["sellerid"..itemsellerid.."usedslots"]=player.mapRegistry["sellerid"..itemsellerid.."usedslots"]-1
							end
							player:addItem(itemname,itemcount)
						elseif(earningswithdraw=="My bank") then
							local itemname=player.mapRegistry["auctionhouse"..j.."id"]
							local itemcount=player.mapRegistry["auctionhouse"..j.."count"]
							local itemsellerid=player.mapRegistry["auctionhouse"..i.."sellerid"]
							if(not Item(itemname).depositable) then
								player:dialogSeq({t,"This item can't be banked."})
							end
							player.mapRegistry["auctionhouse"..j.."itemsellerid"]=0
							player.mapRegistry["auctionhouse"..j.."id"]=0
							player.mapRegistry["auctionhouse"..j.."count"]=0
							player.mapRegistry["auctionhouse"..j.."price"]=0
							player.mapRegistry["auctionhouse"..j.."timelimit"]=0
							if(player.mapRegistry["sellerid"..itemsellerid.."usedslots"]>0) then
								player.mapRegistry["sellerid"..itemsellerid.."usedslots"]=player.mapRegistry["sellerid"..itemsellerid.."usedslots"]-1
							end
							local max=player.registry["bankcount"]
	
							if(max==0) then
								player.registry["bankcount"]=1
								player.registry["bank1"]=itemname
								player.registry["bank1count"]=itemcount
								player:dialogSeq({t,"The item has been transfered to your bank"})		
							end
	
							for i=1,max do
								if(player.registry["bank" .. i]==itemname) then
									player.registry["bank" .. i .. "count"]=player.registry["bank" .. i .. "count"]+itemcount
									player:dialogSeq({t,"The item has been transfered to your bank"})
								end
							end
	
							player.registry["bankcount"]=max+1
							player.registry["bank" .. max+1]=itemname
							player.registry["bank" .. max+1 .. "count"]=itemcount
							player:dialogSeq({t,"The item has been transfered to your bank"})
						end
					end
				end



			end

	elseif(menuChoice=="Put item on sale") then
		if(player.level<25) then
				player:dialogSeq({t,"You must be at least level 25 to use the auction house services."})
				return
		end
		if(player.gmLevel<99) then
			if(player.mapRegistry["sellerid"..player.ID.."usedslots"]>=player.mapRegistry["sellerid"..player.ID.."maxslots"]+1) then
					player:dialogSeq({t,"You are currently only allowed to put up "..(player.mapRegistry["sellerid"..player.ID.."maxslots"]+1).." item(s) for sale at the same time."})
					return
			end
		end
			
		local withdrawchoice=player:menuString2("Where do you wish to select your item from ?",{"Inventory"})--,"Bank"})
		if(withdrawchoice=="Inventory") then
			local sellList= { }
			local amount=0
	
			for x=0,25 do
				local item=nil
				item=player:getInventoryItem(x)
				if(item ~= nil) then
					if(item.dura==item.maxDura) then
						if(item.depositable and item.droppable and item.exchangeable) then
								table.insert(sellList,x)
						end
					end
				end
			end
			if(#sellList==0) then
				player:dialogSeq({t,"You have nothing you can sell."})
			return end
	
			local choice=player:sell2("What do you wish to put on sale?",sellList)
			local item=player:getInventoryItem(choice-1)

			     if(item.amount>1) then
					amount=math.abs(tonumber(math.ceil(player:input("How many do you wish to put on sale?"))))
					if(amount==0) then
						player:dialogSeq({t,"You can not do that!"})
					end

					if(amount>4000000000 or not player:hasItem(item.id,amount) == true) then 
						player:dialogSeq({t,"You do not possess that many!"})
					end
					
					
			     else
					amount=1
			     end


			local price=math.abs(tonumber(math.ceil(player:input("How much do you wish to put that lot on sale for?"))))

			local nchoice=player:menuString2("Are you sure you wish to put "..amount.." "..item.name.." for sale at a price of "..price.." coins?",{"Yes","No"})
			if(nchoice=="Yes" and player:hasItem(item.id,amount) == true) then
				for x=1,player.mapRegistry["auctionhousecurrentnumber"] do
					if(player.mapRegistry["auctionhouse"..x.."id"]==0 and player.mapRegistry["auctionhouse"..x.."price"]==0 and player.mapRegistry["auctionhouse"..x.."count"]==0 and player.mapRegistry["auctionhouse"..x.."sellerid"]==0 and player.mapRegistry["auctionhouse"..x.."timelimit"]==0) then
						player.mapRegistry["auctionhouse"..x.."id"]=item.id
						player.mapRegistry["auctionhouse"..x.."price"]=price
						player.mapRegistry["auctionhouse"..x.."count"]=amount
						player.mapRegistry["auctionhouse"..x.."sellerid"]=player.ID
						player.mapRegistry["auctionhouse"..x.."timelimit"]=os.time()+(60*60*24*7)
						player.mapRegistry["sellerid"..player.ID.."usedslots"]=player.mapRegistry["sellerid"..player.ID.."usedslots"]+1
						player:updateInv()
						player:sendStatus()
						player:removeItem(item.id,amount)
						player:dialogSeq({t,"Your item can now be bought."})
						return
					end
				end
					player.mapRegistry["auctionhousecurrentnumber"]=player.mapRegistry["auctionhousecurrentnumber"]+1
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."id"]=item.id
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."price"]=price
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."count"]=amount
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."sellerid"]=player.ID
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."timelimit"]=os.time()+(60*60*24*7)
					player.mapRegistry["sellerid"..player.ID.."usedslots"]=player.mapRegistry["sellerid"..player.ID.."usedslots"]+1
					player:updateInv()
					player:sendStatus()
					player:removeItem(item.id,amount)
					player:dialogSeq({t,"Your item can now be bought."})
			end
		
		elseif(withdrawchoice=="Bank") then


			local max=player.registry["bankcount"]
			local bank_item_table={}
			local bank_count_table={}
			local regname
			local found
			local amount=0
			if max==0 then 
				player:dialogSeq({"Your bank is empty."})
			end
	
			for x=1,max do
				regname="bank" .. x
				table.insert(bank_item_table,player.registry[regname])
				regname="bank" .. x .. "count"
				table.insert(bank_count_table,player.registry[regname])
			end

			local temp=player:buy("Select the item you wish to put on sale:",bank_item_table,bank_count_table)
	
			for x=1,max do
				if bank_item_table[x]==temp then
					found=x
					break
				end
			end
			if(not Item(bank_item_table[found]).droppable) then
				player:dialogSeq({t,"Sorry, this item can't be sold. ((Item is either non droppable or non exchangeable))"})
			end
			if(not Item(bank_item_table[found]).exchangeable) then
				player:dialogSeq({t,"Sorry, this item can't be sold. ((Item is either non droppable or non exchangeable))"})
			end
			if(Item(bank_item_table[found]).maxAmount>1) then
				amount=player:input("How many do you want to put for sale?")
				amount=math.ceil(math.abs(tonumber(amount)))
				if(amount==0) then
					player:dialogSeq({t,"You can not do that!"})
				end

				if(amount>bank_count_table[found]) then amount=bank_count_table[found] end
			else
				amount=1
			end

			local price=math.abs(tonumber(math.ceil(player:input("How much do you wish to put that lot on sale for?"))))
			local nchoice=player:menuString2("Are you sure you wish to put "..amount.." "..Item(bank_item_table[found]).name.." for sale at a price of "..price.." coins?",{"Yes","No"})
			if(nchoice=="Yes") then
				for x=1,player.mapRegistry["auctionhousecurrentnumber"] do
					if(player.mapRegistry["auctionhouse"..x.."id"]==0 and player.mapRegistry["auctionhouse"..x.."price"]==0 and player.mapRegistry["auctionhouse"..x.."count"]==0 and player.mapRegistry["auctionhouse"..x.."sellerid"]==0) then
						player.mapRegistry["auctionhouse"..x.."id"]=Item(bank_item_table[found]).id
						player.mapRegistry["auctionhouse"..x.."price"]=price
						player.mapRegistry["auctionhouse"..x.."count"]=amount
						player.mapRegistry["auctionhouse"..x.."sellerid"]=player.ID
						player.mapRegistry["auctionhouse"..x.."timelimit"]=os.time()+(60*60*24*7)
						player.mapRegistry["sellerid"..player.ID.."usedslots"]=player.mapRegistry["sellerid"..player.ID.."usedslots"]+1
						player.registry["bank" .. found .. "count"]=bank_count_table[found]-amount
						player:saveBank()
						player:updateInv()
						player:sendStatus()
						player:dialogSeq({t,"Your item can now be bought."})
						return
					end
				end
					player.mapRegistry["auctionhousecurrentnumber"]=player.mapRegistry["auctionhousecurrentnumber"]+1
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."id"]=Item(bank_item_table[found]).id
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."price"]=price
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."count"]=amount
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."sellerid"]=player.ID
					player.mapRegistry["auctionhouse"..player.mapRegistry["auctionhousecurrentnumber"].."timelimit"]=os.time()+(60*60*24*7)
					player.mapRegistry["sellerid"..player.ID.."usedslots"]=player.mapRegistry["sellerid"..player.ID.."usedslots"]+1
					player.registry["bank" .. found .. "count"]=bank_count_table[found]-amount
					player:saveBank()
					player:updateInv()
					player:sendStatus()
					player:dialogSeq({t,"Your item can now be bought."})
			end
		



		end

	

	elseif(menuChoice=="Cancel sale") then


		for i=1,player.mapRegistry["auctionhousecurrentnumber"] do

			if(player.mapRegistry["auctionhouse"..i.."sellerid"]==player.ID and player.mapRegistry["auctionhouse"..i.."id"]~=0 and (player.mapRegistry["auctionhouse"..i.."timelimit"]>os.time() or player.mapRegistry["auctionhouse"..i.."timelimit"]==0)) then
				table.insert(ownitems,"("..i..") : "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name.." ("..player.mapRegistry["auctionhouse"..i.."count"]..") - "..player.mapRegistry["auctionhouse"..i.."price"].." coins")
			end
		end

		local choice=player:menuString2("Here are the items you left with me for sale :",ownitems)

		for i=1,player.mapRegistry["auctionhousecurrentnumber"] do
			if(choice=="("..i..") : "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name.." ("..player.mapRegistry["auctionhouse"..i.."count"]..") - "..player.mapRegistry["auctionhouse"..i.."price"].." coins" and player.mapRegistry["auctionhouse"..i.."sellerid"]==player.ID) then
			local itemname=player.mapRegistry["auctionhouse"..i.."id"]
			local itemprice=player.mapRegistry["auctionhouse"..i.."price"]
			local itemcount=player.mapRegistry["auctionhouse"..i.."count"]
			local itemsellerid=player.mapRegistry["auctionhouse"..i.."sellerid"]	
			player:dialogSeq({t,"You are about to withdraw "..player.mapRegistry["auctionhouse"..i.."count"].." "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name.." from sales. Are you certain of your decision? If You are, click next to proceed."},1)
				local salewithdrawchoice=player:menuString2("Where to you wish to direct the item? ((Attention: If you choose inventory and you do not have enough space to hold everything, the rest of the items will fall on the ground!))",{"My inventory","My bank"})
				if(salewithdrawchoice=="My inventory") then
					if(player.mapRegistry["auctionhouse"..i.."id"]==itemname and player.mapRegistry["auctionhouse"..i.."count"]==itemcount and player.mapRegistry["auctionhouse"..i.."price"]==itemprice and player.mapRegistry["auctionhouse"..i.."sellerid"]==itemsellerid) then
						player.mapRegistry["auctionhouse"..i.."id"]=0
						player.mapRegistry["auctionhouse"..i.."price"]=0
						player.mapRegistry["auctionhouse"..i.."count"]=0
						player.mapRegistry["auctionhouse"..i.."sellerid"]=0
						player.mapRegistry["auctionhouse"..i.."timelimit"]=0
						if(player.mapRegistry["sellerid"..player.ID.."usedslots"]>0) then
							player.mapRegistry["sellerid"..player.ID.."usedslots"]=player.mapRegistry["sellerid"..player.ID.."usedslots"]-1
						end
						player:addItem(itemname,itemcount)
						player:sendStatus()
					else
						player:dialogSeq({t,"Sorry, but this item has already been sold."})
					end
				elseif(salewithdrawchoice=="My bank") then
					if(not Item(itemname).depositable) then
							player:dialogSeq({t,"This item can't be banked."})
					end
					moneycount=math.ceil(itemcount/Item(itemname).maxAmount)
					moneyamount=Item(itemname).price*0.10*moneycount
					moneychoice=player:menuString2("The fee is " .. moneyamount .. " do you accept?",{"Yes"},{"No"})
					if(moneychoice=="Yes") then
					if(player.mapRegistry["auctionhouse"..i.."id"]==itemname and player.mapRegistry["auctionhouse"..i.."count"]==itemcount and player.mapRegistry["auctionhouse"..i.."price"]==itemprice and player.mapRegistry["auctionhouse"..i.."sellerid"]==itemsellerid) then
							local itemname=player.mapRegistry["auctionhouse"..i.."id"]
							local itemcount=player.mapRegistry["auctionhouse"..i.."count"]
							player.mapRegistry["auctionhouse"..i.."id"]=0
							player.mapRegistry["auctionhouse"..i.."price"]=0
							player.mapRegistry["auctionhouse"..i.."count"]=0
							player.mapRegistry["auctionhouse"..i.."sellerid"]=0
							player.mapRegistry["auctionhouse"..i.."timelimit"]=0
							if(player.mapRegistry["sellerid"..player.ID.."usedslots"]>0) then
								player.mapRegistry["sellerid"..player.ID.."usedslots"]=player.mapRegistry["sellerid"..itemsellerid.."usedslots"]-1
							end
							local max=player.registry["bankcount"]
	
							if(max==0) then
								player.registry["bankcount"]=1
								player.registry["bank1"]=itemname
								player.registry["bank1count"]=itemcount
								player:dialogSeq({t,"The item has been transfered to your bank"})		
							end
	
							for i=1,max do
								if(player.registry["bank" .. i]==itemname) then
									player.registry["bank" .. i .. "count"]=player.registry["bank" .. i .. "count"]+itemcount
									player:dialogSeq({t,"The item has been transfered to your bank"})
								end
							end
	
							player.registry["bankcount"]=max+1
							player.registry["bank" .. max+1]=itemname
							player.registry["bank" .. max+1 .. "count"]=itemcount
							player:sendStatus()
							player:dialogSeq({t,"The item has been transfered to your bank"})
					else
						player:dialogSeq({t,"Sorry, but this item has already been sold."})
					end
					end


				end
			end
		end


	elseif(menuChoice=="Sales search by criterias") then


		local criteriachoice=player:menuString2("Which criteria do you wish to use?",criterias)

			if(criteriachoice=="Item name") then
				local partialname=string.lower(player:input("Please input the partial or total name of the item you are looking for"))
				for i=1,player.mapRegistry["auctionhousecurrentnumber"] do
					if(player.mapRegistry["auctionhouse"..i.."id"]>0 and player.mapRegistry["auctionhouse"..i.."count"]>0 and player.mapRegistry["auctionhouse"..i.."price"]>0 and player.mapRegistry["auctionhouse"..i.."sellerid"]>0 and (player.mapRegistry["auctionhouse"..i.."timelimit"]>os.time() or player.mapRegistry["auctionhouse"..i.."timelimit"]==0)) then
						if(string.find(string.lower(Item(player.mapRegistry["auctionhouse"..i.."id"]).name),partialname)~=nil) then
							table.insert(itemsbyname,"("..i..") : "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name.." ("..player.mapRegistry["auctionhouse"..i.."count"]..") - "..player.mapRegistry["auctionhouse"..i.."price"].." coins")
						end	
					end
				end

				if(#itemsbyname==0) then
						player:dialogSeq({t,"There are currently no items being sold containing the letters : "..partialname.."."})
				elseif(#itemsbyname>0) then
					local choice=player:menuString2("Items for sale containing the letters "..partialname.." :",itemsbyname)

					for i=1,player.mapRegistry["auctionhousecurrentnumber"] do
						if(choice=="("..i..") : "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name.." ("..player.mapRegistry["auctionhouse"..i.."count"]..") - "..player.mapRegistry["auctionhouse"..i.."price"].." coins") then
							local itemname=player.mapRegistry["auctionhouse"..i.."id"]
							local itemprice=player.mapRegistry["auctionhouse"..i.."price"]
							local itemcount=player.mapRegistry["auctionhouse"..i.."count"]
							local itemsellerid=player.mapRegistry["auctionhouse"..i.."sellerid"]	
							player:dialogSeq({t,"You are about to pay "..player.mapRegistry["auctionhouse"..i.."price"].." coins for "..player.mapRegistry["auctionhouse"..i.."count"].." "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name..". Are you certain of your decision? If You are, click next to proceed.((Be careful as if your inventory is full, the items will fall on the floor.))"},1)
								if(player.money>=player.mapRegistry["auctionhouse"..i.."price"]) then
									if(player.mapRegistry["auctionhouse"..i.."id"]==itemname and player.mapRegistry["auctionhouse"..i.."count"]==itemcount and player.mapRegistry["auctionhouse"..i.."price"]==itemprice and player.mapRegistry["auctionhouse"..i.."sellerid"]==itemsellerid) then
										player.mapRegistry["sellerid"..itemsellerid.."total"]=player.mapRegistry["sellerid"..itemsellerid.."total"]+itemprice
										player.mapRegistry["auctionhouse"..i.."id"]=0
										player.mapRegistry["auctionhouse"..i.."price"]=0
										player.mapRegistry["auctionhouse"..i.."count"]=0
										player.mapRegistry["auctionhouse"..i.."sellerid"]=0
										player.mapRegistry["auctionhouse"..i.."timelimit"]=0
										if(player.mapRegistry["sellerid"..itemsellerid.."usedslots"]>0) then
											player.mapRegistry["sellerid"..itemsellerid.."usedslots"]=player.mapRegistry["sellerid"..itemsellerid.."usedslots"]-1
										end
										player:addItem(itemname,itemcount)
										player.money=player.money-itemprice
										player:sendStatus()
									else
										player:dialogSeq({t,"Sorry, but this item has already been sold or the sale was cancelled"})
									end
								else
									player:dialogSeq({t,"You do not have enough money."})
								end
						end
					end



				end
			
			elseif(criteriachoice=="Cost range") then

				local mincost=math.abs(tonumber(math.ceil(player:input("Lowest price possible ? (Enter 0 if you do not wish to limit this parameter)"))))
				local maxcost=math.abs(tonumber(math.ceil(player:input("Highest price possible ? (Enter 0 if you do not wish to limit this parameter)"))))
				if(maxcost==0) then
					maxcost=9999999999999999
				end


				for i=1,player.mapRegistry["auctionhousecurrentnumber"] do
					if(player.mapRegistry["auctionhouse"..i.."id"]>0 and player.mapRegistry["auctionhouse"..i.."count"]>0 and player.mapRegistry["auctionhouse"..i.."price"]>0 and player.mapRegistry["auctionhouse"..i.."sellerid"]>0 and (player.mapRegistry["auctionhouse"..i.."timelimit"]>os.time() or player.mapRegistry["auctionhouse"..i.."timelimit"]==0)) then
						if(player.mapRegistry["auctionhouse"..i.."price"]>=mincost and player.mapRegistry["auctionhouse"..i.."price"]<=maxcost) then
							table.insert(itemsbycost,"("..i..") : "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name.." ("..player.mapRegistry["auctionhouse"..i.."count"]..") - "..player.mapRegistry["auctionhouse"..i.."price"].." coins")
						end	
					end
				end

				if(#itemsbycost==0) then
						player:dialogSeq({t,"There are currently no items being sold in the range you specified."})
				elseif(#itemsbycost>0) then
					local choice=player:menuString2("Items for sale in the range you specified :",itemsbycost)

					for i=1,player.mapRegistry["auctionhousecurrentnumber"] do
						if(choice=="("..i..") : "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name.." ("..player.mapRegistry["auctionhouse"..i.."count"]..") - "..player.mapRegistry["auctionhouse"..i.."price"].." coins") then
							local itemname=player.mapRegistry["auctionhouse"..i.."id"]
							local itemprice=player.mapRegistry["auctionhouse"..i.."price"]
							local itemcount=player.mapRegistry["auctionhouse"..i.."count"]
							local itemsellerid=player.mapRegistry["auctionhouse"..i.."sellerid"]	
							player:dialogSeq({t,"You are about to pay "..player.mapRegistry["auctionhouse"..i.."price"].." coins for "..player.mapRegistry["auctionhouse"..i.."count"].." "..Item(player.mapRegistry["auctionhouse"..i.."id"]).name..". Are you certain of your decision? If You are, click next to proceed. ((Be careful as if your inventory is full, the items will fall on the floor.))"},1)
								if(player.money>=player.mapRegistry["auctionhouse"..i.."price"]) then
									if(player.mapRegistry["auctionhouse"..i.."id"]==itemname and player.mapRegistry["auctionhouse"..i.."count"]==itemcount and player.mapRegistry["auctionhouse"..i.."price"]==itemprice and player.mapRegistry["auctionhouse"..i.."sellerid"]==itemsellerid) then
										player.mapRegistry["sellerid"..itemsellerid.."total"]=player.mapRegistry["sellerid"..itemsellerid.."total"]+itemprice
										player.mapRegistry["auctionhouse"..i.."id"]=0
										player.mapRegistry["auctionhouse"..i.."price"]=0
										player.mapRegistry["auctionhouse"..i.."count"]=0
										player.mapRegistry["auctionhouse"..i.."sellerid"]=0
										player.mapRegistry["auctionhouse"..i.."timelimit"]=0
										if(player.mapRegistry["sellerid"..itemsellerid.."usedslots"]>0) then
											player.mapRegistry["sellerid"..itemsellerid.."usedslots"]=player.mapRegistry["sellerid"..itemsellerid.."usedslots"]-1
										end
										player:addItem(itemname,itemcount)
										player.money=player.money-itemprice
										player:sendStatus()
									else
										player:dialogSeq({t,"Sorry, but this item has already been sold or the sale was cancelled"})
									end
								else
									player:dialogSeq({t,"You do not have enough money."})
								end
						end
					end



				end
			end
				
				
	elseif(menuChoice=="Auction an item") then
		if(player.level<30) then
				player:dialogSeq({t,"You must be at least level 30 to use the auction house services."})
				return
		end
		if(player.mapRegistry["sellerid"..player.ID.."ahusedslots"]>=player.mapRegistry["sellerid"..player.ID.."ahmaxslots"]+1) then
				player:dialogSeq({t,"You are only allowed to put up "..(player.mapRegistry["sellerid"..player.ID.."ahmaxslots"]+1).." item(s) in auction at the same time."})
				return
		end
		local withdrawchoice=player:menuString2("Where do you wish to select your item from ?",{"Inventory","Bank"})
		if(withdrawchoice=="Inventory") then

			local sellList= { }
			local amount=0
	
			for x=0,25 do
				local item=nil
				item=player:getInventoryItem(x)
				if(item ~= nil) then
					if(item.dura==item.maxDura) then
						if(item.depositable and item.droppable and item.exchangeable) then
								table.insert(sellList,x)
						end
					end
				end
			end
			if(#sellList==0) then
				player:dialogSeq({t,"You have nothing you can auction."})
			return end
	
			local choice=player:sell2("What do you wish to put on auction?",sellList)
			local item=player:getInventoryItem(choice-1)

			     if(item.amount>1) then
					amount=math.abs(tonumber(math.ceil(player:input("How many do you wish to auction?"))))
					if(amount==0) then
						player:dialogSeq({t,"You can not do that!"})
					end

					if(amount>4000000000 or not player:hasItem(item.id,amount) == true) then 
						player:dialogSeq({t,"You do not possess that many!"})
					end
					
					
			     else
					amount=1
			     end


			local startingprice=math.abs(tonumber(math.ceil(player:input("What do you wish your starting price to be?"))))
	
			local time=player:menuString2("Duration of the Auction ?",{"1 Day","3 Days","1 Week"})
			local timeamount=0
			if(time=="1 Day") then
				timeamount=60*60*24
			elseif(time=="3 Days") then
				timeamount=60*60*24*3
			elseif(time=="1 Week") then
				timeamount=60*60*24*7
			end
			

			local nchoice=player:menuString2("Are you sure you wish to create a "..time.." auction of "..amount.." "..item.name.." for a starting price of "..startingprice.." coins? Be careful as an auction can NOT be cancelled",{"Yes","No"})
			if(nchoice=="Yes" and player:hasItem(item.id,amount) == true) then
				player.mapRegistry["ahauctioncurrentnumber"]=player.mapRegistry["ahauctioncurrentnumber"]+1
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."startingtime"]=os.time()
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."endingtime"]=os.time()+timeamount
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."id"]=item.id
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."price"]=startingprice
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."count"]=amount
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."sellerid"]=player.ID
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."currentbidderid"]=0
				player.mapRegistry["sellerid"..player.ID.."ahusedslots"]=player.mapRegistry["sellerid"..player.ID.."ahusedslots"]+1
				player:updateInv()
				player:sendStatus()
				player:removeItem(item.id,amount)
				player:dialogSeq({t,"Your item can now be bid on."})
			end
		elseif(withdrawchoice=="Bank") then

			local max=player.registry["bankcount"]
			local bank_item_table={}
			local bank_count_table={}
			local regname
			local found
			local amount=0
			if max==0 then 
				player:dialogSeq({"Your bank is empty."})
			end
	
			for x=1,max do
				regname="bank" .. x
				table.insert(bank_item_table,player.registry[regname])
				regname="bank" .. x .. "count"
				table.insert(bank_count_table,player.registry[regname])
			end

			local temp=player:buy("Select the item you wish to put auction:",bank_item_table,bank_count_table)
	
			for x=1,max do
				if bank_item_table[x]==temp then
					found=x
					break
				end
			end
			if(not Item(bank_item_table[found]).droppable) then
				player:dialogSeq({t,"Sorry, this item can't be sold. ((Item is either non droppable or non exchangeable))"})
			end
			if(not Item(bank_item_table[found]).exchangeable) then
				player:dialogSeq({t,"Sorry, this item can't be sold. ((Item is either non droppable or non exchangeable))"})
			end
			if(Item(bank_item_table[found]).maxAmount>1) then
				amount=player:input("How many do you want to auction?")
				amount=math.ceil(math.abs(tonumber(amount)))
				if(amount==0) then
					player:dialogSeq({t,"You can not do that!"})
				end
				if(amount>bank_count_table[found]) then amount=bank_count_table[found] end
			else
				amount=1
			end

			local startingprice=math.abs(tonumber(math.ceil(player:input("What do you wish your starting price to be?"))))
	
			local time=player:menuString2("Duration of the Auction ?",{"1 Day","3 Days","1 Week"})
			local timeamount=0
			if(time=="1 Day") then
				timeamount=60*60*24
			elseif(time=="3 Days") then
				timeamount=60*60*24*3
			elseif(time=="1 Week") then
				timeamount=60*60*24*7
			end
			

			local nchoice=player:menuString2("Are you sure you wish to create a "..time.." auction of "..amount.." "..Item(bank_item_table[found]).name.." for a starting price of "..startingprice.." coins? Be careful as an auction can NOT be cancelled",{"Yes","No"})
			if(nchoice=="Yes") then
				player.mapRegistry["ahauctioncurrentnumber"]=player.mapRegistry["ahauctioncurrentnumber"]+1
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."startingtime"]=os.time()
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."endingtime"]=os.time()+timeamount
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."id"]=Item(bank_item_table[found]).id
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."price"]=startingprice
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."count"]=amount
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."sellerid"]=player.ID
				player.mapRegistry["ahauction"..player.mapRegistry["ahauctioncurrentnumber"].."currentbidderid"]=0
				player.mapRegistry["sellerid"..player.ID.."ahusedslots"]=player.mapRegistry["sellerid"..player.ID.."ahusedslots"]+1
				player.registry["bank" .. found .. "count"]=bank_count_table[found]-amount
				player:saveBank()
				player:updateInv()
				player:sendStatus()
			end
		end

	elseif(menuChoice=="Place a bid on an item") then


		for i=1,player.mapRegistry["ahauctioncurrentnumber"] do

			if(player.mapRegistry["ahauction"..i.."id"]>0 and player.mapRegistry["ahauction"..i.."count"]>0 and player.mapRegistry["ahauction"..i.."price"]>0 and player.mapRegistry["ahauction"..i.."sellerid"]>0 and os.time()<player.mapRegistry["ahauction"..i.."endingtime"] and player.ID~=player.mapRegistry["ahauction"..i.."currentbidderid"]) then
				table.insert(auctioneditems,"("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..") - "..player.mapRegistry["ahauction"..i.."price"].." coins")
			elseif(player.mapRegistry["ahauction"..i.."id"]>0 and player.mapRegistry["ahauction"..i.."count"]>0 and player.mapRegistry["ahauction"..i.."price"]>0 and player.mapRegistry["ahauction"..i.."sellerid"]>0 and os.time()<player.mapRegistry["ahauction"..i.."endingtime"] and player.ID==player.mapRegistry["ahauction"..i.."currentbidderid"]) then
				table.insert(auctioneditems,"*("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..") - "..player.mapRegistry["ahauction"..i.."price"].." coins")
			end

		end

		local choice=player:menuString2("Items currently auctioned (a * signifies you are already the highest bidder on this item and you will not be able to bid on it) :",auctioneditems)
	
		for i=1,player.mapRegistry["ahauctioncurrentnumber"] do
			if(choice=="("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..") - "..player.mapRegistry["ahauction"..i.."price"].." coins") then
				if(player.mapRegistry["ahauction"..i.."sellerid"]==player.ID) then
					player:dialogSeq({t,"You can not bid on your own items."})
					return
				end
				if(player.mapRegistry["ahauction"..i.."currentbidderid"]==player.ID) then
					player:dialogSeq({t,"You are already the highest bidder on this item."})
					return
				end


			local itemname=player.mapRegistry["ahauction"..i.."id"]
			local itemprice=player.mapRegistry["ahauction"..i.."price"]
			local itemcount=player.mapRegistry["ahauction"..i.."count"]
			local itemsellerid=player.mapRegistry["ahauction"..i.."sellerid"]
	


			player:dialogSeq({t,"Each bid you place must be at least 5% superior to the current one. The current price being "..player.mapRegistry["ahauction"..i.."price"]..", your bid must meet or exceed "..math.ceil(player.mapRegistry["ahauction"..i.."price"]*1.05).." coins."},1)
			local bet=math.abs(tonumber(math.ceil(player:input("What do you wish your bet to be?"))))

			local leftamount=player.mapRegistry["ahauction"..i.."endingtime"]-os.time()
			local leftamounthours=0
			local leftamountdays= 0	

			if(leftamount>60*60*24) then
				leftamountdays=math.floor(leftamount/(60*60*24))
				leftamounthours=math.ceil(leftamount/(60*60*24)-math.floor(leftamount/(60*60*24))/(60*60))
			elseif(leftamount>=60*60 and leftamount<=60*60*24) then
				leftamounthours=math.ceil(leftamount/(60*60))
			end
	
			player:dialogSeq({t,"You are about to place a bid of "..bet.." coins for "..player.mapRegistry["ahauction"..i.."count"].." "..Item(player.mapRegistry["ahauction"..i.."id"]).name..". This auction ends in "..leftamountdays.." Day(s) and "..leftamounthours.." Hour(s). Are you certain of your decision? If You are, click next to proceed."},1)
				if(player.money>=bet) then
					if(bet>=math.ceil(player.mapRegistry["ahauction"..i.."price"]*1.05)) then
						if(player.mapRegistry["ahauction"..i.."id"]==itemname and player.mapRegistry["ahauction"..i.."count"]==itemcount and player.mapRegistry["ahauction"..i.."price"]==itemprice and player.mapRegistry["ahauction"..i.."sellerid"]==itemsellerid) then
							player.mapRegistry["sellerid"..player.mapRegistry["ahauction"..i.."currentbidderid"].."total"]=player.mapRegistry["sellerid"..player.mapRegistry["ahauction"..i.."currentbidderid"].."total"]+itemprice
							player.mapRegistry["ahauction"..i.."price"]=bet
							player.mapRegistry["ahauction"..i.."currentbidderid"]=player.ID
							player.money=player.money-bet
							player:sendStatus()
						else
							player:dialogSeq({t,"Sorry, but this item has already been sold."})
						end
					else
						player:dialogSeq({t,"Sorry, but your bid doesn't meet the requirements."})
					end
					
				else
					player:dialogSeq({t,"You do not have enough money."})
				end
			end
		end

	elseif(menuChoice=="Auctions search by criterias") then


		local criteriachoice=player:menuString2("Which criteria do you wish to use?",criterias)

			if(criteriachoice=="Item name") then
				local partialname=string.lower(player:input("Please input the partial or total name of the item you are looking for"))
				for i=1,player.mapRegistry["ahauctioncurrentnumber"] do
					if(player.mapRegistry["ahauction"..i.."id"]>0 and player.mapRegistry["ahauction"..i.."count"]>0 and player.mapRegistry["ahauction"..i.."price"]>0 and player.mapRegistry["ahauction"..i.."sellerid"]>0 and os.time()<player.mapRegistry["ahauction"..i.."endingtime"] and player.ID~=player.mapRegistry["ahauction"..i.."currentbidderid"]) then
						if(string.find(string.lower(Item(player.mapRegistry["ahauction"..i.."id"]).name),partialname)~=nil) then
							table.insert(itemsbyname,"("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..") - "..player.mapRegistry["ahauction"..i.."price"].." coins")
						end
					elseif(player.mapRegistry["ahauction"..i.."id"]>0 and player.mapRegistry["ahauction"..i.."count"]>0 and player.mapRegistry["ahauction"..i.."price"]>0 and player.mapRegistry["ahauction"..i.."sellerid"]>0 and os.time()<player.mapRegistry["ahauction"..i.."endingtime"] and player.ID==player.mapRegistry["ahauction"..i.."currentbidderid"]) then
						if(string.find(string.lower(Item(player.mapRegistry["ahauction"..i.."id"]).name),partialname)~=nil) then
							table.insert(itemsbyname,"*("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..") - "..player.mapRegistry["ahauction"..i.."price"].." coins")
						end
					end
				end

				if(#itemsbyname==0) then
						player:dialogSeq({t,"There are currently no items being sold containing the letters : "..partialname.."."})
				elseif(#itemsbyname>0) then
					local choice=player:menuString2("Items for sale containing the letters "..partialname.." (a * signifies you are already the highest bidder on this item and you will not be able to bid on it) :",itemsbyname)

					for i=1,player.mapRegistry["ahauctioncurrentnumber"] do
						if(choice=="("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..") - "..player.mapRegistry["ahauction"..i.."price"].." coins") then
							if(player.mapRegistry["ahauction"..i.."sellerid"]==player.ID) then
								player:dialogSeq({t,"You can not bid on your own items."})
								return
							end
							if(player.mapRegistry["ahauction"..i.."currentbidderid"]==player.ID) then
								player:dialogSeq({t,"You are already the highest bidder on this item."})
								return
							end


							local itemname=player.mapRegistry["ahauction"..i.."id"]
							local itemprice=player.mapRegistry["ahauction"..i.."price"]
							local itemcount=player.mapRegistry["ahauction"..i.."count"]
							local itemsellerid=player.mapRegistry["ahauction"..i.."sellerid"]
	


							player:dialogSeq({t,"Each bid you place must be at least 5% superior to the current one. The current price being "..player.mapRegistry["ahauction"..i.."price"]..", your bid must meet or exceed "..math.ceil(player.mapRegistry["ahauction"..i.."price"]*1.05).." coins."},1)
							local bet=math.abs(tonumber(math.ceil(player:input("What do you wish your bet to be?"))))

							local leftamount=player.mapRegistry["ahauction"..i.."endingtime"]-os.time()
							local leftamounthours=0
							local leftamountdays= 0	

							if(leftamount>60*60*24) then
								leftamountdays=math.floor(leftamount/(60*60*24))
								leftamounthours=math.ceil(leftamount/(60*60*24)-math.floor(leftamount/(60*60*24))/(60*60))
							elseif(leftamount>=60*60 and leftamount<=60*60*24) then
								leftamounthours=math.ceil(leftamount/(60*60))
							end
	
							player:dialogSeq({t,"You are about to place a bid of "..bet.." coins for "..player.mapRegistry["ahauction"..i.."count"].." "..Item(player.mapRegistry["ahauction"..i.."id"]).name..". This auction ends in "..leftamountdays.." Day(s) and "..leftamounthours.." Hour(s). Are you certain of your decision? If You are, click next to proceed."},1)
								if(player.money>=bet) then
									if(bet>=math.ceil(player.mapRegistry["ahauction"..i.."price"]*1.05)) then
										if(player.mapRegistry["ahauction"..i.."id"]==itemname and player.mapRegistry["ahauction"..i.."count"]==itemcount and player.mapRegistry["ahauction"..i.."price"]==itemprice and player.mapRegistry["ahauction"..i.."sellerid"]==itemsellerid) then
											player.mapRegistry["sellerid"..player.mapRegistry["ahauction"..i.."currentbidderid"].."total"]=player.mapRegistry["sellerid"..player.mapRegistry["ahauction"..i.."currentbidderid"].."total"]+itemprice
											player.mapRegistry["ahauction"..i.."price"]=bet
											player.mapRegistry["ahauction"..i.."currentbidderid"]=player.ID
											player.money=player.money-bet
											player:sendStatus()
										else
											player:dialogSeq({t,"Sorry, but this item has already been sold."})
										end
									else
										player:dialogSeq({t,"Sorry, but your bid doesn't meet the requirements."})
									end
					
								else
									player:dialogSeq({t,"You do not have enough money."})
								end
						end
					end



				end
			
			elseif(criteriachoice=="Cost range") then

				local mincost=math.abs(tonumber(math.ceil(player:input("Lowest price possible ? (Enter 0 if you do not wish to limit this parameter)"))))
				local maxcost=math.abs(tonumber(math.ceil(player:input("Highest price possible ? (Enter 0 if you do not wish to limit this parameter)"))))
				if(maxcost==0) then
					maxcost=9999999999999999
				end


				for i=1,player.mapRegistry["ahauctioncurrentnumber"] do
					if(player.mapRegistry["ahauction"..i.."id"]>0 and player.mapRegistry["ahauction"..i.."count"]>0 and player.mapRegistry["ahauction"..i.."price"]>0 and player.mapRegistry["ahauction"..i.."sellerid"]>0 and os.time()<player.mapRegistry["ahauction"..i.."endingtime"] and player.ID~=player.mapRegistry["ahauction"..i.."currentbidderid"]) then
						if(player.mapRegistry["ahauction"..i.."price"]>=mincost and player.mapRegistry["ahauction"..i.."price"]<=maxcost) then
							table.insert(itemsbycost,"("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..") - "..player.mapRegistry["ahauction"..i.."price"].." coins")
						end
					elseif(player.mapRegistry["ahauction"..i.."id"]>0 and player.mapRegistry["ahauction"..i.."count"]>0 and player.mapRegistry["ahauction"..i.."price"]>0 and player.mapRegistry["ahauction"..i.."sellerid"]>0 and os.time()<player.mapRegistry["ahauction"..i.."endingtime"] and player.ID==player.mapRegistry["ahauction"..i.."currentbidderid"]) then
						if(player.mapRegistry["ahauction"..i.."price"]>=mincost and player.mapRegistry["ahauction"..i.."price"]<=maxcost) then
							table.insert(itemsbycost,"*("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..") - "..player.mapRegistry["ahauction"..i.."price"].." coins")
						end
					end
				end

				if(#itemsbycost==0) then
						player:dialogSeq({t,"There are currently no items being sold in the range you specified."})
				elseif(#itemsbycost>0) then
					local choice=player:menuString2("Items for sale in the range you specified (a * signifies you are already the highest bidder on this item and you will not be able to bid on it) :",itemsbycost)

					for i=1,player.mapRegistry["ahauctioncurrentnumber"] do
						if(choice=="("..i..") : "..Item(player.mapRegistry["ahauction"..i.."id"]).name.." ("..player.mapRegistry["ahauction"..i.."count"]..") - "..player.mapRegistry["ahauction"..i.."price"].." coins") then
							if(player.mapRegistry["ahauction"..i.."sellerid"]==player.ID) then
								player:dialogSeq({t,"You can not bid on your own items."})
								return
							end
							if(player.mapRegistry["ahauction"..i.."currentbidderid"]==player.ID) then
								player:dialogSeq({t,"You are already the highest bidder on this item."})
								return
							end


							local itemname=player.mapRegistry["ahauction"..i.."id"]
							local itemprice=player.mapRegistry["ahauction"..i.."price"]
							local itemcount=player.mapRegistry["ahauction"..i.."count"]
							local itemsellerid=player.mapRegistry["ahauction"..i.."sellerid"]
	


							player:dialogSeq({t,"Each bid you place must be at least 5% superior to the current one. The current price being "..player.mapRegistry["ahauction"..i.."price"]..", your bid must meet or exceed "..math.ceil(player.mapRegistry["ahauction"..i.."price"]*1.05).." coins."},1)
							local bet=math.abs(tonumber(math.ceil(player:input("What do you wish your bet to be?"))))

							local leftamount=player.mapRegistry["ahauction"..i.."endingtime"]-os.time()
							local leftamounthours=0
							local leftamountdays= 0	

							if(leftamount>60*60*24) then
								leftamountdays=math.floor(leftamount/(60*60*24))
								leftamounthours=math.ceil(leftamount/(60*60*24)-math.floor(leftamount/(60*60*24))/(60*60))
							elseif(leftamount>=60*60 and leftamount<=60*60*24) then
								leftamounthours=math.ceil(leftamount/(60*60))
							end
	
							player:dialogSeq({t,"You are about to place a bid of "..bet.." coins for "..player.mapRegistry["ahauction"..i.."count"].." "..Item(player.mapRegistry["ahauction"..i.."id"]).name..". This auction ends in "..leftamountdays.." Day(s) and "..leftamounthours.." Hour(s). Are you certain of your decision? If You are, click next to proceed."},1)
								if(player.money>=bet) then
									if(bet>=math.ceil(player.mapRegistry["ahauction"..i.."price"]*1.05)) then
										if(player.mapRegistry["ahauction"..i.."id"]==itemname and player.mapRegistry["ahauction"..i.."count"]==itemcount and player.mapRegistry["ahauction"..i.."price"]==itemprice and player.mapRegistry["ahauction"..i.."sellerid"]==itemsellerid) then
											player.mapRegistry["sellerid"..player.mapRegistry["ahauction"..i.."currentbidderid"].."total"]=player.mapRegistry["sellerid"..player.mapRegistry["ahauction"..i.."currentbidderid"].."total"]+itemprice
											player.mapRegistry["ahauction"..i.."price"]=bet
											player.mapRegistry["ahauction"..i.."currentbidderid"]=player.ID
											player.money=player.money-bet
											player:sendStatus()
										else
											player:dialogSeq({t,"Sorry, but this item has already been sold."})
										end
									else
										player:dialogSeq({t,"Sorry, but your bid doesn't meet the requirements."})
									end
					
								else
									player:dialogSeq({t,"You do not have enough money."})
								end
						end
					end




				end
			end

		end

	
	


	end)
}