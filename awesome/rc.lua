-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
vicious = require("vicious")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
        title = "Oops, an error happened!",
        text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init("/home/xavier/.config/awesome/themes/travonz/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "vi"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    --    awful.layout.suit.spiral,
    --   awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    --   awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 600, height = 20 } })
        end
    end
end
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
mynetworkmenu = awful.menu({ items = {
    { "&i Disconnect",    function () awful.util.spawn("/home/bin/disconnect") end, "/home/xavier/.config/awesome/themes/travonz/icons/disconnect.svg"},
    { "&o Connect internet", function () awful.util.spawn("/home/bin/connectInternet") end, "/home/xavier/.config/awesome/themes/travonz/icons/connect.svg"},
    { "&p Connect local",  function () awful.util.spawn("/home/bin/connectLocal") end, "/home/xavier/.config/awesome/themes/travonz/icons/connectLan.svg"},
    --   { "&block firewall",  function () awful.util.spawn("/home/bin/firewallClosed") end},
    { "&u Toggle VPN",  function () awful.util.spawn("/home/bin/toggleVPN") end, "/home/xavier/.config/awesome/themes/travonz/icons/vpn.svg" }
}
})

myutilitymenu = awful.menu({ items = {
    { "&i System info",    function () awful.util.spawn("/home/bin/showConky") end, "/home/xavier/.config/awesome/themes/travonz/icons/systemInfo.svg"},
    { "&u toggle music", function () awful.util.spawn("/usr/bin/mpc -q toggle") end, "/home/xavier/.config/awesome/themes/travonz/icons/music.svg"},
    { "&o hotkeys", function() return false, hotkeys_popup.show_help end, "/home/xavier/.config/awesome/themes/travonz/icons/hotkeys.svg"},
    { "&p screenshot", function () awful.util.spawn("/home/bin/screenshot") end, "/home/xavier/.config/awesome/themes/travonz/icons/screenshot.svg"},
    { "&f firefox S/C", function () awful.util.spawn("/home/bin/processSTOPCONT firefox") end, "/home/xavier/.config/awesome/themes/travonz/icons/startstop.svg"},
    { "quit", function() awesome.quit() end, "/home/xavier/.config/awesome/themes/travonz/icons/exit.svg"},
    { "lock screen", function () awful.util.spawn("/usr/bin/xscreensaver-command -lock") end, "/home/xavier/.config/awesome/themes/travonz/icons/lock.svg"},
    { "restart", awesome.restart, "/home/xavier/.config/awesome/themes/travonz/icons/restart.svg" },
    { "&sleep", function () awful.util.spawn("/home/bin/sle") end, "/home/xavier/.config/awesome/themes/travonz/icons/sleep.svg"}
}
})



-- myawesomemenu = {
--    { "hotkeys", function() return false, hotkeys_popup.show_help end},
--    { "manual", terminal .. " -e man awesome" },
--    { "edit config", editor_cmd .. " " .. awesome.conffile },
--    { "restart", awesome.restart },
--    { "quit", function() awesome.quit() end}
-- }

-- mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
mymainmenu = awful.menu({ items = {
    { "terminal", terminal, "/home/xavier/.config/awesome/themes/travonz/icons/terminal.svg" },
    { "&filemanager", "pcmanfm", "/home/xavier/.config/awesome/themes/travonz/icons/fileManager.svg" },
    { "&speedcrunch", "speedcrunch", "/home/xavier/.config/awesome/themes/travonz/icons/calculator.svg" },
    { "&virtualbox", "VirtualBox", "/home/xavier/.config/awesome/themes/travonz/icons/virtualization.svg" },
    { "&cade", "/home/xavier/Projects/plk/etc/CaDe", "/home/xavier/.config/awesome/themes/travonz/icons/cade.svg" },
    -- { "&text editor", "tea", "/usr/share/pixmaps/tea.png" },
    { "&evince", "evince", "/home/xavier/.config/awesome/themes/travonz/icons/pdf.svg" },
    { "&libreoffice", "libreoffice", "/home/xavier/.config/awesome/themes/travonz/icons/libreoffice.svg" },
    --{ "sk&ype", "skype", "/usr/share/icons/hicolor/16x16/apps/skype.png" },
    { "gimp", "gimp", "/home/xavier/.config/awesome/themes/travonz/icons/gimp.svg" },
    { "&inkscape", "inkscape", "/home/xavier/.config/awesome/themes/travonz/icons/inkscape.svg" },
    { "scribus", "scribus", "/home/xavier/.config/awesome/themes/travonz/icons/scribus.svg" },
    { "blender", "blender", "/home/xavier/.config/awesome/themes/travonz/icons/blender.svg" },
    { "avidemux", "avidemux3_qt4", "/home/xavier/.config/awesome/themes/travonz/icons/video.svg" },
    { "&wifi gui", "wpa_gui", "/home/xavier/.config/awesome/themes/travonz/icons/wifi.svg" },
    { "irc", "/usr/bin/alacritty -e weechat", "/home/xavier/.config/awesome/themes/travonz/icons/irc.svg" },
    { "kee&pass", "/usr/bin/keepassxc", "/home/xavier/.config/awesome/themes/travonz/icons/key.svg" },
    { "&music", "/usr/bin/alacritty -e ncmpcpp", "/home/xavier/.config/awesome/themes/travonz/icons/music.svg" },
    { "&vlc", "vlc", "/home/xavier/.config/awesome/themes/travonz/icons/vlc.svg" },
    { "thunderbird", "/usr/bin/thunderbird", "/home/xavier/.config/awesome/themes/travonz/icons/mail.svg" },
    { "firefox", "/usr/bin/firefox", "/home/xavier/.config/awesome/themes/travonz/icons/webBrowser.svg" },
}
})



