# iTerm2 Setup

## Local Network

By default, iTerm2 cannot access local network. To enable:

```
System Settings -> Privacy & Security -> Local Network -> iTerm2 -> on
```

## Drag Anywhere With Mouse

To drag anywhere with Command + Control

```
defaults write -g NSWindowShouldDragOnGesture -bool true
```

Then reboot
