# Bleu Theme for fzf

A sophisticated dark theme with a cool blue color palette for [fzf](https://github.com/junegunn/fzf) - a command-line fuzzy finder.

## Installation

Choose the appropriate file for your shell:
- `bleu.sh` - For Bash
- `bleu.zsh` - For Zsh
- `bleu.fish` - For Fish

### Bash

Add to your `~/.bashrc`:

```bash
# Option 1: Source directly if you cloned the repo
source /path/to/bleu-theme/fzf/bleu.sh

# Option 2: Copy to config directory
mkdir -p ~/.config/fzf
cp bleu.sh ~/.config/fzf/
source ~/.config/fzf/bleu.sh
```

### Zsh

Add to your `~/.zshrc`:

```zsh
# Option 1: Source directly if you cloned the repo
source /path/to/bleu-theme/fzf/bleu.zsh

# Option 2: Copy to config directory
mkdir -p ~/.config/fzf
cp bleu.zsh ~/.config/fzf/
source ~/.config/fzf/bleu.zsh
```

### Fish

Add to your `~/.config/fish/config.fish`:

```fish
# Option 1: Source directly if you cloned the repo
source /path/to/bleu-theme/fzf/bleu.fish

# Option 2: Copy to config directory
mkdir -p ~/.config/fzf
cp bleu.fish ~/.config/fzf/
source ~/.config/fzf/bleu.fish
```

## Usage

Once sourced, the theme will be automatically applied to all fzf instances in your shell.

### Test the theme

```bash
# Basic usage
ls | fzf

# With preview (using bat)
fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"

# Search files
find . -type f | fzf
```

## Color Configuration

The theme sets the following fzf color options:

| Element | Color | Description |
|---------|-------|-------------|
| `fg` | `#e8f4f8` | Primary text color |
| `bg` | `#050a14` | Background color |
| `hl` | `#00d4ff` | Highlighted substring |
| `fg+` | `#fefefe` | Selected line text |
| `bg+` | `#0f1520` | Selected line background |
| `hl+` | `#00d4ff` | Highlighted substring (selected) |
| `info` | `#87ceeb` | Info line |
| `prompt` | `#5588cc` | Prompt |
| `pointer` | `#00d4ff` | Pointer to current line |
| `marker` | `#99FFE4` | Multi-select marker |
| `spinner` | `#5588cc` | Loading spinner |
| `header` | `#708090` | Header |
| `border` | `#070c16` | Border color |
| `gutter` | `#050a14` | Gutter |
| `query` | `#e8f4f8` | Query text |
| `disabled` | `#708090` | Disabled text |
| `preview-fg` | `#e8f4f8` | Preview text |
| `preview-bg` | `#070c16` | Preview background |

## Customization

You can modify the theme by editing the color values in the theme file, or by appending additional options to `FZF_DEFAULT_OPTS`:

```bash
# Add custom options after sourcing the theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height 60% --border"
```

## Integration with Other Tools

### bat Integration

For syntax-highlighted previews with bat:

```bash
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview 'bat --color=always --theme=Bleu --style=numbers {}'"
```

### With fzf-tab (Zsh)

If you use [fzf-tab](https://github.com/Aloxaf/fzf-tab), the theme will automatically apply to tab completions.

## Uninstallation

Remove or comment out the source line from your shell configuration file and restart your shell:

```bash
# Bash/Zsh: Comment out or remove from ~/.bashrc or ~/.zshrc
# source ~/.config/fzf/bleu.sh

# Fish: Comment out or remove from ~/.config/fish/config.fish
# source ~/.config/fzf/bleu.fish
```

Then restart your shell or run:
```bash
source ~/.bashrc  # or ~/.zshrc, or restart shell for fish
```
