--------------------------------------------------------------------------------
-- File   : ~/.xmonad/xmonad.hs                                               --
-- Author : Xiaokui Shu <xiaokui.shu@ibm.com>                                 --
-- Update : 2017/07/14                                                        --
--------------------------------------------------------------------------------
 
import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (removeKeys, additionalKeys)
import XMonad.Hooks.ManageHelpers 
import Graphics.X11.ExtraTypes.XF86

--------------------------------------------------------------------------------
-- MAIN                                                                       --
--------------------------------------------------------------------------------
 
main :: IO ()
main =
    xmonad $ def
        { terminal              = "/usr/bin/urxvt"
        , borderWidth           = 4
        , normalBorderColor     = "#222222"
        , focusedBorderColor    = "#535d6c"
        , workspaces            = myWorkspaces
        , startupHook           = myStartupHook
        , manageHook            = myManageHook
        }
        `removeKeys` defaultWorkspaceKeyMap
        `additionalKeys` myWorkspaceKeyMap
        `additionalKeys` myShortcutKeyMap

--------------------------------------------------------------------------------
-- Workspaces                                                                 --
--------------------------------------------------------------------------------

myWorkspaces = map show [1 .. 11 :: Int]

-- The magic for the second screen, e.g., projector: the second workspace is
-- assigned to the second screen by default. Bind that workspace with a special
-- shortcut, '`', so that it is usually empty when the second screen gets it.
myWorkspaceKeys = [xK_1, xK_grave] ++ [xK_2 .. xK_9] ++ [xK_0]

-- remove this first
defaultWorkspaceKeyMap =
    [(m .|. modMask, n) | n <- [xK_1 .. xK_9], m <- [0, shiftMask]]

-- add this then
myWorkspaceKeyMap =
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip myWorkspaces myWorkspaceKeys
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

--------------------------------------------------------------------------------
-- Shortcuts                                                                  --
--------------------------------------------------------------------------------

myShortcutKeyMap =
    [ ((0, xF86XK_MonBrightnessUp),     spawn "xbacklight -inc 10")
    , ((0, xF86XK_MonBrightnessDown),   spawn "xbacklight -dec 10")
    , ((0, xF86XK_AudioMute),           spawn "amixer set Master toggle")
    , ((0, xF86XK_AudioRaiseVolume),    spawn "amixer set Master 2%+")
    , ((0, xF86XK_AudioLowerVolume),    spawn "amixer set Master 2%-")
    , ((0, xF86XK_LaunchA),             spawn "i3lock -c 000000 -n")
    ]

--------------------------------------------------------------------------------
-- Composition Settings                                                       --
--------------------------------------------------------------------------------

myManageHook = composeAll
    [ className =? "MPlayer"    --> doFloat
    , className =? "VirtualBox" --> doFloat
    ]
    <+>
    composeOne [ isFullscreen -?> doFullFloat ] -- Fix fullscreen issue

--------------------------------------------------------------------------------
-- Auto startup                                                               --
--------------------------------------------------------------------------------

myStartupHook = 
    (spawn "xbacklight -set 75") <+>
    (spawn "xset s off -dpms")
