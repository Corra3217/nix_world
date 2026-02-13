import os

import libqtile.resources
from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
        Key([mod, "control"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
        Key([mod, "control"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
        Key([mod, "control"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key([mod, "control"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
        Key([mod, "shift"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key([mod, "shift"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
        Key([mod, "shift"], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([mod, "shift"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
        Key(
            [mod, "shift"],
            "Return",
            lazy.layout.toggle_split(),
            desc="Toggle between split and unsplit sides of stack",
            ),
        Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
        Key([mod, "shift"], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window",),
        Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
        Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
        Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
        Key([mod], "f", lazy.spawn("rofi -show drun")),
        ]

for vt in range(1, 8):
    keys.append(
            Key(
                ["control", "mod1"],
                f"f{vt}",
                lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
                desc=f"Switch to VT{vt}",
                )
            )


groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
            [
                Key(
                    [mod],
                    i.name,
                    lazy.group[i.name].toscreen(),
                    desc=f"Switch to group {i.name}",
                    ),
                Key(
                    [mod, "shift"],
                    i.name,
                    lazy.window.togroup(i.name, switch_group=True),
                    desc=f"Switch to & move focused window to group {i.name}",
                    ),
                Key([], "XF86AudioRaiseVolume",
                    lazy.spawn("pamixer -i 5"),
                    desc="Increase volume"),

                # Volume down
                Key([], "XF86AudioLowerVolume",
                    lazy.spawn("pamixer -d 5"),
                    desc="Decrease volume"),

                # Mute toggle
                Key([], "XF86AudioMute",
                    lazy.spawn("pamixer -t"),
                    desc="Toggle mute00"),

                # Brightness up
                Key([], "XF86MonBrightnessUp",
                    lazy.spawn("brightnessctl set +10%"),
                    desc = "Increase brightness"),

                # Brightness down
                Key([], "XF86MonBrightnessDown",
                    lazy.spawn("brightnessctl set 10-%"),
                    desc = "Decrease brightness"),
                ]
            )

layouts = [
        layout.Columns(border_focus=["#ffffff"], border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=3),
        layout.Max(),
        ]

widget_defaults = dict(
        font="sans",
        fontsize=16,
        padding=3,
        )
extension_defaults = widget_defaults.copy()

logo = os.path.join(os.path.dirname(libqtile.resources.__file__), "logo.png")
screens = [
        Screen(
            top=bar.Bar(
                [
                    widget.GroupBox(),
                    widget.Prompt(),
                    widget.WindowName(),
                    widget.Chord(
                        chords_colors={
                            "launch": ("#ff0000", "#ffffff"),
                            },
                        name_transform=lambda name: name.upper(),
                        ),
                    widget.Systray(),
                    widget.TextBox(" | "),
                    widget.Battery(format = "{percent:2.0%}  {hour:d}:{min:02d} left", full_short_text = 'FULL'),
                    widget.TextBox(" | "),
                    widget.Clock(format="%a %I:%M %p (%d/%m)"),
                    widget.TextBox(" | "),
                    widget.QuickExit(default_text='[logout ]', countdown_format='[   {}   ]'),
                    ],
                24,
                opacity=0.9,
                mouse_callbacks={ 'Button1': lambda: qtile.cmd_show_bar() },
                border_width=[0, 0, 0, 0],
                border_color=["ffffff", "000000", "000000", "000000"]
                ),
            background="#00000000",
            #allpaper=os.path.join(os.path.dirname("/home/pictures/"), "frieren.png"),
            wallpaper_mode="fill",
            ),
        ]

# Drag floating layouts.
mouse = [
        Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
        Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front()),
        ]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
        float_rules=[
            # Run the utility of `xprop` to see the wm class and name of an X client.
            *layout.Floating.default_float_rules,
            Match(wm_class="confirmreset"),  # gitk
            Match(wm_class="makebranch"),  # gitk
            Match(wm_class="maketag"),  # gitk
            Match(wm_class="ssh-askpass"),  # ssh-askpass
            Match(title="branchdialog"),  # gitk
            Match(title="pinentry"),  # GPG key password entry
            ]
        )
auto_fullscreen = True
focus_on_window_activation = "smart"
focus_previous_on_window_remove = False
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False # True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

wmname = "LG3D"