-- {{{ Reusable separator
spacer = wibox.widget.textbox()
spacer:set_text(" | ")


--mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
--                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()


-- Initializes baticon as an image
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.widget_battery)

-- Initializes batwidet as a text container
batwidget = wibox.widget.textbox()

-- "BAT0" will always be your battery arugment (I have never
-- seen a laptop with two batteries)
-- bat.lua can return:
-- $1 = requested state of battery, charging/discharging
-- $2 = charge level in $
-- $3 = remaining time

vicious.register( batwidget, vicious.widgets.bat, '<span color="#FFFFFF" >$1$2% $3</span>', 30, "BAT0" )


-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
awful.button({ }, 1, function(t) t:view_only() end),
awful.button({ modkey }, 1, function(t)
    if client.focus then
        client.focus:move_to_tag(t)
    end
end),
awful.button({ }, 3, awful.tag.viewtoggle),
awful.button({ modkey }, 3, function(t)
    if client.focus then
        client.focus:toggle_tag(t)
    end
end),
awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(

awful.button({ }, 1, function (c)
    if c == client.focus then
        c.minimized = true
    else
        -- Without this, the following
        -- :isvisible() makes no sense
        c.minimized = false
        if not c:isvisible() and c.first_tag then
            c.first_tag:view_only()
        end
        -- This will also un-minimize
        -- the client, if needed
        client.focus = c
        c:raise()
    end
end),
awful.button({ }, 3, client_menu_toggle_fn()),
awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
end),
awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "[1]","[2]", "[3]", "[4]", "[5]", "[6]", "[7]" }, s, awful.layout.layouts[2])
    --    awful.tag({ "[desk]","[www]", "[mail]", "[media]", "[dev]", "[CaDe]", "[work]", "[win]", "[term]" }, s, awful.layout.layouts[2])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        --            mylauncher,
        s.mytaglist,
        s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
    layout = wibox.layout.fixed.horizontal,
    --            mykeyboardlayout,
    wibox.widget.systray(),
    spacer,
    batwidget,
    baticon,
    spacer,
    mytextclock,
    s.mylayoutbox,
},
                    }
                end)
                -- }}}


                -- {{{ Mouse bindings
                root.buttons(gears.table.join(
                awful.button({ }, 3, function () myutilitymenu:toggle() end)
                -- COMMENTED OUT IN ORDER NOT TO CHANGE TAG WITH MOUSE WHEEL
                --    awful.button({ }, 4, awful.tag.viewnext),
                --    awful.button({ }, 5, awful.tag.viewprev)
                ))
                -- }}}

                -- {{{ Key bindings
                globalkeys = gears.table.join(
                --   awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
                --              {description = "show help", group = "awesome"}),
                awful.key({ modkey,           }, "j",   awful.tag.viewprev,
                {description = "view previous", group = "tag"}),
                awful.key({ modkey,           }, "k",  awful.tag.viewnext,
                {description = "view next", group = "tag"}),
                awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
                {description = "go back", group = "tag"}),

                awful.key({ modkey, "Shift"          }, "j",
                function ()
                    awful.client.focus.byidx( 1)
                end,
                {description = "focus next by index", group = "client"}
                ),
                awful.key({ modkey, "Shift"          }, "k",
                function ()
                    awful.client.focus.byidx(-1)
                end,
                {description = "focus previous by index", group = "client"}
                ),
                awful.key({ modkey,           }, "p", function () mymainmenu:show() end,
                {description = "show main menu", group = "awesome"}),
                awful.key({ modkey,           }, "i", function () mynetworkmenu:show() end,
                {description = "show network menu", group = "awesome"}),
                awful.key({ modkey,           }, "u", function () myutilitymenu:show() end,
                {description = "show utility menu", group = "awesome"}),
                awful.key({ }, "Print", function () awful.spawn("/home/bin/screenshot") end,
                {description = "Take a screenshot of a region and copy it to clipboard", group = "awesome"}),


                -- Layout manipulation
                awful.key({ modkey,          }, "s", function () awful.client.swap.byidx(  1)    end,
                {description = "swap with next client by index", group = "client"}),
                awful.key({ modkey,          }, "d", function () awful.client.swap.byidx( -1)    end,
                {description = "swap with previous client by index", group = "client"}),
                awful.key({ modkey,         }, "o", function () awful.screen.focus_relative( 1) end,
                {description = "focus the next screen", group = "screen"}),
                --    awful.key({ modkey, "Shift" }, "k", function () awful.screen.focus_relative(-1) end,
                --              {description = "focus the previous screen", group = "screen"}),
                --    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
                --              {description = "jump to urgent client", group = "client"}),
                --    awful.key({ modkey,           }, "Tab",
                --        function ()
                --            awful.client.focus.history.previous()
                --            if client.focus then
                --                client.focus:raise()
                --            end
                --        end,
                --        {description = "go back", group = "client"}),

                -- modkey + Tab to display clients menu
                awful.key({ modkey,           }, "Tab", client_menu_toggle_fn(),
                client_menu_toggle_fn             {description="Switch clients menu", group="client"}),


                -- Standard program
                awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
                {description = "open a terminal", group = "launcher"}),
                --     awful.key({ modkey, "Control" }, "r", awesome.restart,
                --               {description = "reload awesome", group = "awesome"}),
                --    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
                --              {description = "quit awesome", group = "awesome"}),
                --     awful.key({ modkey,           }, "z",     function () awful.util.spawn("/usr/bin/xscreensaver-command -lock") end,
                --               {description = "lock screen", group = "awesome"}),
                --    awful.key({ modkey,           }, "F11",     function () awful.util.spawn("/usr/bin/mpc -q toggle") end,
                --              {description = "Pause Music", group = "awesome"}),
                --    awful.key({ modkey,           }, "F12",     function () awful.util.spawn("/home/bin/showConky") end,
                --              {description = "Show Playing song", group = "awesome"}),
                --    awful.key({ modkey, "Shift",           }, "F10",     function () awful.util.spawn("/home/bin/toggleAstrill") end,
                --              {description = "Toggle Astrill", group = "awesome"}),
                --    awful.key({ modkey, "Shift",           }, "F11",     function () awful.util.spawn("/home/bin/connect") end,
                --              {description = "Connect wifi", group = "awesome"}),
                --    awful.key({ modkey, "Shift",           }, "F12",     function () awful.util.spawn("/home/bin/disconnect") end,
                --              {description = "Disconnect wifi", group = "awesome"}),
                awful.key({ modkey,                    }, "Up",     function () awful.util.spawn("amixer sset Master 5%+") end,
                --    awful.key({ modkey,                    }, "Up",     function () awful.util.spawn("/usr/bin/pactl set-sink-volume 0 +5%") end,
                {description = "Increase volume", group = "awesome"}),
                --    awful.key({ modkey,                    }, "Down",     function () awful.util.spawn("/usr/bin/pactl set-sink-volume 0 -5%") end,
                awful.key({ modkey,                    }, "Down",     function () awful.util.spawn("amixer sset Master 5%-") end,
                {description = "Decrease volume", group = "awesome"}),


                awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
                {description = "increase master width factor", group = "layout"}),
                awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
                {description = "decrease master width factor", group = "layout"}),
                awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
                {description = "increase the number of master clients", group = "layout"}),
                awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
                {description = "decrease the number of master clients", group = "layout"}),
                awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
                {description = "increase the number of columns", group = "layout"}),
                awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
                {description = "decrease the number of columns", group = "layout"}),
                awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
                {description = "select next", group = "layout"}),
                awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
                {description = "select previous", group = "layout"}),

                awful.key({ modkey, "Control" }, "n",
                function ()
                    local c = awful.client.restore()
                    -- Focus restored client
                    if c then
                        client.focus = c
                        c:raise()
                    end
                end,
                {description = "restore minimized", group = "client"}),

                -- Prompt
                awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
                {description = "run prompt", group = "launcher"}),

                awful.key({ modkey }, "x",
                function ()
                    awful.prompt.run {
                        prompt       = "Run Lua code: ",
                        textbox      = awful.screen.focused().mypromptbox.widget,
                        exe_callback = awful.util.eval,
                        history_path = awful.util.get_cache_dir() .. "/history_eval"
                    }
                end,
                {description = "lua execute prompt", group = "awesome"})
                -- Menubar
                --     awful.key({ modkey }, "p", function() menubar.show() end,
                --               {description = "show the menubar", group = "launcher"})
                )

                clientkeys = gears.table.join(
                awful.key({ modkey,           }, "f",
                function (c)
                    c.fullscreen = not c.fullscreen
                    c:raise()
                end,
                {description = "toggle fullscreen", group = "client"}),
                awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),
                awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),
                awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),
                awful.key({ modkey, "Shift"   }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),
                awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),
                awful.key({ modkey,           }, "n",
                function (c)
                    -- The client currently has the input focus, so it cannot be
                    -- minimized, since minimized clients can't have the focus.
                    c.minimized = true
                end ,
                {description = "minimize", group = "client"}),
                awful.key({ modkey,           }, "m",
                function (c)
                    c.maximized = not c.maximized
                    c:raise()
                end ,
                {description = "(un)maximize", group = "client"}),
                awful.key({ modkey, "Control" }, "m",
                function (c)
                    c.maximized_vertical = not c.maximized_vertical
                    c:raise()
                end ,
                {description = "(un)maximize vertically", group = "client"}),
                awful.key({ modkey, "Shift"   }, "m",
                function (c)
                    c.maximized_horizontal = not c.maximized_horizontal
                    c:raise()
                end ,
                {description = "(un)maximize horizontally", group = "client"})
                )

                -- Bind all key numbers to tags.
                -- Be careful: we use keycodes to make it work on any keyboard layout.
                -- This should map on the top row of your keyboard, usually 1 to 9.
                for i = 1, 4 do
                    local keybinding = "F" .. i
                    globalkeys = gears.table.join(globalkeys,
                    -- View tag only.
                    awful.key({ modkey }, keybinding,
                    function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                            tag:view_only()
                        end
                    end,
                    {description = "view tag #"..i, group = "tag"}),
                    -- Toggle tag display.
                    awful.key({ modkey, "Control" }, keybinding,
                    function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                            awful.tag.viewtoggle(tag)
                        end
                    end,
                    {description = "toggle tag #" .. i, group = "tag"}),
                    -- Move client to tag.
                    awful.key({ modkey, "Shift" }, keybinding,
                    function ()
                        if client.focus then
                            local tag = client.focus.screen.tags[i]
                            if tag then
                                client.focus:move_to_tag(tag)
                            end
                        end
                    end,
                    {description = "move focused client to tag #"..i, group = "tag"}),
                    -- Toggle tag on focused client.
                    awful.key({ modkey, "Control", "Shift" }, keybinding,
                    function ()
                        if client.focus then
                            local tag = client.focus.screen.tags[i]
                            if tag then
                                client.focus:toggle_tag(tag)
                            end
                        end
                    end,
                    {description = "toggle focused client on tag #" .. i, group = "tag"})
                    )
                end


                for i = 1, 5 do
                    globalkeys = gears.table.join(globalkeys,
                    -- View tag only.
                    awful.key({ modkey }, "#" .. i + 9,
                    function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i+4]
                        if tag then
                            tag:view_only()
                        end
                    end,
                    {description = "view tag #"..i+4, group = "tag"}),
                    -- Toggle tag display.
                    awful.key({ modkey, "Control" }, "#" .. i + 9,
                    function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i+4]
                        if tag then
                            awful.tag.viewtoggle(tag)
                        end
                    end,
                    {description = "toggle tag #" .. i+4, group = "tag"}),
                    -- Move client to tag.
                    awful.key({ modkey, "Shift" }, "#" .. i + 9,
                    function ()
                        if client.focus then
                            local tag = client.focus.screen.tags[i+4]
                            if tag then
                                client.focus:move_to_tag(tag)
                            end
                        end
                    end,
                    {description = "move focused client to tag #"..i+4, group = "tag"}),
                    -- Toggle tag on focused client.
                    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                    function ()
                        if client.focus then
                            local tag = client.focus.screen.tags[i+4]
                            if tag then
                                client.focus:toggle_tag(tag)
                            end
                        end
                    end,
                    {description = "toggle focused client on tag #" .. i+4, group = "tag"})
                    )
                end





                clientbuttons = gears.table.join(
                -- COMMENTED OUT TO PREVENT CLIENT TO RAISE WHEN CLICK INSIDE
                --    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
                awful.button({ modkey }, 1, awful.mouse.client.move),
                awful.button({ modkey }, 3, awful.mouse.client.resize))

                -- Set keys
                root.keys(globalkeys)
                -- }}}

                -- {{{ Rules
                -- Rules to apply to new clients (through the "manage" signal).
                awful.rules.rules = {
                    -- All clients will match this rule.
                    { rule = { },
                    properties = { size_hints_honor = false, -- REMOVING GAPS BETWEEN WINDOWS
                    border_width = beautiful.border_width,
                    border_color = beautiful.border_normal,
                    focus = awful.client.focus.filter,
                    raise = true,
                    keys = clientkeys,
                    buttons = clientbuttons,
                    screen = awful.screen.preferred,
                    placement = awful.placement.no_overlap+awful.placement.no_offscreen+awful.placement.centered
                }
            },

            -- Enable / Disable titlebars to normal clients and dialogs
            { rule_any = {type = { "normal", "dialog" }
        }, properties = { titlebars_enabled = false }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } }

    --    { rule = { class = "CaDe" },
    --    properties = { tag = tags[2][3] } },
    { rule = { class = "conky" },
    properties = { floating = true } },
    { rule = { class = "xpad" },
    properties = { floating = true, skip_taskbar = true , below = true} },
    -- Set Firefox to always map on tags number 2 of screen 1.
    { rule = { class = "firefox" },
    properties = { screen = 1, tag = "[2]" } }, --maximized_horizontal=true, maximized_vertical=true } },
    { rule = { class = "Thunderbird" },
    properties = { screen = 1, tag = "[1]" } }, --maximized_horizontal=true, maximized_vertical=true } },
    --     { rule = { class = "Ario" },
    --       properties = { screen = 1, tag = "[media]" } },
    { rule = { name = "ncmpcpp" },
    properties = {  screen = 1, tag = "[1]" } },
    { rule = { name = "skype" },
    properties = {  screen = 1, tag = "[1]", floating = true } }



}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
        not c.size_hints.user_position
        and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

client.connect_signal("maximize", function(c) c.border_width = 0 end)
client.connect_signal("unmaximize", function(c) c.border_width = beautiful.border_width end)
-- }}}


-- This launches a signal as soons as tag is swithed, assuming only one screen
--screen[1]:connect_signal("tag::history::update", function()
--	print(awful.tag.selected(1).name)
--end)

-- Set focus on a client under mouse cursor when a tag is changed
-- Time should by adjusted to make it work

-- TODO: property::selected can be replaced by tag::history::update

tag.connect_signal(
"property::selected",
function (t)
    local selected = tostring(t.selected) == "false"
    if selected then
        local focus_timer = timer({ timeout = 0.01 })
        focus_timer:connect_signal("timeout", function()
            local c = awful.mouse.client_under_pointer()
            if not (c == nil) then
                client.focus = c
                --          c:raise()
            end
            focus_timer:stop()
        end)
        focus_timer:start()
    end
end
)

--client.connect_signal("focus", function(c)
--                              c.opacity = 1
--                           end)
--client.connect_signal("unfocus", function(c)
--                                c.opacity = 0.7
--                             end)


