# Package List

Complete list of packages installed by the setup script with descriptions and purposes.

## Table of Contents

- [Essential Packages](#essential-packages)
- [Window Manager & Wayland](#window-manager--wayland)
- [Terminal Applications](#terminal-applications)
- [Desktop Applications](#desktop-applications)
- [Audio System](#audio-system)
- [System Utilities](#system-utilities)
- [Theming & Fonts](#theming--fonts)
- [Development Tools](#development-tools)
- [Graphics & Drivers](#graphics--drivers)
- [Gaming](#gaming)
- [Communication](#communication)
- [Archive Tools](#archive-tools)
- [Text Editors](#text-editors)
- [Miscellaneous](#miscellaneous)

## Essential Packages

### base-devel
**Purpose**: Essential development tools and build utilities  
**Why**: Required for compiling packages from AUR and building software  
**Size**: ~200 MB  
**Components**: gcc, make, autoconf, automake, pkg-config, and more

### git
**Purpose**: Version control system  
**Why**: Required for cloning repositories and managing dotfiles  
**Size**: ~30 MB  
**Usage**: `git clone`, `git pull`, `git commit`

---

## Window Manager & Wayland

### swayfx
**Purpose**: Enhanced fork of Sway with visual effects  
**Why**: Main window manager with blur, shadows, and rounded corners  
**Size**: ~5 MB  
**Features**: All Sway features plus visual effects  
**Alternative**: `sway` (vanilla version)

### swayidle
**Purpose**: Idle management daemon for Sway  
**Why**: Automatic screen locking and power management  
**Size**: ~50 KB  
**Usage**: Locks screen after inactivity, manages DPMS

### swaybg
**Purpose**: Wallpaper utility for Sway  
**Why**: Sets static backgrounds (alternative to swww)  
**Size**: ~20 KB  
**Note**: This setup primarily uses `swww` instead

### waybar
**Purpose**: Highly customizable status bar for Wayland  
**Why**: Main system status bar with modules for CPU, memory, network, etc.  
**Size**: ~2 MB  
**Config**: `~/.config/waybar/`

### waypaper
**Purpose**: GUI wallpaper setter for Wayland  
**Why**: User-friendly interface for changing wallpapers  
**Size**: ~5 MB  
**Usage**: `waypaper`

### wl-clipboard
**Purpose**: Wayland clipboard utilities  
**Why**: Copy/paste functionality in Wayland (wl-copy, wl-paste)  
**Size**: ~100 KB  
**Usage**: `wl-copy`, `wl-paste`

### cliphist
**Purpose**: Clipboard history manager  
**Why**: Stores and retrieves clipboard history  
**Size**: ~3 MB  
**Keybinding**: `Mod+Shift+v`

### autotiling-rs
**Purpose**: Automatic tiling layout manager  
**Why**: Intelligently switches between horizontal/vertical splits  
**Size**: ~1 MB  
**Language**: Rust (fast and efficient)

### swaync (SwayNotificationCenter)
**Purpose**: Notification daemon and control center  
**Why**: Manages desktop notifications with a control center  
**Size**: ~2 MB  
**Keybinding**: `Mod+Shift+n`

### swayosd
**Purpose**: On-screen display for volume and brightness  
**Why**: Visual feedback for volume/brightness changes  
**Size**: ~500 KB  
**Usage**: Shows OSD when using media keys

### swayimg
**Purpose**: Image viewer for Sway  
**Why**: Fast image viewing with Wayland support  
**Size**: ~200 KB  
**Usage**: `swayimg image.jpg`

### sway-contrib
**Purpose**: Collection of community scripts for Sway  
**Why**: Additional utilities and helper scripts  
**Size**: ~100 KB  
**Contents**: grimshot, inactive-windows-transparency, etc.

### grim
**Purpose**: Screenshot utility for Wayland  
**Why**: Captures screenshots in Wayland  
**Size**: ~50 KB  
**Usage**: `grim screenshot.png`

### slurp
**Purpose**: Region selector for Wayland  
**Why**: Select screen areas for screenshots  
**Size**: ~30 KB  
**Usage**: Used with grim for area screenshots

### wofi
**Purpose**: Alternative launcher for Wayland  
**Why**: Backup launcher option (primary is Fuzzel)  
**Size**: ~100 KB  
**Note**: Fuzzel is the default launcher

---

## Terminal Applications

### wezterm
**Purpose**: GPU-accelerated terminal emulator  
**Why**: Primary terminal with excellent features and customization  
**Size**: ~30 MB  
**Features**: Tabs, splits, ligatures, image protocol  
**Config**: `~/.config/wezterm/wezterm.lua`

### fuzzel
**Purpose**: Application launcher for Wayland  
**Why**: Fast, lightweight launcher with fuzzy search  
**Size**: ~100 KB  
**Keybinding**: `Mod+d`

### bat
**Purpose**: Enhanced `cat` with syntax highlighting  
**Why**: Better file viewing in terminal  
**Size**: ~3 MB  
**Usage**: `bat file.txt`

### alacritty
**Purpose**: GPU-accelerated terminal emulator  
**Why**: Alternative terminal option  
**Size**: ~5 MB  
**Features**: Very fast, minimal

### foot
**Purpose**: Fast, lightweight terminal for Wayland  
**Why**: Another terminal alternative  
**Size**: ~500 KB  
**Features**: Minimal resource usage

### eza
**Purpose**: Modern replacement for `ls`  
**Why**: Better file listing with colors and icons  
**Size**: ~2 MB  
**Usage**: `eza -la`

### zsh
**Purpose**: Z Shell  
**Why**: Enhanced shell with better features than bash  
**Size**: ~3 MB  
**Features**: Better completion, themes, plugins

### oh-my-posh
**Purpose**: Prompt theme engine  
**Why**: Beautiful, customizable shell prompts  
**Size**: ~10 MB  
**Features**: Shows git status, time, path, etc.

---

## Desktop Applications

### brave-bin
**Purpose**: Privacy-focused web browser  
**Why**: Primary web browser with built-in ad blocking  
**Size**: ~300 MB  
**Features**: Chromium-based, crypto wallet, shields  
**Keybinding**: `Mod+o`

### nemo (and plugins)
**Purpose**: File manager  
**Why**: Feature-rich, extensible file manager  
**Size**: ~10 MB (with plugins)  
**Plugins**:
- `nemo-fileroller` - Archive support
- `nemo-python` - Python extension support
- `nemo-terminal` - Embedded terminal
- `nemo-preview` - File preview
- `nemo-seahorse` - Encryption support
- `nemo-emblems` - File emblems
- `nemo-image-converter` - Image manipulation
- `nemo-pastebin` - Share files online
- `nemo-audio-tab` - Audio file info

### firefox
**Purpose**: Web browser  
**Why**: Alternative browser, better for some websites  
**Size**: ~250 MB  
**Extensions**: `firefox-ublock-origin` (ad blocker)

### visual-studio-code-bin
**Purpose**: Code editor and IDE  
**Why**: Popular, extensible code editor  
**Size**: ~300 MB  
**Features**: Extensions, debugging, Git integration

### zed
**Purpose**: High-performance code editor  
**Why**: Fast, modern alternative to VS Code  
**Size**: ~50 MB  
**Features**: Rust-based, collaborative editing

### yazi
**Purpose**: Terminal file manager  
**Why**: Fast, vim-like file manager with preview  
**Size**: ~5 MB  
**Features**: Async I/O, image preview, customizable  
**Config**: `~/.config/yazi/`

---

## Audio System

### pipewire
**Purpose**: Modern multimedia framework  
**Why**: Handles all audio/video routing  
**Size**: ~2 MB  
**Features**: Low latency, PulseAudio/JACK compatible

### pipewire-alsa
**Purpose**: ALSA support for PipeWire  
**Why**: Compatibility with ALSA applications  
**Size**: ~50 KB

### pipewire-pulse
**Purpose**: PulseAudio compatibility layer  
**Why**: Makes PipeWire work with PulseAudio apps  
**Size**: ~100 KB

### pipewire-jack
**Purpose**: JACK compatibility layer  
**Why**: Pro audio application support  
**Size**: ~100 KB

### wireplumber
**Purpose**: Session manager for PipeWire  
**Why**: Manages audio devices and routing  
**Size**: ~500 KB

### gst-plugin-pipewire
**Purpose**: GStreamer plugin for PipeWire  
**Why**: Media application audio support  
**Size**: ~50 KB

### pavucontrol
**Purpose**: PulseAudio volume control GUI  
**Why**: Graphical audio mixer and device manager  
**Size**: ~200 KB  
**Features**: Per-app volume, device selection

### pasystray
**Purpose**: System tray icon for PulseAudio  
**Why**: Quick audio control from system tray  
**Size**: ~50 KB

---

## System Utilities

### swww
**Purpose**: Animated wallpaper daemon for Wayland  
**Why**: Smooth wallpaper transitions and animations  
**Size**: ~2 MB  
**Features**: Multiple transition effects, multi-monitor

### brightnessctl
**Purpose**: Backlight control utility  
**Why**: Adjust screen brightness  
**Size**: ~20 KB  
**Usage**: Used by brightness OSD

### networkmanager
**Purpose**: Network connection manager  
**Why**: Manages WiFi, Ethernet, VPN connections  
**Size**: ~5 MB

### networkmanager-dmenu
**Purpose**: dmenu interface for NetworkManager  
**Why**: Quick network selection  
**Size**: ~20 KB  
**Keybinding**: `Mod+Ctrl+w`

### network-manager-applet
**Purpose**: System tray applet for NetworkManager  
**Why**: GUI for network management  
**Size**: ~500 KB

### blueman
**Purpose**: Bluetooth manager  
**Why**: GUI for Bluetooth connections  
**Size**: ~2 MB

### bluez & bluez-utils
**Purpose**: Bluetooth protocol stack  
**Why**: Bluetooth support  
**Size**: ~2 MB

### iwd
**Purpose**: Wireless daemon  
**Why**: Alternative WiFi backend (faster than wpa_supplicant)  
**Size**: ~500 KB

### wireless_tools
**Purpose**: Wireless network utilities  
**Why**: iwconfig, iwlist, and other WiFi tools  
**Size**: ~100 KB

### xdg-utils
**Purpose**: Desktop integration utilities  
**Why**: Open files with default applications  
**Size**: ~100 KB  
**Usage**: `xdg-open file.pdf`

### htop
**Purpose**: Interactive process viewer  
**Why**: System monitoring and process management  
**Size**: ~500 KB  
**Usage**: `htop`

### neofetch
**Purpose**: System information tool  
**Why**: Display system info with style  
**Size**: ~100 KB  
**Usage**: `neofetch`

### bleachbit
**Purpose**: System cleaner  
**Why**: Clean cache, temporary files, free space  
**Size**: ~3 MB

### timeshift
**Purpose**: System backup and restore  
**Why**: Create system snapshots  
**Size**: ~5 MB  
**Features**: BTRFS and rsync support

### reflector
**Purpose**: Pacman mirror list updater  
**Why**: Find fastest Arch mirrors  
**Size**: ~50 KB  
**Usage**: `reflector --latest 20 --sort rate`

### dosfstools
**Purpose**: FAT filesystem utilities  
**Why**: Format and check FAT/FAT32 filesystems  
**Size**: ~200 KB

### mtools
**Purpose**: MS-DOS filesystem tools  
**Why**: Access MS-DOS disks  
**Size**: ~300 KB

### btrfs-progs
**Purpose**: Btrfs filesystem utilities  
**Why**: Manage Btrfs filesystems  
**Size**: ~2 MB

### lvm2
**Purpose**: Logical Volume Manager  
**Why**: Advanced disk management  
**Size**: ~3 MB

### smartmontools
**Purpose**: SMART disk monitoring  
**Why**: Monitor disk health  
**Size**: ~500 KB  
**Usage**: `smartctl -a /dev/sda`

### snapper
**Purpose**: Btrfs snapshot manager  
**Why**: Automated snapshot management  
**Size**: ~500 KB

### zram-generator
**Purpose**: Compressed RAM swap  
**Why**: Improve performance with compressed swap  
**Size**: ~100 KB

---

## Theming & Fonts

### Icon Themes

**adwaita-icon-theme**: Default GNOME icons (40 MB)  
**papirus-icon-theme**: Modern, colorful icon set (100 MB)

### Cursor Themes

**adwaita-cursors**: Default cursor theme (1 MB)

### GTK Themes

**breeze-gtk-theme**: KDE Breeze theme for GTK (5 MB)  
**materia-gtk-theme**: Material Design theme (10 MB)

### Fonts

**adwaita-fonts**: System UI font (1 MB)  
**otf-font-awesome**: Icon font (1 MB)  
**ttf-0xproto-nerd**: Programming font with icons (5 MB)  
**ttf-jetbrains-mono-nerd**: Primary terminal/code font (10 MB)  
**ttf-meslo-nerd**: Alternative Nerd Font (5 MB)  
**ttf-dejavu**: Standard font family (5 MB)  
**ttf-liberation**: Microsoft font replacement (2 MB)  
**noto-fonts**: Google's font family (200 MB)

### Theme Tools

**lxappearance**: GTK theme switcher (500 KB)  
**qt5ct**: Qt5 configuration tool (1 MB)  
**kvantum**: Qt theme engine (5 MB)

---

## Development Tools

### rustup
**Purpose**: Rust toolchain installer  
**Why**: Rust development and many tools written in Rust  
**Size**: Varies  
**Usage**: `rustup install stable`

### rust-analyzer
**Purpose**: Rust Language Server  
**Why**: IDE support for Rust  
**Size**: ~30 MB

### go
**Purpose**: Go programming language  
**Why**: Development and some tools written in Go  
**Size**: ~150 MB

### python
**Purpose**: Python 3 interpreter  
**Why**: Scripting and many tools require Python  
**Size**: ~50 MB

### nodejs & npm
**Purpose**: JavaScript runtime and package manager  
**Why**: Web development and many tools  
**Size**: ~50 MB

### github-cli
**Purpose**: GitHub command-line interface  
**Why**: Interact with GitHub from terminal  
**Size**: ~20 MB  
**Usage**: `gh pr list`, `gh repo clone`

---

## Graphics & Drivers

### mesa
**Purpose**: OpenGL implementation  
**Why**: 3D graphics support  
**Size**: ~50 MB

### Vulkan Drivers

**vulkan-radeon**: AMD Vulkan driver (10 MB)  
**vulkan-intel**: Intel Vulkan driver (5 MB)  
**vulkan-nouveau**: NVIDIA open-source Vulkan (5 MB)

### Video Acceleration

**libva-mesa-driver**: VA-API for Mesa (AMD/Intel) (5 MB)  
**libva-intel-driver**: VA-API for Intel (legacy) (3 MB)  
**intel-media-driver**: VA-API for modern Intel GPUs (20 MB)  
**intel-media-sdk**: Intel media SDK (10 MB)

### Xorg Drivers

**xf86-video-amdgpu**: AMD Xorg driver (1 MB)  
**xf86-video-ati**: AMD legacy Xorg driver (1 MB)  
**xf86-video-nouveau**: NVIDIA open-source Xorg (1 MB)

### Utilities

**v4l2loopback-dkms**: Virtual video device (100 KB)  
**Purpose**: Create virtual webcam for OBS, etc.

---

## Gaming

### gamemode
**Purpose**: Optimize system performance for games  
**Why**: CPU governor, process priority adjustments  
**Size**: ~200 KB  
**Usage**: Automatic when launching supported games

### gamescope
**Purpose**: Micro-compositor for games  
**Why**: Better game window management, FSR upscaling  
**Size**: ~2 MB

### steam
**Purpose**: Game distribution platform  
**Why**: Play Steam games, Proton compatibility  
**Size**: ~300 MB

### wine
**Purpose**: Windows compatibility layer  
**Why**: Run Windows applications and games  
**Size**: ~100 MB

### protonup-qt
**Purpose**: Proton version manager  
**Why**: Install and manage Proton versions for gaming  
**Size**: ~10 MB

---

## Communication

### discord
**Purpose**: Voice and text chat platform  
**Why**: Gaming and community communication  
**Size**: ~100 MB

### telegram-desktop
**Purpose**: Messaging application  
**Why**: Secure, feature-rich messaging  
**Size**: ~50 MB

### ayugram-desktop
**Purpose**: Enhanced Telegram client  
**Why**: Additional features over official client  
**Size**: ~60 MB

### vesktop
**Purpose**: Enhanced Discord client  
**Why**: Better Wayland support, additional features  
**Size**: ~120 MB

---

## Archive Tools

**zip**: Create ZIP archives (1 MB)  
**unzip**: Extract ZIP archives (500 KB)  
**p7zip**: 7-Zip for Linux (2 MB)  
**tar**: Archive utility (500 KB)  
**file-roller**: GNOME archive manager GUI (2 MB)  
**peazip**: Advanced archive manager (10 MB)

---

## Text Editors

### nvim (Neovim)
**Purpose**: Modern Vim fork  
**Why**: Primary terminal text editor  
**Size**: ~10 MB  
**Config**: `~/.config/nvim/`  
**Features**: Lua configuration, LSP support

### nano
**Purpose**: Simple terminal text editor  
**Why**: Easy to use for quick edits  
**Size**: ~500 KB

### gedit
**Purpose**: Simple GUI text editor  
**Why**: GNOME default text editor  
**Size**: ~3 MB

### vim
**Purpose**: Classic Vi editor  
**Why**: Fallback text editor  
**Size**: ~3 MB

---

## Miscellaneous

### octopi
**Purpose**: Pacman GUI frontend  
**Why**: Graphical package management  
**Size**: ~2 MB

### hyprlock
**Purpose**: Screen locker  
**Why**: Lock screen with authentication  
**Size**: ~1 MB  
**Keybinding**: `Mod+Ctrl+l`

### wmenu
**Purpose**: Dynamic menu for Wayland  
**Why**: Alternative to dmenu  
**Size**: ~50 KB

### obs-studio-browser
**Purpose**: Screen recording and streaming  
**Why**: Create content, record screen  
**Size**: ~50 MB  
**Features**: Browser source plugin included

### gimp
**Purpose**: Image manipulation program  
**Why**: Photo editing, graphic design  
**Size**: ~100 MB

### krita
**Purpose**: Digital painting application  
**Why**: Illustration and painting  
**Size**: ~150 MB

### libreoffice-still
**Purpose**: Office suite  
**Why**: Documents, spreadsheets, presentations  
**Size**: ~400 MB  
**Components**: Writer, Calc, Impress, Draw

---

## Installation Commands

### Install All Packages

Run the setup script:
```bash
~/.local/share/chezmoi/executable_arch-setup-script.sh
```

### Install Individual Package

```bash
# From official repos
sudo pacman -S package-name

# From AUR
yay -S package-name
```

### Remove Package

```bash
# Remove package only
sudo pacman -R package-name

# Remove with dependencies
sudo pacman -Rs package-name

# Remove with config files
sudo pacman -Rns package-name
```

### Check Package Information

```bash
# Local package info
pacman -Qi package-name

# Remote package info
pacman -Si package-name

# List package files
pacman -Ql package-name

# Find which package owns a file
pacman -Qo /path/to/file
```

---

## Package Categories Summary

| Category | Count | Total Size (Approx) |
|----------|-------|---------------------|
| Essential | 2 | 230 MB |
| Window Manager | 15 | 15 MB |
| Terminal Apps | 8 | 60 MB |
| Desktop Apps | 9 | 900 MB |
| Audio System | 8 | 5 MB |
| System Utilities | 24 | 30 MB |
| Theming & Fonts | 16 | 400 MB |
| Development | 6 | 300 MB |
| Graphics & Drivers | 12 | 110 MB |
| Gaming | 5 | 500 MB |
| Communication | 4 | 330 MB |
| Archive Tools | 6 | 16 MB |
| Text Editors | 4 | 17 MB |
| Miscellaneous | 7 | 700 MB |
| **Total** | **126+** | **~3.6 GB** |

---

## Recommended Optional Packages

### Media Players
```bash
yay -S mpv vlc
```

### Additional Browsers
```bash
yay -S chromium microsoft-edge-stable-bin
```

### Image Viewers
```bash
yay -S imv feh
```

### PDF Viewers
```bash
yay -S zathura zathura-pdf-mupdf evince
```

### System Monitors
```bash
yay -S btop bottom
```

### Terminal Multiplexers
```bash
yay -S tmux zellij
```

---

## Dependencies Note

Many packages have dependencies that are automatically installed. The actual number of installed packages will be higher than listed here. Use `pacman -Q | wc -l` to see your total package count.

---

For package-related issues, see [TROUBLESHOOTING.md](TROUBLESHOOTING.md) or consult the [Arch Wiki](https://wiki.archlinux.org/).
