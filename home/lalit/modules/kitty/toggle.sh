if /etc/profiles/per-user/lalit/bin/aerospace list-apps --format %{app-bundle-id} | grep -q 'net.kovidgoyal.kitty'; then
  if /etc/profiles/per-user/lalit/bin/aerospace list-apps --macos-native-hidden --format %{app-bundle-id} | grep -q 'net.kovidgoyal.kitty'; then
    osascript -e 'tell application "Finder" to set visible of process "kitty" to true'
  else
    osascript -e 'tell application "Finder" to set visible of process "kitty" to false'
  fi
else
  open -a kitty
fi