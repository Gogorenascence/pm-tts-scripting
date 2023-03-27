main_deck_zone = getObjectFromGUID('89e6b6')
pluck_deck_zone = getObjectFromGUID('4071c3')

function getPurpleDeck()
    purple_deck = main_deck_zone.getObjects()
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
    purple_pluck_deck = pluck_deck_zone.getObjects()
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

function purpleSetUp()
    if getPurpleDeck() != nil then
        getPurpleDeck().randomize()
        getPurpleDeck().deal(8, "Purple", 1)
        print('Purple, game start!')
    end
    if getPurplePluckDeck() != nil then
        getPurplePluckDeck().randomize()
        getPurplePluckDeck().deal(1, "Purple", 2)
        self.destruct()
    end
end
