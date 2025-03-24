#!/bin/bash

# Set the Flatpak ID of mpv (default is io.mpv.Mpv)
FLATPAK_ID="io.mpv.Mpv"

# Determine the mpv config directory inside the Flatpak environment
CONFIG_DIR="$HOME/.var/app/$FLATPAK_ID/config/mpv"

# The path to the mpv.conf file
CONFIG_FILE="$CONFIG_DIR/mpv.conf"

# Function to create the config directory if it doesn't exist
create_config_dir() {
  if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
    echo "Created config directory: $CONFIG_DIR"
  fi
}

# Function to set the save-position-on-quit option
set_save_on_quit() {
  if grep -q "^save-position-on-quit=" "$CONFIG_FILE"; then
    # Option already exists, update it
    sed -i "s/^save-position-on-quit=.*/save-position-on-quit=yes/" "$CONFIG_FILE"
    echo "Updated save-position-on-quit to yes in $CONFIG_FILE"
  else
    # Option doesn't exist, add it
    echo "save-position-on-quit=yes" >> "$CONFIG_FILE"
    echo "Added save-position-on-quit=yes to $CONFIG_FILE"
  fi
}

# Main script execution
create_config_dir

# Create the config file if it doesn't exist (and add a default section)
if [ ! -f "$CONFIG_FILE" ]; then
  echo "# mpv config file" > "$CONFIG_FILE"
  echo "[mpv]" >> "$CONFIG_FILE"
  echo "Created default config file: $CONFIG_FILE"
fi

# Use the set_save_on_quit function
set_save_on_quit

echo "Configuration complete."
   
