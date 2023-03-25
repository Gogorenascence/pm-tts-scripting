main_play_zone = getObjectFromGUID('1f436f')
pluck_play_zone  = getObjectFromGUID('f57fdd')

main_discard_zone  = getObjectFromGUID('1f5f52')
pluck_discard_zone  = getObjectFromGUID('568462')

main_deck_zone  = getObjectFromGUID('89e6b6')


function getPurplePlayZone()
    purple_play_zone = main_play_zone.getObjects()
    cards = {}
    card_count = 0
    for _, item in ipairs(purple_play_zone) do
        if item.type == 'Card' and item.getLock() == false then
            table.insert(cards, item)
            card_count = card_count + 1
        end
    end
    for _, item in ipairs(purple_play_zone) do
        if item.type == 'Deck' then
            table.insert(cards, item)
            card_count = card_count + #item.getObjects()
        end
    end
    return cards
end

function getPurpleDiscard()
    main_discard_size = 0
    purple_discard = main_discard_zone.getObjects()
    for _, item in ipairs(purple_discard) do
        if item.type == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(purple_discard) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function getPurplePluckPlayZone()
    purple_pluck_play_zone = pluck_play_zone.getObjects()
    pluck = {}
    for _, item in ipairs(purple_pluck_play_zone) do
        if item.type == 'Card' then
            table.insert(pluck, item)
        end
    end
    for _, item in ipairs(purple_pluck_play_zone) do
        if item.type == 'Deck' then
            table.insert(pluck, item)
        end
    end
    return pluck
end

function getPurplePluckDiscard()
    purple_pluck_discard = pluck_discard_zone.getObjects()
    for _, item in ipairs(purple_pluck_discard) do
        if item.type == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(purple_pluck_discard) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function discardPlayZones()
    purple_discard_pos = main_discard_zone.getPosition()
    for _, item in ipairs(cards) do
        if item.getLock() == false then
            item.setPositionSmooth(purple_discard_pos)
        end
    end
    purple_pluck_discard_pos = pluck_discard_zone.getPosition()
    for _, item in ipairs(pluck) do
        if item.getLock() == false then
            item.setPositionSmooth(purple_pluck_discard_pos)
        end
    end
    print('Cards discarded by Purple: ', card_count)
    return nil
end

function getPurpleDeck()
    purple_deck_zone = main_deck_zone.getObjects()
    for _, item in ipairs(purple_deck_zone) do
        if item.type == 'Deck' then
            purple_deck = item
            return purple_deck
        end
    end
    for _, item in ipairs(purple_deck_zone) do
        if item.type == 'Card' and item.getLock() == false then
            purple_deck = item
            return purple_deck
        end
    end
    return nil
end

function dealNewCards()
    if purple_deck != nil then
        purple_deck.deal(card_count, "Purple", 1)
    end
    print('Cards drawn by Purple: ', card_count)
end

function endOfRound()
    print('Round End!')
    getPurplePlayZone()
    getPurpleDiscard()
    getPurplePluckPlayZone()
    getPurplePluckDiscard()
    discardPlayZones()
    getPurpleDeck()
    if purple_deck == nil then
        print('Cards drawn by Purple: ', card_count)
        return nil
    end
    dealNewCards()
end