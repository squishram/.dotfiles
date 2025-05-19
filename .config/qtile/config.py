# -*- coding: utf-8 -*-
# import re
# import socket
# import subprocess
import os
# from libqtile import qtile, layout, bar, widget, hook
from libqtile import qtile, layout, bar, widget, extension
# from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.config import Click, Drag, Group, KeyChord, Key, Screen
from libqtile.dgroups import simple_key_binder
# from libqtile.command import lazy
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal
from typing import List  # noqa: F401from typing import List  # noqa: F401


# Sets mod key to SUPER/WINDOWS
mod = "mod4"
# My terminal of choice
my_terminal = "kitty"
# My browser of choice
my_browser = "firefox"
# colours!
# colours = [
#     ["#282c34", "#282c34"],
#     ["#1c1f24", "#1c1f24"],
#     ["#dfdfdf", "#dfdfdf"],
#     ["#ff6c6b", "#ff6c6b"],
#     ["#98be65", "#98be65"],
#     ["#da8548", "#da8548"],
#     ["#51afef", "#51afef"],
#     ["#c678dd", "#c678dd"],
#     ["#46d9ff", "#46d9ff"],
#     ["#a9a1e1", "#a9a1e1"]
# ]

colours = [
    ["#4a555b", "#323d43"],
    ["#415c6d", "#323d43"],
    ["#e68183", "#e68183"],
    ["#dfdfdf", "#dfdfdf"],
    ["#a7c080", "#a7c080"],
    ["#dbbc7f", "#dbbc7f"],
    ["#7fbbb3", "#7fbbb3"],
    ["#d699b6", "#d699b6"],
    ["#83c092", "#83c092"],
    ["#d8caac", "#d8caac"],
]

keys = [
    # The essentials
    Key([mod], "Return",
        lazy.spawn(my_terminal),
        desc='Launch Terminal'
        ),
    Key([mod, "shift"], "Return",
        lazy.spawn("rofi -show drun"),
        desc='run rofi program launcher'
        ),
    Key([mod, "mod1"], "Return",
        lazy.spawn("rofi -show run"),
        desc='run rofi program launcher'
        ),
    Key([mod, "shift"], "c",
        lazy.spawn("rofi -show calc -modi calc -no-show-match -no-sort"),
        desc='run rofi calculator'
        ),
    Key([mod, "shift"], "q",
        lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu"),
        desc='rofi shutdown menu'
        ),
    # Key([mod, "shift"], "v",
    #     lazy.spawn("rofi -show calc -modi calc -no-show-match -no-sort"),
    #     desc='rofi clipboard menu'
    #     ),
    Key(["mod1"], "Tab",
        lazy.spawn("rofi -show window"),
        desc='run rofi window menu'
        ),
    Key([mod], "b",
        lazy.spawn(my_browser),
        desc='launch browser'
        ),
    Key([mod], "Tab",
        lazy.next_layout(),
        desc='Toggle through layouts'
        ),
    Key([mod], "w",
        lazy.window.kill(),
        desc='Kill active window'
        ),
    Key([mod, "shift"], "r",
        lazy.reload_config(),
        desc='Restart Qtile'
        ),
    # Key([mod, "shift"], "q",
    #     lazy.shutdown(),
    #     desc='Shutdown Qtile'
    #     ),

    # Treetab controls
    Key([mod, "shift"], "h",
        lazy.layout.move_left(),
        desc='Move up a section in treetab'
        ),
    Key([mod, "shift"], "l",
        lazy.layout.move_right(),
        desc='Move down a section in treetab'
        ),

    # Window controls
    Key([mod], "j",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'
        ),
    Key([mod], "k",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'
        ),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        lazy.layout.section_down(),
        desc='Move windows down in current stack'
        ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        lazy.layout.section_up(),
        desc='Move windows up in current stack'
        ),
    Key([mod], "h",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod], "l",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc='reset window size ratios'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
        ),
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
        ),

    # Stack controls
    Key([mod, "shift"], "Tab",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc='Switch which side main pane occupies (XmonadTall)'
        ),
    Key([mod], "space",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'
        ),
    Key([mod, "shift"], "space",
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'
        ),

    # sound control
    Key([], "XF86AudioMute",
        lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer -D default sset Master 10%- unmute")),
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -D default sset Master 10%+ unmute")),

    # brightness control
    Key([], "XF86MonBrightnessUp",
        lazy.spawn("xbacklight -inc 10")),
    Key([], "XF86MonBrightnessDown",
        lazy.spawn("xbacklight -dec 10")),

    # taking a screenshot with flameshot
    Key([], "Print",
        lazy.spawn("flameshot"),
        desc="launch flameshot to take screenshots")
    # Dmenu scripts launched using the key chord SUPER+p followed by 'key'
    # KeyChord([mod], "p", [
    #     Key([], "e",
    #         lazy.spawn("./dmscripts/dm-confedit"),
    #         desc='Choose a config file to edit'
    #         ),
    #     Key([], "i",
    #         lazy.spawn("./dmscripts/dm-maim"),
    #         desc='Take screenshots via dmenu'
    #         ),
    #     Key([], "k",
    #         lazy.spawn("./dmscripts/dm-kill"),
    #         desc='Kill processes via dmenu'
    #         ),
    #     Key([], "l",
    #         lazy.spawn("./dmscripts/dm-logout"),
    #         desc='A logout menu'
    #         ),
    #     Key([], "m",
    #         lazy.spawn("./dmscripts/dm-man"),
    #         desc='Search manpages in dmenu'
    #         ),
    #     Key([], "o",
    #         lazy.spawn("./dmscripts/dm-bookman"),
    #         desc='Search your qutebrowser bookmarks and quickmarks'
    #         ),
    #     Key([], "r",
    #         lazy.spawn("./dmscripts/dm-reddit"),
    #         desc='Search reddit via dmenu'
    #         ),
    #     Key([], "s",
    #         lazy.spawn("./dmscripts/dm-websearch"),
    #         desc='Search various search engines via dmenu'
    #         ),
    #     Key([], "p",
    #         lazy.spawn("passmenu"),
    #         desc='Retrieve passwords with dmenu'
    #         )
    # ])
]

