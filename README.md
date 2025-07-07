# Polybar Configuration for Ubuntu

This README provides instructions for installing and setting up a Polybar configuration on Ubuntu. The provided configuration includes a customizable status bar with modules for i3, date, CPU, memory, filesystem, battery, and network status. Other modules and things around will be added later on... :)

## Prerequisites

Before installing Polybar, ensure you have the following:

- Ubuntu (tested on 20.04 and later)
- i3 window manager (optional, for i3 module support)
- `font-awesome` and a Nerd Font (e.g., JetBrainsMono Nerd Font) for icons
- Basic terminal knowledge

## Installation

1. **Install Polybar**:
   Update your package list and install Polybar:
   ```bash
   sudo apt update
   sudo apt install polybar
   ```
2. **Install Dependencies**:
   Install required fonts and tools for the configuration:

   ```bash
   sudo apt install fontconfig fonts-font-awesome
   ```

3. **Install Nerd Fonts**:
   Download and install JetBrainsMono Nerd Font for icon support:
   ```bash
   wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
   unzip JetBrainsMono.zip -d ~/.fonts
   fc-cache -fv
   ```

## Setup

1. **Copy Configuration Files**:
   Create a Polybar configuration directory and copy the provided config.ini and launch.sh files:
   ```bash
   mkdir -p ~/.config/polybar
   cp config.ini ~/.config/polybar/config.ini
   cp launch.sh ~/.config/polybar/launch.sh
   ```
2. **Make launch.sh Executable**:
   Set execute permissions for the launch script:

   ```bash
   chmod +x ~/.config/polybar/launch.sh

   ```

3. **Integrate with i3 (Optional)**:
   If using i3, add the following line to your i3 configuration file (~/.config/i3/config) to launch Polybar automatically:

   ```bash
   exec --no-startup-id ~/.config/polybar/launch.sh
   ```

4. **Launch Polybar**:
   Run the launch script to start Polybar:

   ```bash
   ~/.config/polybar/launch.sh
   ```

## Configuration Details

The `config.ini` file defines a single bar (`main`) with:

### Modules

- **i3**: Displays workspace information (requires i3).
- **date**: Shows the current date and time.
- **cpu**: Displays CPU usage percentage and opens `htop` on click.
- **memory1**: Shows memory usage percentage.
- **fs-root**: Displays free space on the root filesystem.
- **battery**: Shows battery status with charging/discharging animations.
- **network-ethernet**: Indicates Ethernet connection status.
- **network-wifi**: Shows Wi-Fi signal strength and connection status.

### Appearance

- Uses a Gruvbox-inspired color scheme.
- Fonts: JetBrainsMono Nerd Font and FontAwesome for icons.
- Bar is positioned at the top with a system tray on the right.

## Customization

- **Edit `config.ini`**: Modify `~/.config/polybar/config.ini` to adjust colors, modules, or layouts. For example, change `interface` in `[module/network-ethernet]` or `[module/network-wifi]` to match your network interfaces (`enp2s0` or `wlo1`).
- **Add/Remove Modules**: Update `modules-left`, `modules-center`, or `modules-right` in `[bar/main]` to rearrange or add new modules.
- **Fonts**: Replace `font-0` or `font-1` in `[bar/main]` with other Nerd Fonts if desired.

## Troubleshooting

- **Polybar not starting**: Check the log file at `/tmp/polybar.log` for errors:
  ```bash
  cat /tmp/polybar.log
  ```
