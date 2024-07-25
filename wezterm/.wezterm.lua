local wezterm = require('wezterm')
local mux = wezterm.mux
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Latte'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font('RobotoMono Nerd Font')
config.font_size = 16
config.window_padding = {
    left = 5,
    right = 5,
    top = 3,
    bottom = 3,
}
config.window_close_confirmation = 'NeverPrompt'

wezterm.on('gui-startup', function()
    local _, _, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
