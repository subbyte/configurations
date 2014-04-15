local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local vicious = require("vicious")

module("wids")

-- Thermal widget
-- package temperature, higher than CPU core temperature, fresh every 4s
thermwidget = wibox.widget.textbox("thermwidget")
vicious.register(thermwidget, vicious.widgets.thermal, " Temp: $1°C ", 4, {"thermal_zone0", "sys"})

-- Battery widget
-- fresh every 30s
batwidget = wibox.widget.textbox("batterywidget")
vicious.register(batwidget, vicious.widgets.bat, " Battery: $2% [$1$3] ", 30, "BAT0")
