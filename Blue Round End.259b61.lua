main_play_zone = getObjectFromGUID('88086f')
pluck_play_zone = getObjectFromGUID('66a65d')

main_discard_zone = getObjectFromGUID('52ff2e')
pluck_discard_zone = getObjectFromGUID('5283c0')

main_deck_zone = getObjectFromGUID('bb2f4c')


function getBluePlayZone()
    blue_play_zone = main_play_zone.getObjects()
    cards = {}
    card_count = 0
    for _, item in ipairs(blue_play_zone) do
        if item.type == 'Card' and item.getLock() == false then
            table.insert(cards, item)
            card_count = card_count + 1
        end
    end
    for _, item in ipairs(blue_play_zone) do
        if item.type == 'Deck' then
            table.insert(cards, item)
            card_count = card_count + #item.getObjects()
        end
    end
    return cards
end

function getBlueDiscard()
    main_discard_size = 0
    blue_discard = main_discard_zone.getObjects()
    for _, item in ipairs(blue_discard) do
        if item.type == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(blue_discard) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function getBluePluckPlayZone()
    blue_pluck_play_zone = pluck_play_zone.getObjects()
    pluck = {}
    for _, item in ipairs(blue_pluck_play_zone) do
        if item.type == 'Card' then
            table.insert(pluck, item)
        end
    end
    for _, item in ipairs(blue_pluck_play_zone) do
        if item.type == 'Deck' then
            table.insert(pluck, item)
        end
    end
    return pluck
end

function getBluePluckDiscard()
    blue_pluck_discard = pluck_discard_zone.getObjects()
    for _, item in ipairs(blue_pluck_discard) do
        if item.type == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(blue_pluck_discard) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function discardPlayZones()
    blue_discard_pos = main_discard_zone.getPosition()
    for _, item in ipairs(cards) do
        if item.getLock() == false then
            item.setPositionSmooth(blue_discard_pos)
        end
    end
    blue_pluck_discard_pos = pluck_discard_zone.getPosition()
    for _, item in ipairs(pluck) do
        if item.getLock() == false then
            item.setPositionSmooth(blue_pluck_discard_pos)
        end
    end
    print('Cards discarded by Blue: ', card_count)
    return nil
end

function getBlueDeck()
    blue_deck_zone = main_deck_zone.getObjects()
    for _, item in ipairs(blue_deck_zone) do
        if item.type == 'Deck' then
            blue_deck = item
            return blue_deck
        end
    end
    for _, item in ipairs(blue_deck_zone) do
        if item.type == 'Card' and item.getLock() == false then
            blue_deck = item
            return blue_deck
        end
    end
    return nil
end

function dealNewCards()
    if blue_deck != nil then
        blue_deck.deal(card_count, "Blue", 1)
    end
    print('Cards drawn by Blue: ', card_count)
end

function endOfRound()
    print('Round End!')
    getBluePlayZone()
    getBlueDiscard()
    getBluePluckPlayZone()
    getBluePluckDiscard()
    discardPlayZones()
    getBlueDeck()
    if blue_deck == nil then
        print('Cards drawn by Blue: ', card_count)
        return nil
    end
    dealNewCards()
end