#### Select One Mouse to be Left-handled

50-LogitechMouse.conf
- `xinput`: get product name, e.g., XXX
- `xinput --list-props "XXX"` to get all properties, which should include `libinput Send Events Mode Enabled`

#### Not In-use Any More

10-intel.conf: configurate backlight working, however, it cannot handle two displays correctly
95-mouse.conf: all mouse to be left-handled, including touchpad, which may cause a bug of left-handed tap
