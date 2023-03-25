main_deck_zone = getObjectFromGUID('bb2f4c')
main_deck_pos = main_deck_zone.getPosition()
main_discard_zone = getObjectFromGUID('52ff2e')
pluck_deck_zone =  getObjectFromGUID('969a0b')
pluck_discard_zone = getObjectFromGUID('5283c0')

mulligan_zone = getObjectFromGUID('9939ea')

hand_zone = getObjectFromGUID('9b8983')
ownership = getObjectFromGUID('4a316b')

main_play_zone = getObjectFromGUID('88086f')
pluck_play_zone = getObjectFromGUID('66a65d')


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
    end
end