groups = [
    Group("1:ORG", layout='monadtall'),
    Group("2:COMM", layout='monadtall'),
    Group("3:CODE", layout='monadtall'),
    Group("4:RES", layout='monadtall'),
    Group("5:MISC", layout='monadtall'),
    Group("6:OTH", layout='monadtall'),
    Group("7:IMG", layout='monadtall'),
    Group("8:VID", layout='monadtall'),
    Group("9:MUS", layout='monadtall'),
    Group("0:SOC", layout='monadtall')
]

# Allow MODKEY+[0 through 9] to bind to groups, see https://docs.qtile.org/en/stable/manual/config/groups.html
# MOD4 + index Number : Switch to Group[index]
# MOD4 + shift + index Number : Send active window to another Group
dgroups_key_binder = simple_key_binder("mod4")

layout_theme = {
    "border_width": 2,
    "margin": 8,
    "border_focus": "e1acff",
    "border_normal": "1D2330"
}

layouts = [
    # layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    # layout.Tile(shift_windows=True, **layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    layout.RatioTile(**layout_theme),
    layout.Floating(**layout_theme)
    # layout.TreeTab(
    #      font="Firacode Nerd Font",
    #      fontsize=10,
    #      sections=["FIRST", "SECOND", "THIRD", "FOURTH"],
    #      section_fontsize=10,
    #      border_width=2,
    #      bg_color="1c1f24",
    #      active_bg="c678dd",
    #      active_fg="000000",
    #      inactive_bg="a9a1e1",
    #      inactive_fg="1c1f24",
    #      padding_left=0,
    #      padding_x=0,
    #      padding_y=5,
    #      section_top=10,
    #      section_bottom=20,
    #      level_shift=8,
    #      vspace=3,
    #      panel_width=200,
    #      ),
    # layout.Floating(**layout_theme)
]

