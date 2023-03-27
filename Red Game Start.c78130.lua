main_deck_zone = getObjectFromGUID('acde45')
pluck_deck_zone = getObjectFromGUID('82dbf6')

function getRedDeck()
    red_deck = main_deck_zone.getObjects()
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
    red_pluck_deck = pluck_deck_zone.getObjects()
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

function redSetUp()
    if getRedDeck() != nil then
        getRedDeck().randomize()
        getRedDeck().deal(8, "Red", 1)
        print('Red, game start!')
    end
    if getRedPluckDeck() != nil then
        getRedPluckDeck().randomize()
        getRedPluckDeck().deal(1, "Red", 2)
        self.destruct()
    end
end
