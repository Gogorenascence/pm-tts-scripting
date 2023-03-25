main_deck_zone = getObjectFromGUID('705d27')
main_discard_zone = getObjectFromGUID('4b031a')
pluck_deck_zone = getObjectFromGUID('2b3182')
pluck_discard_zone = getObjectFromGUID('577c4b')

hand_zone = getObjectFromGUID('18e4c7')
ownership = getObjectFromGUID('b77cce')

main_play_zone = getObjectFromGUID('489639')
pluck_play_zone = getObjectFromGUID('8f1c9c')


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
    end
end
