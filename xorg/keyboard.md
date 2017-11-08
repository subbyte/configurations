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
// (Right) Alt -> (Left) Control
// (Left) Control -> Esc
// Esc -> (Right) Control
partial modifier_keys
xkb_symbols "ralt_lctrl" {
    replace key <RALT> { [ Control_L ] };
    key <LCTL> { [ Escape ] };
    key <ESC> { [ Control_R ] };
    modifier_map Control { <RALT>, <ESC> };
};
```
- add to file `/usr/share/X11/xkb/rules/evdev` section `! option    =   symbols`
```
hhkb:ralt_become_lctrl   =   +hhkb(ralt_become_lctrl)
hhkb:lctrl_become_esc    =   +hhkb(lctrl_become_esc)
hhkb:esc_become_rctrl    =   +hhkb(esc_become_rctrl)
```
- add to file `/usr/share/X11/xkb/rules/evdev.lst` section `! option`
```
hhkb:ralt_become_lctrl  (Right) Alt -> (Left) Control
hhkb:lctrl_become_esc   (Left) Control -> Esc
hhkb:esc_become_rctrl   Esc -> (Right) Control
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
