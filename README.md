# dotfiles

Personal dotfiles for a Catppuccin Mocha-themed CachyOS / Arch Linux Wayland desktop.

<!-- Screenshots -->
<!-- ![screenshot]() -->

---

## Stack

| Category | Tool |
|---|---|
| Window Manager | Hyprland |
| Status Bar | Waybar |
| App Launcher | Wofi |
| Session Menu | Wlogout |
| Terminal | Ghostty, Kitty |
| Shell | Fish |
| Prompt | Starship |
| Editor | Neovim (lazy.nvim) |
| File Manager | Yazi |
| System Monitor | btop |
| Wallpaper | Hyprpaper |
| Lock Screen | Hyprlock |
| Idle Daemon | Hypridle |

---

## Theme

[Catppuccin Mocha](https://github.com/catppuccin/catppuccin) applied consistently across all tools.

---

## Setup

Configs are organized with [GNU Stow](https://www.gnu.org/software/stow/) in mind. Each top-level directory mirrors the target `~/.config/` structure.

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/dotfiles ~/.dotfiles
cd ~/.dotfiles

# Stow individual configs
stow nvim
stow fish
stow starship
stow ghostty
# ... and so on
```

---

## Structure

```
dotfiles/
├── backgrounds/    # Wallpaper images
├── btop/           # System monitor
├── fish/           # Fish shell
├── ghostty/        # Ghostty terminal
├── hyprland/       # Hyprland WM + Hypridle
├── hyprlock/       # Lock screen
├── hyprmocha/      # Catppuccin Mocha palette for Hypr*
├── hyprpaper/      # Wallpaper daemon
├── kitty/          # Kitty terminal
├── nvim/           # Neovim
├── starship/       # Shell prompt
├── uwsm/           # Wayland session env vars
├── waybar/         # Status bar
├── wireplumber/    # Audio (NVIDIA HDMI fix)
├── wlogout/        # Session menu
├── wofi/           # App launcher
├── xcompose/       # Custom key sequences
└── yazi/           # File manager
```

---

## Notable Details

- **Dual 4K HDR monitors** — HDMI-A-1 (LG, 120Hz) and DP-1 (Samsung, 144Hz), different scales, separate workspace sets (1–9 / 10–12).
- **NVIDIA HDMI audio** — WirePlumber rule to keep both HDMI audio outputs active simultaneously.
- **Neovim** — LSP via Mason, autocompletion with nvim-cmp, formatting on save, Telescope, LazyGit, and OpenCode AI integration.
- **Fish + Yazi** — Custom `y` function that changes the shell's working directory when exiting Yazi.
- **Portuguese input** — `us alt-intl` keyboard layout with `cedilla` IM module and XCompose sequences.
