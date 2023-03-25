main_deck_zone = getObjectFromGUID('89e6b6')

mulligan_zone = getObjectFromGUID('34cb66')


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

function getMulliganStack()
    purple_mulligan_zone = mulligan_zone.getObjects()
    for _, item in ipairs(purple_mulligan_zone) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(purple_mulligan_zone) do
        if item.tag == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function purpleMulligan()
    mulligan_count = 0
    stack = getMulliganStack()
    if stack == nil then
        print("Purple, there are no cards to swap!")
        return nil
    end
    if stack.tag == "Card" then
        mulligan_count = 1
    elseif stack.tag == "Deck" then
        mulligan_count = #stack.getObjects()
    end
    if getPurpleDeck() == nil then
        print("Purple, there are no cards to draw!")
        return nil
    end
    print('Cards swapped by Purple: ', mulligan_count)
    getPurpleDeck().deal(mulligan_count, "Purple", 1)
    getPurpleDeck().putObject(stack)
    getPurpleDeck().randomize()
    mulligan_count = 0
end