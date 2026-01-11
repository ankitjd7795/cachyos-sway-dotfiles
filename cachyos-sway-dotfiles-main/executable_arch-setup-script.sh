#!/bin/bash

# Arch Linux Setup Script with CachyOS Repository
# 1. Adds CachyOS Repos
# 2. Reinstalls all native packages (to apply CachyOS optimizations)
# 3. Installs AUR helpers (yay/paru) from CachyOS repo
# 4. Installs user-defined packages

set -e  # Exit on any error

# Catppuccin Mocha colors
ROSEWATER="#f5e0dc"
FLAMINGO="#f2cdcd"
PINK="#f5c2e7"
MAUVE="#cba6f7"
RED="#f38ba8"
MAROON="#eba0ac"
PEACH="#fab387"
YELLOW="#f9e2af"
GREEN="#a6e3a1"
TEAL="#94e2d5"
SKY="#89dceb"
SAPPHIRE="#74c7ec"
BLUE="#89b4fa"
LAVENDER="#b4befe"
TEXT="#cdd6f4"
SUBTEXT1="#bac2de"
SUBTEXT0="#a6adc8"
OVERLAY2="#9399b2"
OVERLAY1="#7f849c"
OVERLAY0="#6c7086"
SURFACE2="#585b70"
SURFACE1="#45475a"
SURFACE0="#313244"
BASE="#1e1e2e"
MANTLE="#181825"
CRUST="#11111b"

# --- Helper Functions ---

print_status() {
    gum style \
        --border="rounded" \
        --border-foreground="$BLUE" \
        --padding="0 1" \
        --margin="1 0" \
        " $1"
}

print_success() {
    gum style \
        --border="rounded" \
        --border-foreground="$GREEN" \
        --padding="0 1" \
        --margin="1 0" \
        "✓ $1"
}

print_warning() {
    gum style \
        --border="rounded" \
        --border-foreground="$YELLOW" \
        --padding="0 1" \
        --margin="1 0" \
        "⚠ $1"
}

print_error() {
    gum style \
        --border="rounded" \
        --border-foreground="$RED" \
        --padding="0 1" \
        --margin="1 0" \
        --bold \
        "✗ $1"
}

ask_confirmation() {
    local prompt="$1"
    gum confirm "$prompt" || return 1
}

# Check for gum
if ! command -v gum >/dev/null 2>&1; then
    echo "Error: gum is not installed. Please install it first: https://github.com/charmbracelet/gum"
    exit 1
fi

if [[ $EUID -eq 0 ]]; then
   print_error "This script should not be run as root (it invokes sudo where needed)."
   exit 1
fi

# --- CachyOS Repository Functions ---

check_cachyos_repo() {
    if grep -q "^\\[cachyos\\]" /etc/pacman.conf; then
        return 0
    else
        return 1
    fi
}

add_cachyos_repo() {
    print_status "Adding CachyOS repository..."

    # Backup pacman.conf
    gum spin --spinner dot --title "Backing up pacman.conf..." -- \
        sudo cp /etc/pacman.conf "/etc/pacman.conf.backup.$(date +%Y%m%d_%H%M%S)"

    # Download installer
    if command -v curl >/dev/null 2>&1; then
        gum spin --spinner dot --title "Downloading CachyOS repository installer..." -- \
            curl -L https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
    elif command -v wget >/dev/null 2>&1; then
        gum spin --spinner dot --title "Downloading CachyOS repository installer..." -- \
            wget https://mirror.cachyos.org/cachyos-repo.tar.xz
    else
        print_error "Neither curl nor wget found."
        exit 1
    fi

    gum spin --spinner dot --title "Extracting repository files..." -- \
        tar xf cachyos-repo.tar.xz

    cd cachyos-repo || { print_error "Failed to extract cachyos-repo"; exit 1; }
    chmod +x ./cachyos-repo.sh

    print_status "Running CachyOS repository installer (sudo required)..."
    sudo ./cachyos-repo.sh

    cd ..
    rm -rf cachyos-repo cachyos-repo.tar.xz

    print_success "CachyOS repository added."
}

# --- Core Logic Functions ---

reinstall_optimized_packages() {
    print_status "Reinstalling all native packages to use CachyOS optimized versions..."
    print_warning "This might take a while depending on your internet speed."

    # Verify CachyOS repo is available
    if ! check_cachyos_repo; then
        print_error "CachyOS repository not found. Cannot optimize packages."
        return 1
    fi

    # Get list of native packages (excluding AUR/foreign)
    # We pipe this into pacman to reinstall them
    if gum spin --spinner dot --title "Reinstalling all native packages with CachyOS optimizations..." -- \
        bash -c 'pacman -Qqn | sudo pacman -S - --noconfirm --needed'; then
        print_success "All native packages reinstalled/optimized."
    else
        print_error "Failed to reinstall packages."
        exit 1
    fi
}

