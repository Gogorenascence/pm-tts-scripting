main_discard_zone = getObjectFromGUID('0785ad')
pluck_discard_zone = getObjectFromGUID('c27abd')

main_play_zone = getObjectFromGUID('ee53ab')
pluck_play_zone = getObjectFromGUID('2c4ec3')

main_deck_zone = getObjectFromGUID('acde45')


function getRedPlayZone()
    red_play_zone = main_play_zone.getObjects()
    cards = {}
    card_count = 0
    for _, item in ipairs(red_play_zone) do
        if item.type == 'Card' and item.getLock() == false then
            table.insert(cards, item)
            card_count = card_count + 1
        end
    end
    for _, item in ipairs(red_play_zone) do
        if item.type == 'Deck' then
            table.insert(cards, item)
            card_count = card_count + #item.getObjects()
        end
    end
    return cards
end

function getRedDiscard()
    main_discard_size = 0
    red_discard = main_discard_zone.getObjects()
    for _, item in ipairs(red_discard) do
        if item.type == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(red_discard) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function getRedPluckPlayZone()
    red_pluck_play_zone = pluck_play_zone.getObjects()
    pluck = {}
    for _, item in ipairs(red_pluck_play_zone) do
        if item.type == 'Card' then
            table.insert(pluck, item)
        end
    end
    for _, item in ipairs(red_pluck_play_zone) do
        if item.type == 'Deck' then
            table.insert(pluck, item)
        end
    end
    return pluck
end

function getRedPluckDiscard()
    red_pluck_discard = pluck_discard_zone.getObjects()
    for _, item in ipairs(red_pluck_discard) do
        if item.type == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(red_pluck_discard) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function discardPlayZones()
    red_discard_pos = main_discard_zone.getPosition()
    for _, item in ipairs(cards) do
        if item.is_face_down == true then
            item.flip()
        end
        if item.getLock() == false then
            item.setPositionSmooth(red_discard_pos)
        end
    end
    red_pluck_discard_pos = pluck_discard_zone.getPosition()
    for _, item in ipairs(pluck) do
        if item.getLock() == false then
            item.setPositionSmooth(red_pluck_discard_pos)
        end
    end
    print('Cards discarded by Red: ', card_count)
    return nil
end

function getRedDeck()
    red_deck_zone = main_deck_zone.getObjects()
    for _, item in ipairs(red_deck_zone) do
        if item.type == 'Deck' then
            red_deck = item
            return red_deck
        end
    end
    for _, item in ipairs(red_deck_zone) do
        if item.type == 'Card' and item.getLock() == false then
            red_deck = item
            return red_deck
        end
    end
    return nil
end

function dealNewCards()
    if red_deck != nil then
        red_deck.deal(card_count, "Red", 1)
    end
    print('Cards drawn by Red: ', card_count)
end

function endOfRound()
    print('Round End!')
    getRedPlayZone()
    getRedDiscard()
    getRedPluckPlayZone()
    getRedPluckDiscard()
    discardPlayZones()
    getRedDeck()
    if red_deck == nil then
        print('Cards drawn by Red: ', card_count)
        return nil
    end
    dealNewCards()
end