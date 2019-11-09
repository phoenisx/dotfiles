function enable_blur
  set ppid (ps --no-header -p %self -o ppid | awk '{gsub (" ", "", $0); print}')
  if test (ps --no-header -p $ppid -o comm | grep -E '^alacritty$')
    set wid (xdotool search --pid $ppid)
    xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
  end
end
