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

### Standard Keyboard
- Functionalities:
  - Esc <-> CapsLock
  - Backspace <-> Backslash
  - (Right) Alt -> (Left) Control
  - Tilde <-> (Right) Control
- create file `/usr/share/X11/xkb/symbols/subkb`
```
// Adjustment for standard keyboard
// - Escape <-> CapsLock
// - Backspace <-> Backslash
// - (Right) Alt -> (Left) Control
// - Tilde <-> (Right) Control
partial modifier_keys
xkb_symbols "std_adj" {
    key <CAPS> { [ Escape ] };
    key <ESC>  { [ Caps_Lock ] };
    key <BKSP> { [ backslash, bar ] };
    key <BKSL> { [ BackSpace, BackSpace ] };
    replace key <RALT> { type[Group1] = "TWO_LEVEL",
                         symbols[Group1] = [ Control_L, Control_L ] };
    key <TLDE> { [ Control_R, Control_R ] };
    replace key <RCTL> { [ grave, asciitilde ] };
    modifier_map Control { <RALT>, <TLDE> };
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
