# Keyboard Configurations

### HHKB

#### Keyboard Mode
- Code: 000010
- Functionalities:
  - Alt <-> Mod

#### Xkb Settings
- create file `/usr/share/X11/xkb/symbols/subkb`
```
// HHKB keyboard
// - Control     -> Esc
// - Delete      -> Backspace
// - Backspace   -> Delete
// - (Right) Alt -> (Left) Control
// - Henkan_Mode -> (Right) Control
// - Esc         -> `/~
// - `/~         -> \/|
// may not use "default" in the future
default partial alphanumeric_keys modifier_keys
xkb_symbols "hhkb" {
    key <TLDE> { [ backslash, bar] };
    key <DELE> { [ BackSpace ] };
    key <BKSP> { [ Delete ] };
    key <LCTL> { [ Escape ] };
    key <ESC>  { [ grave, asciitilde ] };
    key <HENK> { [ Control_R ] };
    key <RALT> { type[Group1] = "TWO_LEVEL",
                 symbols[Group1] = [ Control_L, Control_L ] };
};
```
- add to file `/usr/share/X11/xkb/rules/evdev` section `! option    =   symbols`
```
  subkb:hhkb            =       +subkb(hhkb)
```
- add to file `/usr/share/X11/xkb/rules/evdev.lst` section `! option`
```
  subkb:hhkb           5 replacements, see subkb for details
```
- create file `/etc/X11/xorg.conf.d/30-keyboard.conf`
```
Section "InputClass"
        Identifier "HHKB"
        MatchIsKeyboard "on"
        MatchProduct "HHKB Professional"
        Driver "evdev"
        Option "XkbLayout" "us"
        Option "XkbOptions" "subkb:hhkb"
EndSection
```

### Standard Keyboard (to update)
- create file `/usr/share/X11/xkb/symbols/subkb`
```
// Adjustment for standard keyboard
// - Backspace <-> Backslash
// - CapsLock -> Escape
// - (Right) Alt -> (Left) Control
// - Escape -> (Right) Control
partial modifier_keys
xkb_symbols "std" {
    key <CAPS> { [ Escape ] };
    key <ESC> { [ Control_R ] };
    key <BKSP> { [ backslash, bar ] };
    key <BKSL> { [ BackSpace, BackSpace ] };
    replace key <RALT> { type[Group1] = "TWO_LEVEL",
                         symbols[Group1] = [ Control_L, Control_L ] };
    modifier_map Control { <RALT>, <ESC> };
};
```
- add to file `/usr/share/X11/xkb/rules/evdev` section `! option    =   symbols`
```
  subkb:std             =       +subkb(std)
```
- add to file `/usr/share/X11/xkb/rules/evdev.lst` section `! option`
```
  subkb:std            4 replacements, see subkb for details
```
- create file `/etc/X11/xorg.conf.d/30-keyboard.conf`
```
Section "InputClass"
        Identifier "standard keyboard"
        MatchIsKeyboard "on"
        MatchProduct "AT Translated Set 2 keyboard"
        Driver "evdev"
        Option "XkbLayout" "us"
        Option "XkbOptions" "subkb:std"
EndSection
```
