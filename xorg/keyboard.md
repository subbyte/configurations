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
- create file `/usr/share/X11/xkb/symbols/hhkb`
```
// (Right) Alt -> (Left) Control
partial modifier_keys
xkb_symbols "ralt_become_lctrl" {
    replace key <RALT> { [ Control_L, Control_L ] };
    replace key <LCTL> { [ Alt_R, Meta_R ] };
};

// (Left) Control -> Esc
partial modifier_keys
xkb_symbols "lctrl_become_esc" {
    replace key <LCTL> { [ Escape ] };
};

// Esc -> (Right) Control
partial modifier_keys
xkb_symbols "esc_become_rctrl" {
    replace key <ESC> { [ Control_R ] };
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
  - Grave <-> (Right) Control
- create file `/usr/share/X11/xkb/symbols/subx`
```
partial modifier_keys
xkb_symbols "swap_bksp_bksl" {
    // Swap Backspace and Backslash
    key <BKSP> { [ backslash, bar ] };
    key <BKSL> { [ BackSpace, BackSpace ] };
};

// Right Alt key functions as another left Ctrl.
partial modifier_keys
xkb_symbols "ralt_lctrl" {
    replace key <RALT> { type[Group1] = "TWO_LEVEL",
                         symbols[Group1] = [ Control_L, Control_L ] };
    modifier_map Control { <RALT> };
};
```