# DEFAULT WIDGET SETTINGS
widget_defaults = dict(
    font="Firacode Nerd Font",
    fontsize=12,
    padding=2,
    background=colours[2]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=colours[2],
                    background=colours[0]
                    ),
                # widget.Image(
                #     filename="~/.config/qtile/icons/python-white.png",
                #     scale="False",
                #     mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(my_terminal)}
                #     ),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=colours[2],
                    background=colours[0]
                    ),
                widget.GroupBox(
                    font="Firacode Nerd Font",
                    fontsize=12,
                    margin_y=3,
                    margin_x=0,
                    padding_y=5,
                    padding_x=3,
                    borderwidth=3,
                    active=colours[4],
                    inactive=colours[2],
                    rounded=False,
                    highlight_color=colours[1],
                    highlight_method="line",
                    this_current_screen_border=colours[6],
                    this_screen_border=colours[4],
                    other_current_screen_border=colours[6],
                    other_screen_border=colours[4],
                    foreground=colours[2],
                    background=colours[0]
                    ),
                # widget.TextBox(
                #     text='|',
                #     font="Firacode Nerd Font",
                #     background=colours[0],
                #     foreground='474747',
                #     padding=2,
                #     fontsize=14
                #     ),
                widget.CurrentLayoutIcon(
                    custom_icon_paths=[
                        os.path.expanduser("~/.config/qtile/icons")],
                    foreground=colours[2],
                    background=colours[0],
                    padding=0,
                    scale=0.7
                    ),
                widget.CurrentLayout(
                    foreground=colours[2],
                    background=colours[0],
                    padding=5
                    ),
                # widget.TextBox(
                #     text='|',
                #     font="Firacode Nerd Font",
                #     background=colours[0],
                #     foreground='474747',
                #     padding=2,
                #     fontsize=14
                #     ),
                widget.WindowName(
                    foreground=colours[6],
                    background=colours[0],
                    padding=0
                    ),
                widget.Systray(
                    background=colours[0],
                    padding=5
                    ),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=colours[0],
                    background=colours[0]
                    ),
                widget.TextBox(
                    text='',
                    font="Firacode Nerd Font",
                    background=colours[0],
                    foreground=colours[3],
                    padding=-7,
                    fontsize=46
                    ),
                widget.Net(
                    interface="wlp3s0",
                    format='Net: {down} ↓↑ {up}',
                    foreground=colours[1],
                    background=colours[3],
                    padding=5
                    ),
                widget.TextBox(
                    text='',
                    font="Firacode Nerd Font",
                    background=colours[3],
                    foreground=colours[4],
                    padding=-7,
                    fontsize=46
                    ),
                widget.ThermalSensor(
                    foreground=colours[1],
                    background=colours[4],
                    threshold=90,
                    fmt='Temp: {}',
                    padding=5
                    ),
                widget.TextBox(
                    text='',
                    font="Firacode Nerd Font",
                    background=colours[4],
                    foreground=colours[6],
                    padding=-7,
                    fontsize=46
                    ),
                widget.Memory(
                    foreground=colours[1],
                    background=colours[6],
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(my_terminal + ' -e htop')},
                    fmt='Mem: {}',
                    padding=5
                    ),
                widget.TextBox(
                    text='',
                    font="Firacode Nerd Font",
                    background=colours[6],
                    foreground=colours[7],
                    padding=-7,
                    fontsize=46
                    ),
                widget.Volume(
                    foreground=colours[1],
                    background=colours[7],
                    fmt='Vol: {}',
                    padding=5
                    ),
                widget.TextBox(
                    text='',
                    font="Firacode Nerd Font",
                    background=colours[7],
                    foreground=colours[9],
                    padding=-7,
                    fontsize=46
                    ),
                widget.Wallpaper(
                    directory="~/.config/wallpapers/pixelart",
                    foreground=colours[1],
                    background=colours[9],
                    label="[=]"),
                widget.BatteryIcon(
                    foreground=colours[1],
                    background=colours[9],
                ),
                widget.Clock(
                    foreground=colours[1],
                    background=colours[9],
                    format="%A, %B %d - %H:%M "
                ),
            ],
            27,
            margin=2,
        )
    )
]


# prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

# floating_layout = layout.Floating(float_rules=[
#     # Run the utility of `xprop` to see the wm class and name of an X client.
#     # default_float_rules include: utility, notification, toolbar, splash, dialog,
#     # file_progress, confirm, download and error.
#     *layout.Floating.default_float_rules,
#     # tastyworks exit box
#     Match(title='Confirmation'),
#     # qalculate-gtk
#     Match(title='Qalculate!'),
#     # kdenlive
#     Match(wm_class='kdenlive'),
#     # GPG key password entry
#     Match(wm_class='pinentry-gtk-2'),
# ])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# @hook.subscribe.startup_once

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
