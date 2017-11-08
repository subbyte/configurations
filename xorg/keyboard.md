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
partial modifier_keys
xkb_symbols "swapescape" {
    key <CAPS> { [ Escape ] };
    key <ESC>  { [ Caps_Lock ] };
    modifier_map Lock { <ESC> };
};
 
// Swap Backspace and Backslash
partial modifier_keys
xkb_symbols "swap_bksp_bksl" {
    key <BKSP> { [ backslash, bar ] };
    key <BKSL> { [ BackSpace, BackSpace ] };
};

// Right Alt key functions as another left Ctrl.
// Swap Tilde and Right Control
partial modifier_keys
xkb_symbols "ctrl_alt_tilde" {
    replace key <RALT> { [ Control_L ] };
    replace key <RCTL> { [ grave, asciitilde ] };
    key <TLDE> { [ Control_R ] };
    modifier_map Control { <LCTL>, <RALT>, <TLDE> };
};
```
- add to file `/usr/share/X11/xkb/rules/evdev` section `! option    =   symbols`
```
subkb:swapescape   =   +subkb(swapescape)
subkb:swap_bksp_bksl   =   +subkb(swap_bksp_bksl)
subkb:ctrl_alt_tilde   =   +subkb(ctrl_alt_tilde)

```
- add to file `/usr/share/X11/xkb/rules/evdev.lst` section `! option`
```
subkb:swapescape    Swap Escape and CapsLock
subkb:swap_bksp_bksl    Swap Backspace and Backslash
subkb:ctrl_alt_tilde    Swap Tilde and Right Control
```
