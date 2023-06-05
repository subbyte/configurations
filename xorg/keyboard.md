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
partial alphanumeric_keys modifier_keys
xkb_symbols "hhkb" {
    // key <TLDE> { [ backslash, bar] };
    key <TLDE> { [ XF86Time ] };
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

### Mistel MD600 Alpha
- create file `/usr/share/X11/xkb/symbols/subkb`
```
// Adjustment for standard keyboard
// - Backslash   -> Backspace
// - Backspace   -> Backslash
// - CapsLock    -> Escape
// - (Right) Alt -> (Left) Control
// - Esc         -> `/~
partial alphanumeric_keys modifier_keys
xkb_symbols "md600" {
    key <CAPS> { [ Escape ] };
    key <ESC>  { [ grave, asciitilde ] };
    key <BKSP> { [ backslash, bar ] };
    key <BKSL> { [ BackSpace, BackSpace ] };
    key <LWIN> { [ XF86Time ] };
    key <RALT> { type[Group1] = "TWO_LEVEL",
                 symbols[Group1] = [ Control_L, Control_L ] };
    modifier_map Control { <RALT> };
};
```
- add to file `/usr/share/X11/xkb/rules/evdev` section `! option    =   symbols`
```
  subkb:md600             =       +subkb(md600)
```
- add to file `/usr/share/X11/xkb/rules/evdev.lst` section `! option`
```
  subkb:md600            6 replacements, see subkb for details
```
- create file `/etc/X11/xorg.conf.d/30-keyboard.conf`
```
Section "InputClass"
        Identifier "MD600"
        MatchIsKeyboard "on"
        MatchProduct "MD600 Alpha"
        Driver "evdev"
        Option "XkbLayout" "us"
        Option "XkbOptions" "subkb:md600"
EndSection
```
