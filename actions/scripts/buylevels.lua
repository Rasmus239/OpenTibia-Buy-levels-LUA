local config = { -- Rasmus239 (2013)
addLevels = 2,
costAmount = 15000,
maxLevel = 300,
}

local bought = {
boughtMessage = 'You just bought '.. config.addLevels ..' levels for '.. config.costAmount ..' gold coins.',
cancelMessage = 'You need '.. config.costAmount ..' gold coins to buy '.. config.addLevels.. ' levels.',
maxlevelMessage = 'You are too high level to use this.',
}

function onUse(cid, item, fromPosition, itemEx, toPosition) -- Rasmus239
if getPlayerLevel(cid) < config.maxLevel then
if(doPlayerRemoveMoney(cid, config.costAmount)) then
doPlayerAddLevel(cid, config.addLevels)
doPlayerSendTextMessage(cid, 27, bought.boughtMessage)
else
doPlayerSendTextMessage(cid, 27, bought.cancelMessage)
end
else
doPlayerSendTextMessage(cid, 27, bought.maxlevelMessage)
end
return true
end