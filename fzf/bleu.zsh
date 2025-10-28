#!/bin/zsh
# Bleu theme for fzf (Zsh)
# A sophisticated dark theme with a cool blue color palette

# Usage:
# Source this file in your .zshrc:
#   source ~/.config/fzf/bleu.zsh

# Color Palette:
# Background: #050a14 (Deep Navy)
# Foreground: #e8f4f8 (Primary Text)
# Selection:  #2d4a6b (Ocean Blue)
# Highlight:  #00d4ff (Bright Cyan)
# Accent:     #5588cc (Pure Blue)
# Dimmed:     #708090 (Dimmed Text)

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#e8f4f8,bg:#050a14,hl:#00d4ff
  --color=fg+:#fefefe,bg+:#0f1520,hl+:#00d4ff
  --color=info:#87ceeb,prompt:#5588cc,pointer:#00d4ff
  --color=marker:#99FFE4,spinner:#5588cc,header:#708090
  --color=border:#070c16,gutter:#050a14
  --color=query:#e8f4f8,disabled:#708090
  --color=preview-fg:#e8f4f8,preview-bg:#070c16
'
