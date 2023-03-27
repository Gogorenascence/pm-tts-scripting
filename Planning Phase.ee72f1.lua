function onload()
    -- self.createButton({ click_function = 'toggleZone',
    --                     label = 'Lower Zones',
    --                     function_owner = self,
    --                     position = {0, 0, 0},
    --                     rotation = {0, 0, 0},
    --                     width = 1200,
    --                     height = 500,
    --                     opacity = 0,
    --                     font_size = 200})

    --     spawnObject({
    --         type = "FogOfWarTrigger",
    --         position = {-6.09, 4.00, 22.64},
    --         rotation = {0.00, 180.00, 0.00},
    --         scale = {25.00, 5.00, 15.00},
    --         sound = false,
    --         callback_function = function(spawned_object)
    --             log(spawned_object.setValue("Green"))
    --         end
    --     })
        print("Green's hidden zone is ready!")

        -- spawnObject({
        --     type = "FogOfWarTrigger",
        --     position = {22.64, 4.00, 6.09},
        --     rotation = {0.00, 270.00, 0.00},
        --     scale = {25.00, 5.00, 15.00},
        --     sound = false,
        --     callback_function = function(spawned_object)
        --         log(spawned_object.setValue("Red"))
        --     end
        -- })
        print("Red's hidden zone is ready!")

        -- spawnObject({
        --     type = "FogOfWarTrigger",
        --     position = {6.09, 4.00, -22.64},
        --     rotation = {0.00, 0.00, 0.00},
        --     scale = {25.00, 5.00, 15.00},
        --     sound = false,
        --     callback_function = function(spawned_object)
        --         log(spawned_object.setValue("Blue"))
        --     end
        -- })
        print("Blue's hidden zone is ready!")

        -- spawnObject({
        --     type = "FogOfWarTrigger",
        --     position = {-22.64, 4.00, -6.09},
        --     rotation = {0.00, 90.00, 0.00},
        --     scale = {25.00, 5.00, 15.00},
        --     sound = false,
        --     callback_function = function(spawned_object)
        --         log(spawned_object.setValue("Purple"))
        --     end
        -- })
        print("Purple's hidden zone is ready!")

end


offset = -10
function toggleZone()
    local allObjects = getAllObjects()
    for _,o in ipairs(allObjects) do
        if o.name == "FogOfWarTrigger" then
            if o.isSmoothMoving() then return end
            o.translate({0,offset,0})
        end
    end
    offset = offset * -1
end