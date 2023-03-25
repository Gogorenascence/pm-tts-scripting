main_deck_zone = getObjectFromGUID('705d27')

mulligan_zone = getObjectFromGUID('058f66')


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

function getMulliganStack()
    green_mulligan_zone = mulligan_zone.getObjects()
    for _, item in ipairs(green_mulligan_zone) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(green_mulligan_zone) do
        if item.tag == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function greenMulligan()
    mulligan_count = 0
    stack = getMulliganStack()
    if stack == nil then
        print("Green, there are no cards to swap!")
        return nil
    end
    if stack.tag == "Card" then
        mulligan_count = 1
    elseif stack.tag == "Deck" then
        mulligan_count = #stack.getObjects()
    end
    if getGreenDeck() == nil then
        print("Green, there are no cards to draw!")
        return nil
    end
    print('Cards swapped by Green: ', mulligan_count)
    getGreenDeck().deal(mulligan_count, "Green", 1)
    getGreenDeck().putObject(stack)
    getGreenDeck().randomize()
    mulligan_count = 0
end