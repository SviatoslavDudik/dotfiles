import XMonad

import XMonad.Hooks.DynamicLog -- for xmobar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Layout.Renamed

import XMonad.ManageHook

import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.Loggers
import XMonad.Util.Ungrab


main :: IO ()
main = xmonad . ewmh =<< statusBar "xmobar ~/.config/xmobar/xmobarrc" myXmobarPP toggleStrutsKey myConfig
  where
    toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    toggleStrutsKey XConfig{ modMask = m } = (m, xK_b)

myConfig = def
    { modMask = mod4Mask -- rebind Mod to the Super key
    , handleEventHook = fullscreenEventHook -- make fullsreen applications remain in their windows
    , layoutHook = myLayout -- use custom layouts
    , manageHook = myManageHook
    , terminal = "st"
    }
    `additionalKeysP` myKeys

myKeys =
    [ ("M-w", spawn "firefox") -- start Firefox
    , ("M-S-p", spawn "passmenu -i -l 10") -- start password chooser
    , ("M-S-x", spawn "i3lock -c 000000") -- lock the screen
    , ("<XF86AudioRaiseVolume>", spawn "pulsemixer --change-volume +5") -- raise volume by 5 %
    , ("<XF86AudioLowerVolume>", spawn "pulsemixer --change-volume -5") -- lower volume by 5 %
    , ("<XF86AudioMute>", spawn "amixer set Master toggle && amixer set Headphone on && amixer set Speaker on") -- mute/unmute master
    , ("<XF86AudioMicMute>", spawn "amixer sset Capture toggle") -- toggle the microphone
    , ("<XF86TouchpadToggle>", spawn "toggle_touchpad.sh") -- toggle the touchpad
    ]

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = renamed [Replace "3ColZoom"] $ magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "mpv"  --> doFullFloat
    , className =? "mpv"  --> doShift "9"
    , isDialog            --> doFloat
    ]

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap (blue "[") (blue "]")
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, wins] -> [ws, l, wins]
    }
  where
    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#c678dd" ""
    blue     = xmobarColor "#56b6c2" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""



