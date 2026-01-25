# Bleu Terminal - SDDM Theme

Minimalist TTY-style SDDM login theme using the Bleu color palette. Matches the hyprlock bleu theme for a consistent login experience.

## Features

- Pure TTY aesthetic - no borders, no containers, just text
- Deep navy background (#050a14)
- Monospace typography (JetBrainsMono)
- Cyan blinking cursor accent
- Minimal session selector and power options
- Caps Lock warning

## Requirements

- SDDM
- JetBrainsMono Nerd Font (or similar monospace font)

## Installation

```bash
# Copy theme to SDDM themes folder
sudo cp -r bleu-terminal /usr/share/sddm/themes/

# Configure SDDM
sudo mkdir -p /etc/sddm.conf.d
echo "[Theme]
Current=bleu-terminal" | sudo tee /etc/sddm.conf.d/theme.conf

# Restart SDDM
sudo systemctl restart sddm
```

## Testing

```bash
sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/bleu-terminal/
```

## Layout

```
                    arch tty1

              arch login: username
              Password: ****_

session: Hyprland    [suspend] [reboot] [shutdown]    HH:MM
                                                    YYYY-MM-DD
```

## Color Palette

| Element | Color |
|---------|-------|
| Background | `#050a14` |
| Primary Text | `#e0ecf4` |
| Dimmed Text | `#708090` |
| Accent (Cyan) | `#00d4ff` |
| Error | `#A167A5` |
| Warning | `#FDBD85` |

## License

Part of the Bleu Theme project.
