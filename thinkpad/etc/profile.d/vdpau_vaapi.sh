#!/bin/sh

# Video Decode and Presentation API for Unix
# 1) install packages "libvdpau-va-gl" and "libva-intel-driver" for intel
# 2) copy this file
# 3) chmod 755
# 4) reboot
# more info: https://wiki.archlinux.org/index.php/VDPAU

export VDPAU_DRIVER=va_gl
export LIBVA_DRIVER_NAME=gallium
