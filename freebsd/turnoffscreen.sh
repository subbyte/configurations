#!/usr/bin/sh

################################################################
#        turnoffscreen.sh: Turn Off Screen After Booting
#
#   author:     Xiaokui Shu
#   version:    1.0
#   license:    Apache 2.0
#   email:      xiaokui.shu@ibm.com
#   require:    pkg install vbetool
#   activate:   add "@reboot /xxx/turnoffscreen.sh" to crontab
#   note:       important especially after the Thinkpad lid
#               detector (magnet) is disabled (unplugging
#               mic/cam cable)
################################################################

# act at 5 min after booting
sleep 300

# turn off "no zero mapping" security feature on FreeBSD
sysctl security.bsd.map_at_zero=1

# turn off screen
/usr/local/sbin/vbetool dpms off

# turn "no zero mapping" back on
sysctl security.bsd.map_at_zero=0
