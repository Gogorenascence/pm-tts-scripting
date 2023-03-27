pluck_deck_zone =  getObjectFromGUID('969a0b')

function getPluckDeck()
    pluck_deck = pluck_deck_zone.getObjects()
    for _, item in ipairs(pluck_deck) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(pluck_deck) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end

function drawPluck()
    if getPluckDeck() != nil then
        getPluckDeck().deal(1, "Blue", 2)
        print('Good Pluck!')
    else
        print("It's not yet the time!")
    end
end