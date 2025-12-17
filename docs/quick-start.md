# Quick Start

Get up and running quickly with CachyOS Sway Dotfiles.

## Step 1: Install Dependencies

```bash
sudo pacman -S chezmoi git
```

## Step 2: Initialize Dotfiles

```bash
chezmoi init --apply https://github.com/ankitjd7795/cachyos-sway-dotfiles.git
```

## Step 3: Run Setup Script

```bash
~/.local/share/chezmoi/executable_arch-setup-script.sh
```

## Step 4: Start Sway

Log out and select Sway from your display manager, or run:

```bash
sway
```

## Next Steps

- Check out the [Keybindings](keybindings.md) reference
- Customize your setup in [Customization](customization.md)
