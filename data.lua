local select_mode = function(color, cursor_box)
    return {
        border_color = color,
        cursor_box_type = cursor_box,
        mode = {
            'same-force',
            'buildable-type',
        },
        entity_filter_mode = 'whitelist',
        entity_type_filters = {
            'assembling-machine',
            'boiler',
            'furnace',
            'generator',
            'inserter',
            'loader',
            'locomotive',
            'mining-drill',
            'pump',
            'radar',
            'transport-belt',
            'beacon',
            'reactor',
            'heat-pipe',
            'train-stop',
        },
    }
end

data:extend({
    {
        action = 'lua',
        key_sequence = 'CONTROL + S',
        alternative_key_sequence = '',
        name = 'get_activity_switch_tool',
        type = 'custom-input',
    },
    {
        action = 'lua',
        associated_control_input = 'get_activity_switch_tool',
        icon = '__activity-switch__/graphics/switch.png',
        disabled_icon = '__activity-switch__/graphics/switch_white.png',
        icon_size = 512,
        name = 'get_activity_switch_tool',
        small_icon = '__activity-switch__/graphics/switch.png',
        disabled_small_icon = '__activity-switch__/graphics/switch_white.png',
        small_icon_size = 512,
        type = 'shortcut',
    },
    {
        type = 'selection-tool',
        name = 'activity_switch_tool',
        icons = {
            { icon = '__activity-switch__/graphics/black.png', icon_size = 1, scale = 64 },
            { icon = '__activity-switch__/graphics/switch_white.png', icon_size = 512, scale = 0.18 },
        },
        flags = {
            'not-stackable',
            'spawnable',
            'only-in-cursor',
        },
        style = 'blue',
        stack_size = 1,
        hidden = true,
        always_include_tiles = false,
        select = select_mode({ 0, 250, 154 }, 'entity'),
        alt_select = select_mode({ 0, 250, 154 }, 'entity'),
        reverse_select = select_mode({ 255, 127, 80 }, 'not-allowed'),
        alt_reverse_select = select_mode({ 255, 127, 80 }, 'not-allowed'),
    },
})
