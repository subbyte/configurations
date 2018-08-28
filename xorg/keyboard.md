# Keyboard Configurations

### HHKB

#### Keyboard Mode
- Code: 001010
- Functionalities:
  - Delete -> Backspace
  - Alt <-> Mod

#### Xkb Settings
- Functionalities:
  - (Right) Alt -> (Left) Control
  - (Left) Control -> Esc
  - Esc -> (Right) Control
- create file `/usr/share/X11/xkb/symbols/subkb`
```
// TLDE -> Delete
// Henkan_Mode -> Grave / Tilde
// (Right) Alt -> (Left) Control
// (Left) Control -> Esc
// Esc -> (Right) Control
partial modifier_keys
xkb_symbols "hhkb_adj" {
    key <TLDE> { [ Delete, Delete ] };
    key <HENK> { [ grave, asciitilde ] };
    replace key <RALT> { type[Group1] = "TWO_LEVEL",
                         symbols[Group1] = [ Control_L, Control_L ] };
    replace key <LCTL> { [ Escape ] };
    replace key <ESC> { [ Control_R ] };
    modifier_map Control { <RALT>, <ESC> };
};
```
- add to file `/usr/share/X11/xkb/rules/evdev` section `! option    =   symbols`
```
  subkb:hhkb_adj        =       +subkb(hhkb_adj)
```
- add to file `/usr/share/X11/xkb/rules/evdev.lst` section `! option`
```
  subkb:hhkb_adj       5 replacements, see subkb for details
```
- create file `/etc/X11/xorg.conf.d/30-keyboard.conf`
```
Section "InputClass"
        Identifier "HHKB"
        MatchIsKeyboard "on"
        MatchProduct "HHKB Professional"
        Driver "evdev"
        Option "XkbLayout" "us"
        Option "XkbOptions" "subkb:hhkb_adj"
EndSection
```

### Standard Keyboard
- Functionalities:
  - Esc <-> CapsLock
  - Backspace <-> Backslash
  - (Right) Alt -> (Left) Control
  - Tilde <-> (Right) Control
- create file `/usr/share/X11/xkb/symbols/subkb`
```
// Adjustment for standard keyboard
// - Backspace <-> Backslash
// - CapsLock -> Escape
// - (Right) Alt -> (Left) Control
// - Escape -> (Right) Control
partial modifier_keys
xkb_symbols "std_adj" {
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
  subkb:std_adj         =       +subkb(std_adj)
```
- add to file `/usr/share/X11/xkb/rules/evdev.lst` section `! option`
```
  subkb:std_adj        4 replacements, see subkb for details
```
- create file `/etc/X11/xorg.conf.d/30-keyboard.conf`
```
Section "InputClass"
        Identifier "standard keyboard"
        MatchIsKeyboard "on"
        MatchProduct "AT Translated Set 2 keyboard"
        Driver "evdev"
        Option "XkbLayout" "us"
        Option "XkbOptions" "subkb:std_adj"
EndSection
```
