main_deck_zone_green = getObjectFromGUID('705d27')
main_discard_zone_green = getObjectFromGUID('4b031a')
pluck_deck_zone_green = getObjectFromGUID('2b3182')
pluck_discard_zone_green = getObjectFromGUID('577c4b')

hand_zone_green = getObjectFromGUID('18e4c7')
ownership_green = getObjectFromGUID('b77cce')

main_play_zone_green = getObjectFromGUID('489639')
pluck_play_zone_green = getObjectFromGUID('8f1c9c')

-- red player

main_deck_zone_red = getObjectFromGUID('acde45')
main_discard_zone_red = getObjectFromGUID('0785ad')
pluck_deck_zone_red = getObjectFromGUID('82dbf6')
pluck_discard_zone_red = getObjectFromGUID('c27abd')

hand_zone_red = getObjectFromGUID('61206b')
ownership_red = getObjectFromGUID('335793')

main_play_zone_red = getObjectFromGUID('ee53ab')
pluck_play_zone_red = getObjectFromGUID('2c4ec3')

-- blue player

main_deck_zone_blue = getObjectFromGUID('bb2f4c')
main_discard_zone_blue = getObjectFromGUID('52ff2e')
pluck_deck_zone_blue =  getObjectFromGUID('969a0b')
pluck_discard_zone_blue = getObjectFromGUID('5283c0')

hand_zone_blue = getObjectFromGUID('9b8983')
ownership_blue = getObjectFromGUID('4a316b')

main_play_zone_blue = getObjectFromGUID('88086f')
pluck_play_zone_blue = getObjectFromGUID('66a65d')

-- purple player

main_deck_zone_purple = getObjectFromGUID('89e6b6')
main_discard_zone_purple = getObjectFromGUID('1f5f52')
pluck_deck_zone_purple = getObjectFromGUID('4071c3')
pluck_discard_zone_purple = getObjectFromGUID('568462')

hand_zone_purple = getObjectFromGUID('fa3103')
ownership_purple = getObjectFromGUID('74ac2e')

main_play_zone_purple = getObjectFromGUID('1f436f')
pluck_play_zone_purple = getObjectFromGUID('f57fdd')
--[[ Lua code. See documentation: https://api.tabletopsimulator.com/ --]]

--[[ The onLoad event is called after the game save finishes loading. --]]
function onLoad()
    --[[ print('onLoad!') --]]
    -- green player

end


function getGreenDeck()
    local green_deck = main_deck_zone_green.getObjects()
    for _, item in ipairs(green_deck) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(green_deck) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end


function getGreenPluckDeck()
    local green_pluck_deck = pluck_deck_zone_green.getObjects()
    for _, item in ipairs(green_pluck_deck) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(green_pluck_deck) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end


function getRedDeck()
    local red_deck = main_deck_zone_red.getObjects()
    for _, item in ipairs(red_deck) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(red_deck) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end


function getRedPluckDeck()
    local red_pluck_deck = pluck_deck_zone_red.getObjects()
    for _, item in ipairs(red_pluck_deck) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(red_pluck_deck) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end


function getBlueDeck()
    local blue_deck = main_deck_zone_blue.getObjects()
    for _, item in ipairs(blue_deck) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(blue_deck) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end


function getBluePluckDeck()
    local blue_pluck_deck = pluck_deck_zone_blue.getObjects()
    for _, item in ipairs(blue_pluck_deck) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(blue_pluck_deck) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end


function getPurpleDeck()
    local purple_deck = main_deck_zone_purple.getObjects()
    for _, item in ipairs(purple_deck) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(purple_deck) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end


function getPurplePluckDeck()
    local purple_pluck_deck = pluck_deck_zone_purple.getObjects()
    for _, item in ipairs(purple_pluck_deck) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(purple_pluck_deck) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end


function greenSetUp()
    if getGreenDeck() != nil then
        getGreenDeck().randomize()
        getGreenDeck().deal(8, "Green", 1)
    end
    if getGreenPluckDeck() != nil then
        getGreenPluckDeck().randomize()
        getGreenPluckDeck().deal(1, "Green", 2)
    end
end

function redSetUP()
    if getRedDeck() != nil then
        getRedDeck().randomize()
        getRedDeck().deal(8, "Red", 1)
    end
    if getRedPluckDeck() != nil then
        getRedPluckDeck().randomize()
        getRedPluckDeck().deal(1, "Red", 2)
    end
end

function blueSetUp()
    if getBlueDeck() != nil then
        getBlueDeck().randomize()
        getBlueDeck().deal(8, "Blue", 1)
    end
    if getBluePluckDeck() != nil then
        getBluePluckDeck().randomize()
        getBluePluckDeck().deal(1, "Blue", 2)
    end
end

function purpleSetUp()
    if getPurpleDeck() != nil then
        getPurpleDeck().randomize()
        getPurpleDeck().deal(8, "Purple", 1)
    end
    if getPurplePluckDeck() != nil then
        getPurplePluckDeck().randomize()
        getPurplePluckDeck().deal(1, "Purple", 2)
    end
end