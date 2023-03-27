main_deck_zone = getObjectFromGUID('705d27')
pluck_deck_zone = getObjectFromGUID('2b3182')

function getGreenDeck()
    green_deck = main_deck_zone.getObjects()
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
    green_pluck_deck = pluck_deck_zone.getObjects()
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

function greenSetUp()
    if getGreenDeck() != nil then
        getGreenDeck().randomize()
        getGreenDeck().deal(8, "Green", 1)
        print('Green, game start!')
    end
    if getGreenPluckDeck() != nil then
        getGreenPluckDeck().randomize()
        getGreenPluckDeck().deal(1, "Green", 2)
        self.destruct()
    end
end
