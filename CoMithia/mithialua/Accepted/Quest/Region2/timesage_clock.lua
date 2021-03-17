timesage_clock = {
use = async(function(player)
	local itemG = {graphic = convertGraphic(4160, "item"), color = 26}
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = itemG.graphic
	player.npcColor = itemG.color
	player.lastClick = NPC(90).ID
	player.dialogType = 0

	if (player.class ~= 3) then
		player:removeItem("timesage_clock", 1)
		player:popUp("The clock vanishes in time.")
	end
	
	local str = {"Are you early?", "Are you late?", "Is it time?", "When was it?", "What's this?", "Who are you?",
	"Could it be time?", "Could it be THAT time?", "Just a moment more...", "Could it be too late?", "Could it be too early?"}
	local randStr = math.random(#str)
	
	if (player:hasItem("timesage_clock", 1) == true) then
		player:dialogSeq({itemG, "Timer:\n\n"..secondsToClock(os.time() - player.registry["captureMomentTime"])}, 1)
		player.dialogType = 1
		player:dialogSeq({npcG, ""..str[randStr]}, 1)
	end
end)
}