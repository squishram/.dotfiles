local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local modkey = require("configuration.keys.mod").modKey
local altkey = require("configuration.keys.mod").altKey
local apps = require("configuration.apps")

-- Key bindings
local globalKeys = awful.util.table.join(
    -- Hotkeys
    awful.key({ modkey }, "F1", hotkeys_popup.show_help, { description = "Show help", group = "awesome" }),

    -- left workspace
    awful.key({ altkey, "Control" }, "h", awful.tag.viewprev, { description = "view previous", group = "tag" }),

    -- right workspace
    awful.key({ altkey, "Control" }, "l", awful.tag.viewnext, { description = "view next", group = "tag" }),

    -- previous workspace
    awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

    -- move to the left window
    awful.key({ modkey }, "h", function()
        awful.client.focus.global_bydirection("left")
        end, { description = "Focus left by direction", group = "client" }),

    -- move to the right window
    awful.key({ modkey }, "l", function()
        awful.client.focus.global_bydirection("right")
        end, { description = "Focus right by direction", group = "client" }),

    -- move to the below window
    awful.key({ modkey }, "j", function()
        awful.client.focus.global_bydirection("down")
        end, { description = "Focus down by direction", group = "client" }),

    -- move to the above window
    awful.key({ modkey }, "k", function()
        awful.client.focus.global_bydirection("up")
        end, { description = "Focus up by direction", group = "client" }),

    -- swap with the left window
    awful.key({ modkey, "Shift" }, "h", function()
        awful.client.swap.global_bydirection("left")
        end, { description = "swap left by direction", group = "client" }),

    -- swap with the right window
    awful.key({ modkey, "Shift" }, "l", function()
        awful.client.swap.global_bydirection("right")
        end, { description = "swap right by direction", group = "client" }),

    -- swap with the below window
    awful.key({ modkey, "Shift" }, "j", function()
        awful.client.swap.global_bydirection("down")
        end, { description = "swap down by direction", group = "client" }),

    -- swap with the above window
    awful.key({ modkey, "Shift" }, "k", function()
        awful.client.swap.global_bydirection("up")
        end, { description = "swap up by direction", group = "client" }),

    -- open rofi launcher
    awful.key({ modkey }, "r", function()
        awful.spawn("rofi -combi-modi window,drun -show combi -modi combi")
        end, { description = "Main menu", group = "awesome" }),

    -- open rofi launcher
    awful.key({ altkey }, "space", function()
        awful.spawn("rofi -combi-modi window,drun -show combi -modi combi")
        end, { description = "Show main menu", group = "awesome" }),

    -- reboot computer
    awful.key({ modkey, "Shift" }, "r", function()
        awful.spawn("reboot")
        end, { description = "Reboot Computer", group = "awesome" }),

    -- shutdown computer
    awful.key({ modkey, "Shift" }, "s", function()
        awful.spawn("shutdown now")
        end, { description = "Shutdown Computer", group = "awesome" }),

    -- open logout screen
    awful.key({ modkey, "Shift" }, "l", function()
        _G.exit_screen_show()
        end, { description = "Log Out Screen", group = "awesome" }),

    awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

    -- switch to next window
    awful.key({ altkey }, "Tab", function()
        --awful.client.focus.history.previous()
        awful.client.focus.byidx(1)
        if _G.client.focus then
            _G.client.focus:raise()
        end
        end, { description = "Switch to next window", group = "client" }),

    -- switch to previous window
    awful.key({ altkey, "Shift" }, "Tab", function()
        --awful.client.focus.history.previous()
        awful.client.focus.byidx(-1)
        if _G.client.focus then
            _G.client.focus:raise()
        end
        end, { description = "Switch to previous window", group = "client" }),

    -- Programs

    -- -- screenshot marked area in 10 seconds
    -- awful.key({ modkey }, "Print", function()
    -- 	awful.util.spawn_with_shell(apps.default.delayed_screenshot)
    -- end, {
    -- 	description = "Mark an area and screenshot it 10 seconds later (clipboard)",
    -- 	group = "screenshots (clipboard)",
    -- }),

    -- screenshot full screen and copy to clipboard
    awful.key({ modkey }, "p", function()
        awful.util.spawn_with_shell(apps.default.screenshot)
        end, {
            description = "Take a screenshot of your active monitor and copy it to clipboard",
            group = "screenshots (clipboard)",
    }),

    -- screenshot marked area and copy to clipboard
    awful.key({ altkey, "Shift" }, "p", function()
        awful.util.spawn_with_shell(apps.default.region_screenshot)
        end, { description = "Mark an area and screenshot it to your clipboard", group = "screenshots (clipboard)" }),

    -- open your browser
    awful.key({ modkey }, "b", function()
        awful.util.spawn(apps.default.browser)
        end, { description = "Open a browser", group = "launcher" }),

    -- open a terminal
    awful.key({ modkey }, "x", function()
        awful.spawn(apps.default.terminal)
        end, { description = "Open a terminal", group = "launcher" }),

    -- reload awesome
    awful.key({ modkey, "Control" }, "r", _G.awesome.restart, { description = "reload awesome", group = "awesome" }),

    -- quit awesome
    awful.key({ modkey, "Control" }, "q", _G.awesome.quit, { description = "quit awesome", group = "awesome" }),

    -- make master window bigger horizontally
    awful.key({ altkey, "Shift" }, "l", function()
        awful.tag.incmwfact(0.05)
        end, { description = "Increase master width factor", group = "layout" }),

    -- make master window smaller horizontally
    awful.key({ altkey, "Shift" }, "h", function()
        awful.tag.incmwfact(-0.05)
        end, { description = "Decrease master width factor", group = "layout" }),

    -- make master window bigger vertically
    awful.key({ altkey, "Shift" }, "j", function()
        awful.client.incwfact(0.05)
        end, { description = "Decrease master height factor", group = "layout" }),

    -- make master window smaller vertically
    awful.key({ altkey, "Shift" }, "k", function()
        awful.client.incwfact(-0.05)
        end, { description = "Increase master height factor", group = "layout" }),

    -- make more master windows
    awful.key({ modkey, "Shift" }, "Left", function()
        awful.tag.incnmaster(1, nil, true)
        end, { description = "Increase the number of master clients", group = "layout" }),

    -- make less master windows
    awful.key({ modkey, "Shift" }, "Right", function()
        awful.tag.incnmaster(-1, nil, true)
        end, { description = "Decrease the number of master clients", group = "layout" }),

    -- make more window columns
    awful.key({ modkey, "Control" }, "Left", function()
        awful.tag.incncol(1, nil, true)
        end, { description = "Increase the number of columns", group = "layout" }),

    -- make less window columns
    awful.key({ modkey, "Control" }, "Right", function()
        awful.tag.incncol(-1, nil, true)
        end, { description = "Decrease the number of columns", group = "layout" }),

    -- select next layout
    awful.key({ modkey }, "Tab", function()
        awful.layout.inc(1)
        end, { description = "Select next", group = "layout" }),

    -- select previous layout
    awful.key({ modkey, "Shift" }, "Tab", function()
        awful.layout.inc(-1)
        end, { description = "Select previous", group = "layout" }),

    -- restore minimised window
    awful.key({ modkey, "Control" }, "n", function()
        local c = awful.client.restore()
        -- Focus restored client
    if c then
            _G.client.focus = c
            c:raise()
        end
        end, { description = "restore minimized", group = "client" }),

    -- Dropdown application
    awful.key({ modkey }, "z", function()
        _G.toggle_quake()
        end, { description = "dropdown application", group = "launcher" }),

    -- Widgets popups

    awful.key({ altkey }, "h", function()
        if beautiful.fs then
            beautiful.fs.show(7)
        end
        end, { description = "Show filesystem", group = "widgets" }),

    awful.key({ altkey }, "w", function()
        if beautiful.weather then
            beautiful.weather.show(7)
        end
        end, { description = "Show weather", group = "widgets" }),

    -- Brightness
    awful.key({}, "XF86MonBrightnessUp", function()
        awful.spawn("xbacklight -inc 10")
        end, { description = "+10%", group = "hotkeys" }),

    awful.key({}, "XF86MonBrightnessDown", function()
        awful.spawn("xbacklight -dec 10")
        end, { description = "-10%", group = "hotkeys" }),

    -- ALSA volume control
    awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn("amixer -D pulse sset Master 5%+")
        end, { description = "volume up", group = "hotkeys" }),

    awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn("amixer -D pulse sset Master 5%-")
        end, { description = "volume down", group = "hotkeys" }),

    awful.key({}, "XF86AudioMute", function()
        awful.spawn("amixer -D pulse set Master 1+ toggle")
        end, { description = "toggle mute", group = "hotkeys" }),

    awful.key({}, "XF86AudioNext", function()
        --
        end, { description = "toggle mute", group = "hotkeys" }),

    awful.key({}, "XF86PowerDown", function()
        --
        end, { description = "toggle mute", group = "hotkeys" }),

    awful.key({}, "XF86PowerOff", function()
        _G.exit_screen_show()
        end, { description = "toggle mute", group = "hotkeys" }),

    -- Screen management
    awful.key(
        { modkey },
        "o",
        awful.client.movetoscreen,
        { description = "move window to next screen", group = "client" }
    ),

    -- Open default program for tag
    awful.key({ modkey }, "t", function()
        awful.spawn(awful.screen.focused().selected_tag.defaultApp, {
            tag = _G.mouse.screen.selected_tag,
            placement = awful.placement.bottom_right,
        })
        end, { description = "Open default program for tag/workspace", group = "tag" }),

    -- Custom hotkeys
    -- vfio integration
    awful.key({ "Control", altkey }, "space", function()
        awful.util.spawn_with_shell("vm-attach attach")
    end),

    -- Lutris hotkey
    awful.key({ modkey }, "g", function()
        awful.util.spawn_with_shell("lutris")
    end),

    -- System Monitor hotkey
    awful.key({ modkey }, "m", function()
        awful.util.spawn_with_shell("mate-system-monitor")
    end),

    -- Kill VLC
    awful.key({ modkey }, "v", function()
        awful.util.spawn_with_shell("killall -9 vlc")
    end),

    -- File Manager
    awful.key({ modkey }, "e", function()
        awful.util.spawn(apps.default.files)
        end, { description = "filebrowser", group = "hotkeys" }),

    -- Emoji Picker
    awful.key({ modkey }, "a", function()
        awful.util.spawn_with_shell("ibus emoji")
        end, { description = "Open the ibus emoji picker to copy an emoji to your clipboard", group = "hotkeys" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = { description = "view tag #", group = "tag" }
        descr_toggle = { description = "toggle tag #", group = "tag" }
        descr_move = { description = "move focused client to tag #", group = "tag" }
        descr_toggle_focus = { description = "toggle focused client on tag #", group = "tag" }
    end

    globalKeys = awful.util.table.join(
        globalKeys,
        -- View tag only.
        awful.key({ altkey, "Control" }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
        if tag then
                tag:view_only()
            end
            end, descr_view),

        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
        if tag then
                awful.tag.viewtoggle(tag)
            end
            end, descr_toggle),

        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
            if _G.client.focus then
                local tag = _G.client.focus.screen.tags[i]
                if tag then
                    _G.client.focus:move_to_tag(tag)
                end
            end
            end, descr_move),

        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
            if _G.client.focus then
                local tag = _G.client.focus.screen.tags[i]
                if tag then
                    _G.client.focus:toggle_tag(tag)
                end
            end
            end, descr_toggle_focus)
    )
end

return globalKeys
