# Make it easy to resize undecorated windows
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['<Super>BackSpace']"

# For keyboards that only have a start/stop button for music, like Logitech MX Keys Mini
# gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Shift>AudioPlay']"

# # Full-screen with title/navigation bar
# gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift>F11']"

# Use 6 fixed workspaces instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 7

# Use super for workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Alt>z']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Alt>x']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Alt>c']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Alt>a']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Alt>s']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Alt>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Alt>v']"

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Alt><Shift>z']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Alt><Shift>x']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Alt><Shift>c']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Alt><Shift>a']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Alt><Shift>s']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Alt><Shift>d']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Alt><Shift>v']"


#
# # Use alt for pinned apps
# gsettings set org.gnome.shell.keybindings switch-to-application-1 "['<Alt>1']"
# gsettings set org.gnome.shell.keybindings switch-to-application-2 "['<Alt>2']"
# gsettings set org.gnome.shell.keybindings switch-to-application-3 "['<Alt>3']"
# gsettings set org.gnome.shell.keybindings switch-to-application-4 "['<Alt>4']"
# gsettings set org.gnome.shell.keybindings switch-to-application-5 "['<Alt>5']"
# gsettings set org.gnome.shell.keybindings switch-to-application-6 "['<Alt>6']"
# gsettings set org.gnome.shell.keybindings switch-to-application-7 "['<Alt>7']"
# gsettings set org.gnome.shell.keybindings switch-to-application-8 "['<Alt>8']"
# gsettings set org.gnome.shell.keybindings switch-to-application-9 "['<Alt>9']"


# Reserve slots for custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/']"

# Set flameshot (with the sh fix for starting under Wayland) on alternate print screen key
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Flameshot'
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'sh -c -- "flameshot gui"'
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Control>Print'

# Start a new alacritty window (rather than just switch to the already open one)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'alacritty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'alacritty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Shift><Alt>2'

