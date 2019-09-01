#!/usr/bin/fish

function screen_lock --description "Lock my Screen"
  command i3lock -n -i ~/Pictures/wallpapers/lock-screen.png \
    --insidecolor=ffffff00 --ringcolor=e5b567ff --line-uses-inside \
    --keyhlcolor=ffffffff --bshlcolor=ffffffff --separatorcolor=ffffff55 \
    --insidevercolor=7e8e5000 --insidewrongcolor=ac414200 \
    --ringvercolor=7e8e50ff --ringwrongcolor=ac4142ff --indpos="x+86:y+1354" \
    --radius=20 \
    --verif-font="FuraCode Nerd Font" --verifsize=24 --verifcolor=7e8e50ff --veriftext="" --verifpos="ix+0:iy+6"\
    --wrong-font="FuraCode Nerd Font" --wrongsize=24 --wrongcolor=ac4142ff --wrongtext="" --wrongpos="ix+0:iy+6" \
    --noinputtext="" \
    --indicator --clock \
    --timecolor=ffffffff --timestr="%H:%M:%S" --timepos="ix+110:iy+2" \
    --datecolor=e5b567ff --datestr="%A, %m %Y" --datepos="tx+0:ty+20" &
end

function system_exit --description "Handles the System Lock/Suspend/Shutdown"
  switch $argv[1]
    case lock
      screen_lock
    case logout
      i3-msg exit
    case suspend
      screen_lock && command systemctl suspend
    case hibernate
      screen_lock && command systemctl hibernate
    case reboot
      command systemctl reboot
    case shutdown
      command systemctl poweroff
  end
end
