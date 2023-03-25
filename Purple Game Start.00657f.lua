main_deck_zone = getObjectFromGUID('89e6b6')
main_discard_zone = getObjectFromGUID('1f5f52')
pluck_deck_zone = getObjectFromGUID('4071c3')
pluck_discard_zone = getObjectFromGUID('568462')

hand_zone = getObjectFromGUID('fa3103')
ownership = getObjectFromGUID('74ac2e')

main_play_zone = getObjectFromGUID('1f436f')
pluck_play_zone = getObjectFromGUID('f57fdd')


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
    end
end
