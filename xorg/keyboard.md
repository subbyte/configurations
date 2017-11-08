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

#### 1. Esc <-> CapsLock

#### 2. Backspace <-> Backslash

#### 3. (Right) Alt -> (Left) Control

#### 4. Grave <-> (Right) Control
