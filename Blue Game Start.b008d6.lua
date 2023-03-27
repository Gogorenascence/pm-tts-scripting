main_deck_zone = getObjectFromGUID('bb2f4c')
pluck_deck_zone =  getObjectFromGUID('969a0b')

function getBlueDeck()
    blue_deck = main_deck_zone.getObjects()
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
    blue_pluck_deck = pluck_deck_zone.getObjects()
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

function blueSetUp()
    if getBlueDeck() != nil then
        getBlueDeck().randomize()
        getBlueDeck().deal(8, "Blue", 1)
        print('Blue, game start!')
    end
    if getBluePluckDeck() != nil then
        getBluePluckDeck().randomize()
        getBluePluckDeck().deal(1, "Blue", 2)
        self.destruct()
    end
end