install_aur_helpers_from_repo() {
    print_status "Installing yay and paru from CachyOS repository..."
    # Since CachyOS repo is now added, we can just use pacman
    if gum spin --spinner dot --title "Installing yay and paru..." -- \
        sudo pacman -S --needed --noconfirm yay paru; then
        print_success "yay and paru installed."
    else
        print_error "Failed to install AUR helpers. Cannot proceed with AUR packages."
        exit 1
    fi

    # Verify yay is available
    if ! command -v yay >/dev/null 2>&1; then
        print_error "yay not found in PATH after installation."
        exit 1
    fi
}

handle_sway_conflict() {
    # CRITICAL FIX: You cannot install swayfx if sway is installed.
    # Since you are on a fresh sway install, 'sway' is likely present.
    # We must remove 'sway' to allow 'swayfx' to install.

    if pacman -Qi sway > /dev/null 2>&1; then
        print_warning "Detected 'sway' installed. Removing it to allow 'swayfx' installation..."
        # -Rdd skips dependency checks (safe here because we immediately install swayfx which provides sway)
        if gum spin --spinner dot --title "Removing standard sway..." -- \
            sudo pacman -Rdd sway --noconfirm; then
            print_success "Standard sway removed (will be replaced by swayfx)."
        else
            print_error "Failed to remove sway. swayfx installation may fail."
            return 1
        fi
    fi
}

# --- Package List ---

PACKAGES=(
    # Essential
    "base-devel"
    "git"

    # Window Manager (SwayFX)
    "swayfx"
    "swayidle" "swaybg" "waybar" "waypaper" "wl-clipboard" "cliphist"
    "autotiling-rs" "swaync" "swayosd" "swayimg" "sway-contrib"
    "grim" "slurp"

    # Terminal
    "wezterm" "fuzzel" "bat" "alacritty" "foot" "eza" "zsh" "oh-my-posh"

    # Apps
    "brave-bin" "nemo" "nemo-fileroller" "nemo-python" "nemo-terminal"
    "nemo-preview" "nemo-seahorse" "nemo-emblems" "nemo-image-converter"
    "nemo-pastebin" "nemo-audio-tab" "firefox"
    "visual-studio-code-bin" "zed" "yazi"

    # Audio/Pipewire
    "pipewire" "pipewire-alsa" "pipewire-pulse" "pipewire-jack"
    "wireplumber" "gst-plugin-pipewire" "pavucontrol" "pasystray"

    # Utilities
    "swww" "brightnessctl" "networkmanager" "networkmanager-dmenu"
    "network-manager-applet" "blueman" "bluez" "bluez-utils" "iwd"
    "wireless_tools" "xdg-utils" "htop" "neofetch" "bleachbit" "timeshift"
    "reflector" "dosfstools" "mtools" "btrfs-progs" "lvm2" "smartmontools"
    "snapper" "zram-generator"

    # Theming/Fonts
    "adwaita-icon-theme" "adwaita-cursors" "adwaita-fonts" "otf-font-awesome"
    "ttf-0xproto-nerd" "ttf-jetbrains-mono-nerd" "ttf-meslo-nerd"
    "ttf-dejavu" "ttf-liberation" "noto-fonts"
    "lxappearance" "papirus-icon-theme" "breeze-gtk-theme" "materia-gtk-theme"
    "qt5ct" "kvantum"

    # Dev Tools
    "rustup" "rust-analyzer" "go" "python" "nodejs" "npm" "github-cli"

    # Graphics/Drivers
    "mesa" "vulkan-radeon" "vulkan-intel" "vulkan-nouveau"
    "libva-mesa-driver" "libva-intel-driver" "intel-media-driver"
    "intel-media-sdk" "xf86-video-amdgpu" "xf86-video-ati"
    "xf86-video-nouveau" "v4l2loopback-dkms"

    # Gaming
    "gamemode" "gamescope" "steam" "wine" "protonup-qt"

    # Comms
    "discord" "telegram-desktop" "ayugram-desktop" "vesktop"

    # Archive tools
    "zip" "unzip" "p7zip" "tar" "peazip"

    # Editors
    "nvim"

    # Others
    "octopi" "hyprlock" "wmenu" "obs-studio-browser" "gimp" "krita" "libreoffice-still"
)

