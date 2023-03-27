main_discard_zone = getObjectFromGUID('4b031a')
pluck_discard_zone = getObjectFromGUID('577c4b')

main_play_zone = getObjectFromGUID('489639')
pluck_play_zone = getObjectFromGUID('8f1c9c')

main_deck_zone = getObjectFromGUID('705d27')


function getGreenPlayZone()
    green_play_zone = main_play_zone.getObjects()
    cards = {}
    card_count = 0
    for _, item in ipairs(green_play_zone) do
        if item.type == 'Card' and item.getLock() == false then
            table.insert(cards, item)
            card_count = card_count + 1
        end
    end
    for _, item in ipairs(green_play_zone) do
        if item.type == 'Deck' then
            table.insert(cards, item)
            card_count = card_count + #item.getObjects()
        end
    end
    return cards
end

function getGreenDiscard()
    main_discard_size = 0
    green_discard = main_discard_zone.getObjects()
    for _, item in ipairs(green_discard) do
        if item.type == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(green_discard) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function getGreenPluckPlayZone()
    green_pluck_play_zone = pluck_play_zone.getObjects()
    pluck = {}
    for _, item in ipairs(green_pluck_play_zone) do
        if item.type == 'Card' then
            table.insert(pluck, item)
        end
    end
    for _, item in ipairs(green_pluck_play_zone) do
        if item.type == 'Deck' then
            table.insert(pluck, item)
        end
    end
    return pluck
end

function getGreenPluckDiscard()
    green_pluck_discard = pluck_discard_zone.getObjects()
    for _, item in ipairs(green_pluck_discard) do
        if item.type == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(green_pluck_discard) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function discardPlayZones()
    green_discard_pos = main_discard_zone.getPosition()
    for _, item in ipairs(cards) do
        if item.is_face_down == true then
            item.flip()
        end
        if item.getLock() == false then
            item.setPositionSmooth(green_discard_pos)
        end
    end
    green_pluck_discard_pos = pluck_discard_zone.getPosition()
    for _, item in ipairs(pluck) do
        if item.getLock() == false then
            item.setPositionSmooth(green_pluck_discard_pos)
        end
    end
    print('Cards discarded by Green: ', card_count)
    return nil
end

function getGreenDeck()
    green_deck_zone = main_deck_zone.getObjects()
    for _, item in ipairs(green_deck_zone) do
        if item.type == 'Deck' then
            green_deck = item
            return green_deck
        end
    end
    for _, item in ipairs(green_deck_zone) do
        if item.type == 'Card' and item.getLock() == false then
            green_deck = item
            return green_deck
        end
    end
    return nil
end

function dealNewCards()
    if green_deck != nil then
        green_deck.deal(card_count, "Green", 1)
    end
    print('Cards drawn by Green: ', card_count)
end

function endOfRound()
    print('Round End!')
    getGreenPlayZone()
    getGreenDiscard()
    getGreenPluckPlayZone()
    getGreenPluckDiscard()
    discardPlayZones()
    getGreenDeck()
    if green_deck == nil then
        print('Cards drawn by Green: ', card_count)
        return nil
    end
    dealNewCards()
end