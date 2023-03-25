main_deck_zone = getObjectFromGUID('acde45')

mulligan_zone = getObjectFromGUID('62879b')


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

function getMulliganStack()
    red_mulligan_zone = mulligan_zone.getObjects()
    for _, item in ipairs(red_mulligan_zone) do
        if item.tag == 'Deck' then
            return item
        end
    end
    for _, item in ipairs(red_mulligan_zone) do
        if item.tag == 'Card' and item.getLock() == false then
            return item
        end
    end
    return nil
end

function redMulligan()
    mulligan_count = 0
    stack = getMulliganStack()
    if stack == nil then
        print("Red, there are no cards to swap!")
        return nil
    end
    if stack.tag == "Card" then
        mulligan_count = 1
    elseif stack.tag == "Deck" then
        mulligan_count = #stack.getObjects()
    end
    if getRedDeck() == nil then
        print("Red, there are no cards to draw!")
        return nil
    end
    print('Cards swapped by Red: ', mulligan_count)
    getRedDeck().deal(mulligan_count, "Red", 1)
    getRedDeck().putObject(stack)
    getRedDeck().randomize()
    mulligan_count = 0
end