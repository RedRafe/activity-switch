local handler_factory = function(status)
    return function(event)
        if event.item ~= 'activity_switch_tool' then
            return
        end
        if not next(event.entities) then
            return
        end
        local player = game.get_player(event.player_index)
        if not (player and player.valid) then
            return
        end

        local count = 0
        for _, e in pairs(event.entities) do
            if e.active ~= status then
                e.active = status
                count = count + 1
            end
        end

        player.print(count .. ' entities have been turned '.. (status and 'ON' or 'OFF'), { color = status and { 0, 255, 0 } or { 255, 0, 0 }})
    end
end

script.on_event(defines.events.on_player_selected_area, handler_factory(true))
script.on_event(defines.events.on_player_alt_selected_area, handler_factory(true))
script.on_event(defines.events.on_player_reverse_selected_area, handler_factory(false))
script.on_event(defines.events.on_player_alt_reverse_selected_area, handler_factory(false))

local function on_lua_shortcut(event)
    local name = event.input_name or event.prototype_name
    if name ~= 'get_activity_switch_tool' then
        return
    end
    local player = game.get_player(event.player_index)
    if not (player and player.valid) then
        return
    end
    local cursor_stack = player.cursor_stack
    if cursor_stack and cursor_stack.valid_for_read and cursor_stack_name == 'get_activity_switch_tool' then
        return
    end
    if not cursor_stack or not player.clear_cursor() then
        return
    end
    cursor_stack.set_stack({ name = 'activity_switch_tool', count = 1 })
end

script.on_event(defines.events.on_lua_shortcut, on_lua_shortcut)
script.on_event('get_activity_switch_tool', on_lua_shortcut)