install_user_packages() {
    gum style \
        --border="double" \
        --border-foreground="$MAUVE" \
        --padding="1 2" \
        --margin="1 0" \
        --align="center" \
        --bold \
        "📦 Installing User Packages..."

    # Set Package Manager (We know yay is installed now)
    PACKAGE_MANAGER="yay"

    # Export Catppuccin Mocha colors for fzf
    export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

    print_status "Select packages to install (TAB to select, ENTER to confirm, ESC to cancel)"

    # Use fzf for package selection with multi-select
    # Print each package on a new line and pipe to fzf
    local selected_packages
    selected_packages=$(printf '%s\n' "${PACKAGES[@]}" | \
        fzf -m \
            --height 40% \
            --layout=reverse \
            --prompt="Select packages: " \
            --header="TAB: select/deselect | ENTER: confirm | ESC: cancel" \
            --border=rounded \
            --info=inline)

    # Safety check: if user hit ESC or selected nothing, exit gracefully
    if [[ -z "$selected_packages" ]]; then
        print_warning "No packages selected. Skipping installation."
        return 0
    fi

    # Convert selected packages into an array
    local packages_to_install=()
    while IFS= read -r pkg; do
        packages_to_install+=("$pkg")
    done <<< "$selected_packages"

    print_status "Installing ${#packages_to_install[@]} selected package(s)..."

    # Run installation inside spinner, capturing ALL output to log file
    if gum spin --spinner dot --title "Installing packages (this may take a while)..." -- \
        bash -c "$PACKAGE_MANAGER -S --needed --noconfirm \"\${@}\" &> /tmp/arch_install.log" _ "${packages_to_install[@]}"; then
        gum style \
            --border="rounded" \
            --border-foreground="$GREEN" \
            --padding="1 2" \
            --margin="1 0" \
            --align="center" \
            --bold \
            "SUCCESS: All packages installed successfully!"
        print_success "Log saved to /tmp/arch_install.log"
    else
        # Installation failed - display the error log immediately
        gum style \
            --border="rounded" \
            --border-foreground="$RED" \
            --padding="1 2" \
            --margin="1 0" \
            --align="center" \
            --bold \
            "INSTALLATION FAILED"

        print_error "Installation failed. Error log contents:"

        # Display the log file with a red border for easy reading
        gum style \
            --border="rounded" \
            --border-foreground="$RED" \
            --padding="1 1" \
            --margin="1 0" \
            "$(cat /tmp/arch_install.log)"

        print_error "Full log saved to /tmp/arch_install.log"
        return 1
    fi
}

# --- Main Execution ---

main() {
    gum style \
        --border="double" \
        --border-foreground="$ROSEWATER" \
        --padding="1 2" \
        --margin="1 0" \
        --align="center" \
        --bold \
        "🚀 Arch Linux Setup with CachyOS"

    print_status "Starting Optimized Arch Setup..."

    # 1. Handle CachyOS Repo
    if ! check_cachyos_repo; then
        if ask_confirmation "Add CachyOS repository?"; then
            add_cachyos_repo
            gum spin --spinner dot --title "Refreshing package database..." -- \
                sudo pacman -Sy
        else
            print_warning "Skipping CachyOS repository addition."
        fi
    else
        print_success "CachyOS repo already present."
    fi

    # 2. Reinstall Native Packages (Optimize)
    if ask_confirmation "Reinstall ALL native packages (Apply CachyOS optimizations)?"; then
        reinstall_optimized_packages
    else
        print_warning "Skipping package optimization."
    fi

    # 3. Install Helpers from Repo
    if ask_confirmation "Install yay and paru AUR helpers?"; then
        install_aur_helpers_from_repo
    else
        print_warning "Skipping AUR helper installation."
        print_error "Cannot proceed without AUR helpers for package installation."
        exit 1
    fi

    # 4. Install User Packages
    if ask_confirmation "Proceed with package selection and installation?"; then
        # Handle the sway vs swayfx conflict before starting
        if ! handle_sway_conflict; then
            print_warning "Proceeding anyway, but swayfx installation may have issues."
        fi
        install_user_packages
    else
        print_warning "Skipping package installation."
    fi

    print_success "Setup Completed."
    gum style \
        --border="rounded" \
        --border-foreground="$GREEN" \
        --padding="0 1" \
        --margin="1 0" \
        "💡 Reboot is recommended to ensure all optimized binaries and drivers are loaded."
}

main "$@"
