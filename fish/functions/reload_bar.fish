function reload_bar
  pkill waybar
  timeout 0.5
  waybar
  notify-send waybar "Configuration reloaded!"
end
