main_deck_zone = getObjectFromGUID('bb2f4c')
main_deck_pos = main_deck_zone.getPosition()
main_discard_zone = getObjectFromGUID('52ff2e')
pluck_discard_zone = getObjectFromGUID('5283c0')

hand_zone = getObjectFromGUID('9b8983')

main_play_zone = getObjectFromGUID('88086f')
pluck_play_zone = getObjectFromGUID('66a65d')


function getPlay()
    play = main_play_zone.getObjects()
    cards = {}
    for _, item in ipairs(play) do
        if item.type == 'Card' then
            table.insert(cards, item)
        end
    end
    for _, item in ipairs(play) do
        if item.type == 'Deck' then
            table.insert(cards, item)
        end
    end
    return cards
end

function getActivePluck()
    active_pluck = pluck_play_zone.getObjects()
    pluck = {}
    for _, item in ipairs(active_pluck) do
        if item.type == 'Card' then
            table.insert(pluck, item)
        end
    end
    for _, item in ipairs(active_pluck) do
        if item.type == 'Deck' then
            table.insert(pluck, item)
        end
    end
    return pluck
end

function getHand()
    players_hand = hand_zone.getObjects()
    hand = {}
    for _, item in ipairs(players_hand) do
        if item.type == 'Card' then
            table.insert(hand, item)
        end
    end
    return hand
end

function getDiscardPile()
    discard_pile = main_discard_zone.getObjects()
    discard = {}
    for _, item in ipairs(discard_pile) do
        if item.type == 'Deck' and item.getLock() == false then
            table.insert(discard, item)
            return discard
        end
    end
    for _, item in ipairs(discard_pile) do
        if item.type == 'Card' and item.getLock() == false then
            table.insert(discard, item)
            return discard
        end
    end
    return nil
end

function getDiscardArea()
    discard_pile = main_discard_zone.getObjects()
    for _, item in ipairs(discard_pile) do
        if item.type == 'Deck' and item.getLock() == false then
            return item
        end
    end
    for _, item in ipairs(discard_pile) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function getPluckDiscardPile()
    pluck_discard_pile = pluck_discard_zone.getObjects()
    for _, item in ipairs(pluck_discard_pile) do
        if item.type == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(pluck_discard_pile) do
        if item.type == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function discardPlayHandandActivePluck()
    discard_pile_pos  = main_discard_zone.getPosition()
    if getDiscardArea() == nil then
        for _, item in ipairs(cards) do
            if item.is_face_down == true then
                item.flip()
            end
            item.setPosition(discard_pile_pos)
        end
    else
        for _, item in ipairs(cards) do
            getDiscardArea().putObject(item)
        end
    end
    if getDiscardArea() == nil then
        for _, item in ipairs(hand) do
            if item.is_face_down == true then
                item.flip()
            end
            item.setPosition(discard_pile_pos)
        end
    else
        for _, item in ipairs(hand) do
            getDiscardArea().putObject(item)
        end
    end
    pluck_discard_pile_pos = pluck_discard_zone.getPosition()
    for _, item in ipairs(pluck) do
        item.setPosition(pluck_discard_pile_pos)
    end
    return nil
end

function getBlueDeck()
    blue_deck = main_deck_zone.getObjects()
    deck_size = 0
    for _, item in ipairs(blue_deck) do
        if item.tag == 'Deck' then
            deck_size = #item.getObjects()
            print(deck_size)
            return item
        end
    end
    for _, item in ipairs(blue_deck) do
        if item.tag == 'Card' and item.getLock() == false then
            deck_size = 1
            print(deck_size)
            return item
        end
    end
    return nil
end

function makeNewDeck()
    for _, item in ipairs(cards) do
        if getBlueDeck() == nil then
            if item.is_face_down == false then
                item.flip()
            end
            item.setPosition(main_deck_pos)
        else
            getBlueDeck().putObject(item)
        end
    end
    for _, item in ipairs(hand) do
        if getBlueDeck() == nil then
            if item.is_face_down == false then
                item.flip()
            end
            item.setPosition(main_deck_pos)
        else
            getBlueDeck().putObject(item)
        end
    end
    for _, item in ipairs(discard_pile) do
        if getBlueDeck() == nil then
            if item.is_face_down == false then
                item.flip()
            end
            if item.getLock() == false then
                item.setPosition(main_deck_pos)
            end
        else
            if item.is_face_down == false then
                item.flip()
            end
            if item.getLock() == false then
                getBlueDeck().putObject(item)
            end
        end
    end
    pluck_discard_pile_pos = pluck_discard_zone.getPosition()
    for _, item in ipairs(pluck) do
        item.setPosition(pluck_discard_pile_pos)
    end
    return nil
end

function reset()
    getPlay()
    getActivePluck()
    getHand()
    getDiscardPile()
    getPluckDiscardPile()
    getBlueDeck()
    if deck_size >= 8 then
        discardPlayHandandActivePluck()
    elseif deck_size < 8 or getBlueDeck() == nil then
        makeNewDeck()
    end
    -- getBlueDeck()
    -- getBlueDeck().randomize()
    -- getBlueDeck().deal(8, "Blue", 1)
    -- print('Blue, welcome back!')
    return nil
end