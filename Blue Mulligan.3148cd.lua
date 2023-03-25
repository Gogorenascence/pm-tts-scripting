main_deck_zone = getObjectFromGUID('bb2f4c')

mulligan_zone = getObjectFromGUID('9939ea')


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

function getMulliganStack()
    blue_mulligan_zone = mulligan_zone.getObjects()
    for _, item in ipairs(blue_mulligan_zone) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(blue_mulligan_zone) do
        if item.tag == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function blueMulligan()
    mulligan_count = 0
    stack = getMulliganStack()
    if stack == nil then
        print("Blue, there are no cards to swap!")
        return nil
    end
    if stack.tag == "Card" then
        mulligan_count = 1
    elseif stack.tag == "Deck" then
        mulligan_count = #stack.getObjects()
    end
    if getBlueDeck() == nil then
        print("Blue, there are no cards to draw!")
        return nil
    end
    print('Cards swapped by Blue: ', mulligan_count)
    getBlueDeck().deal(mulligan_count, "Blue", 1)
    getBlueDeck().putObject(stack)
    getBlueDeck().randomize()
    mulligan_count = 0
end