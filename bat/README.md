# Bleu Theme for Bat

A sophisticated dark theme with a cool blue color palette for [bat](https://github.com/sharkdp/bat) - a cat clone with syntax highlighting.

## Installation

### Step 1: Copy the theme file

```bash
mkdir -p "$(bat --config-dir)/themes"
cp bleu.tmTheme "$(bat --config-dir)/themes/"
```

### Step 2: Rebuild the bat cache

```bash
bat cache --build
```

### Step 3: Verify installation

```bash
bat --list-themes | grep Bleu
```

You should see "Bleu" in the list of available themes.

## Usage

### Temporary usage

```bash
bat --theme=Bleu file.txt
```

### Set as default theme

Add to your bat configuration file (`bat --config-file` to find location):

```bash
--theme="Bleu"
```

Or set via environment variable in your shell config (.bashrc, .zshrc, etc.):

```bash
export BAT_THEME="Bleu"
```

### Preview with fzf

```bash
bat --list-themes | fzf --preview="bat --theme={} --color=always /path/to/file"
```

## Color Palette

- **Background**: `#050a14` (Deep Navy)
- **Foreground**: `#e8f4f8` (Primary Text)
- **Keywords**: `#00d4ff` (Bright Cyan)
- **Strings**: `#87ceeb` (Light Sky Blue)
- **Functions**: `#fefefe` (Pure White, bold)
- **Types**: `#5588cc` (Pure Blue)
- **Numbers**: `#4a7ba7` (Sky Blue)
- **Comments**: `#708090` (Dimmed Text, italic)
- **Errors**: `#ff6b8a` (Soft Red)
- **Added**: `#99FFE4` (Success Green)

## Uninstallation

```bash
rm "$(bat --config-dir)/themes/bleu.tmTheme"
bat cache --build
```
