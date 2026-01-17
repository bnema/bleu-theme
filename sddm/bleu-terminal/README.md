# Bleu Terminal - SDDM Theme

A terminal/CRT-inspired SDDM login theme using the Bleu color palette. Features retro computing aesthetics with modern polish including scanline effects, subtle glow, monospace typography, and command-line styling.

## Screenshots

*Coming soon*

## Features

- Deep navy background with subtle scanline overlay
- Username input styled as a command prompt
- Password field with blinking cursor
- Cyan accents for focus states
- Session selector styled as terminal dropdown
- Power menu with terminal-style buttons
- Caps Lock and Num Lock indicators
- Configurable effects (scanlines, glow, animations)

## Requirements

- SDDM (Qt6 version recommended)
- A monospace font (JetBrains Mono, Fira Code, or system monospace)

## Installation

### Arch Linux

```bash
# Clone or copy the theme
sudo cp -r bleu-terminal /usr/share/sddm/themes/

# Edit SDDM configuration
sudo nano /etc/sddm.conf.d/theme.conf
```

Add or modify:

```ini
[Theme]
Current=bleu-terminal
```

### Manual Installation

1. Copy the theme directory to SDDM themes folder:

```bash
sudo cp -r bleu-terminal /usr/share/sddm/themes/
```

2. Configure SDDM to use the theme:

```bash
# Create config directory if needed
sudo mkdir -p /etc/sddm.conf.d

# Create theme configuration
echo "[Theme]
Current=bleu-terminal" | sudo tee /etc/sddm.conf.d/theme.conf
```

3. Restart SDDM or reboot:

```bash
sudo systemctl restart sddm
```

## Testing

Test the theme without restarting SDDM:

```bash
sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/bleu-terminal/
```

Or if using Qt5 SDDM:

```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/bleu-terminal/
```

## Configuration

Edit `theme.conf` to customize the theme:

| Option | Default | Description |
|--------|---------|-------------|
| `Background` | `#050a14` | Background color |
| `Font` | `monospace` | Font family |
| `FontSize` | `14` | Base font size |
| `ClockFormat` | `yyyy-MM-dd HH:mm:ss` | Clock display format |
| `EnableScanlines` | `true` | Show scanline overlay |
| `ScanlinesOpacity` | `0.03` | Scanline effect opacity |
| `EnableGlow` | `true` | Enable text glow effects |
| `GlowRadius` | `8` | Glow effect radius |
| `EnableCursorBlink` | `true` | Enable blinking cursor |
| `CursorBlinkInterval` | `530` | Cursor blink speed (ms) |

## Color Palette

The theme uses the Bleu color palette:

| Element | Color |
|---------|-------|
| Background | `#050a14` |
| Input Background | `#0a1018` |
| Primary Text | `#e0ecf4` |
| Dimmed Text | `#708090` |
| Accent (Cyan) | `#00d4ff` |
| Button | `#5588cc` |
| Error | `#A167A5` |
| Success | `#99FFE4` |

## Troubleshooting

### Theme not appearing

1. Verify the theme is installed:
```bash
ls /usr/share/sddm/themes/bleu-terminal/
```

2. Check SDDM configuration:
```bash
cat /etc/sddm.conf.d/theme.conf
```

3. Check SDDM logs:
```bash
journalctl -u sddm -b
```

### QML errors

Ensure you have Qt6 QML components installed:

```bash
# Arch Linux
sudo pacman -S qt6-declarative

# Debian/Ubuntu
sudo apt install qml6-module-qtquick qml6-module-qtquick-controls
```

### Font issues

Install a monospace font if characters appear incorrectly:

```bash
# Arch Linux
sudo pacman -S ttf-jetbrains-mono

# Debian/Ubuntu
sudo apt install fonts-jetbrains-mono
```

## File Structure

```
bleu-terminal/
├── Main.qml              # Main login interface
├── metadata.desktop      # Theme metadata
├── theme.conf            # Configuration
├── Components/
│   ├── Input.qml         # Text input component
│   ├── Button.qml        # Terminal-style button
│   ├── SessionButton.qml # Session selector
│   ├── Clock.qml         # Digital clock
│   └── PowerMenu.qml     # Power options
├── Assets/               # (Optional assets)
└── Fonts/                # (Optional custom fonts)
```

## License

Part of the Bleu Theme project. See main repository for license details.
