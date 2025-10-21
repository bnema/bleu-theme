# Bleu Design System
**Version 1.0** | Design Guidelines & Color Palette Reference

A comprehensive dark theme design system built around a sophisticated blue color palette, emphasizing depth, clarity, and visual hierarchy through careful use of contrast and saturation.

---

## Table of Contents
1. [Core Philosophy](#core-philosophy)
2. [Color Palette](#color-palette)
3. [UI Component Guidelines](#ui-component-guidelines)
4. [Typography & Text Hierarchy](#typography--text-hierarchy)
5. [State Management](#state-management)
6. [Application-Specific Adaptations](#application-specific-adaptations)

---

## Core Philosophy

The Bleu design system is built on these fundamental principles:

- **Cool Blue Spectrum**: Deep navy backgrounds transitioning through ocean blues to bright cyan highlights
- **High Contrast**: Ensuring accessibility with strong contrast ratios between text and backgrounds
- **Semantic Color Usage**: Consistent meaning across all UI states (blue for primary, cyan for active, etc.)
- **Layered Depth**: Using subtle background variations to create visual hierarchy without distracting borders
- **Professional Clarity**: Clean, professional aesthetic suitable for extended coding sessions

---

## Color Palette

### Background Colors

| Name | Hex | RGB | Usage | Opacity Variants |
|------|-----|-----|-------|------------------|
| **Deep Navy** | `#050a14` | `5, 10, 20` | Primary editor/terminal background, base layer | - |
| **Dark Blue** | `#070c16` | `7, 12, 22` | Sidebar, borders, subtle dividers | - |
| **Darker Blue** | `#0a1018` | `10, 16, 24` | Floating panels, status bar, input fields | - |
| **Active Tab Blue** | `#0f1520` | `15, 21, 32` | Active tab background, highlighted sections | - |
| **Card Blue** | `#1a2332` | `26, 35, 50` | Hover states, card backgrounds | - |

**Design Notes:**
- Use Deep Navy (`#050a14`) for maximum contrast with text
- Layer backgrounds progressively: base → sidebar → panels → cards
- Avoid using more than 3 background shades in a single view

### Foreground & Text Colors

| Name | Hex | RGB | Usage | Weight |
|------|-----|-----|-------|--------|
| **Primary Text** | `#e8f4f8` | `232, 244, 248` | Main body text, active UI elements | Regular |
| **Pure White** | `#fefefe` | `254, 254, 254` | Emphasized text, selected items, function names | Bold |
| **Dimmed Text** | `#708090` | `112, 128, 144` | Comments, inactive tabs, secondary information | Regular/Italic |

**Contrast Ratios:**
- Primary Text on Deep Navy: ~14:1 (WCAG AAA)
- Pure White on Deep Navy: ~16:1 (WCAG AAA)
- Dimmed Text on Deep Navy: ~5:1 (WCAG AA)

### Accent & Interactive Colors

| Name | Hex | RGB | Usage | Context |
|------|-----|-----|-------|---------|
| **Bright Cyan** | `#00d4ff` | `0, 212, 255` | Keywords, links, active indicators, focus states | Primary action |
| **Pure Blue** | `#5588cc` | `85, 136, 204` | Types, classes, buttons, active selections | Secondary action |
| **Sky Blue** | `#4a7ba7` | `74, 123, 167` | Numbers, constants, secondary elements | Tertiary |
| **Ocean Blue** | `#2d4a6b` | `45, 74, 107` | Selections, borders, hover states | Background accent |
| **Light Sky Blue** | `#87ceeb` | `135, 206, 235` | Strings, info states, magenta terminal | Content |

**Opacity Modifiers:**
- `80` (50% opacity): Hover states, inactive selections
- `60` (37% opacity): Subtle highlights
- `40` (25% opacity): Very subtle backgrounds
- `20` (12% opacity): Barely visible overlays

### Semantic & Status Colors

| Name | Hex | RGB | Usage | Semantic Meaning |
|------|-----|-----|-------|------------------|
| **Success Green** | `#99FFE4` | `153, 255, 228` | Git additions, success states, confirmations | Positive action |
| **Soft Red** | `#ff6b8a` | `255, 107, 138` | Errors, deletions, destructive actions | Negative action |
| **Warm Orange** | `#ffb347` | `255, 179, 71` | Warnings, modified states, attention needed | Caution |

**Guidelines:**
- Reserve semantic colors strictly for their meanings
- Never use red for non-error states
- Green should indicate completion or addition only
- Orange warns but doesn't block

### Border & Divider Colors

| Name | Hex | RGB | Usage | Visual Weight |
|------|-----|-----|-------|---------------|
| **Subtle Border** | `#070c16` | `7, 12, 22` | Inactive borders, subtle dividers | Minimal |
| **Active Border** | `#5588cc` | `85, 136, 204` | Active pane borders, focused inputs | Medium |
| **Focus Border** | `#00d4ff` | `0, 212, 255` | Focus indicators, selection borders | Strong |

---

## UI Component Guidelines

### Buttons & Interactive Elements

#### Primary Button
```
Background: #5588cc (Pure Blue)
Foreground: #fefefe (Pure White)
Hover: #00d4ff (Bright Cyan)
Active: #5588cc with 80% opacity
Disabled: #708090 (Dimmed)
```

#### Secondary Button
```
Background: #2d4a6b (Ocean Blue)
Foreground: #e8f4f8 (Primary Text)
Hover: #4a7ba7 (Sky Blue)
```

#### Link/Text Button
```
Default: #00d4ff (Bright Cyan)
Hover: #5588cc (Pure Blue)
Underline: On hover only
```

### Tabs & Navigation

#### Active Tab
```
Background: #0f1520 (Active Tab Blue)
Text: #e8f4f8 (Primary Text)
Border Top: Optional #5588cc accent
```

#### Inactive Tab
```
Background: #050a14 (Deep Navy)
Text: #708090 (Dimmed Text)
Hover Background: #0a1018 (Darker Blue)
```

#### Tab Container
```
Background: #050a14 (Deep Navy)
Border: #070c16 (Dark Blue)
```

### Input Fields & Forms

#### Text Input
```
Background: #0a1018 (Darker Blue)
Foreground: #e8f4f8 (Primary Text)
Border: #070c16 (Default)
Border (Focus): #5588cc (Pure Blue)
Placeholder: #708090 (Dimmed Text)
```

#### Validation States
```
Error Background: #ff6b8a with 40 opacity (#ff6b8a40)
Error Border: #ff6b8a
Warning Background: #00d4ff with 40 opacity (#00d4ff40)
Warning Border: #00d4ff
Info Background: #87ceeb with 40 opacity (#87ceeb40)
Info Border: #87ceeb
```

### Lists & Selections

#### Active Selection
```
Background: #5588cc (Pure Blue)
Foreground: #fefefe (Pure White)
```

#### Inactive Selection
```
Background: #2d4a6b (Ocean Blue)
Foreground: #e8f4f8 (Primary Text)
```

#### Hover State
```
Background: #2d4a6b with 80 opacity (#2d4a6b80)
Foreground: #e8f4f8 (Primary Text)
```

#### Focus State
```
Background: #5588cc with 80 opacity (#5588cc80)
Foreground: #e8f4f8 (Primary Text)
```

### Panels & Containers

#### Sidebar/Navigation
```
Background: #070c16 (Dark Blue)
Foreground: #e8f4f8 (Primary Text)
Border: #070c16
Section Header Background: #0f1520
```

#### Floating Panels/Modals
```
Background: #0a1018 (Darker Blue)
Border: #070c16
Shadow: #050a14 with 80 opacity
```

#### Status Bar
```
Background: #0a1018 (Darker Blue)
Foreground: #e8f4f8 (Primary Text)
Border: #070c16
Debug State: #ff6b8a background with #fefefe text
```

### Badges & Indicators

#### Default Badge
```
Background: #5588cc (Pure Blue)
Foreground: #fefefe (Pure White)
```

#### Activity Badge
```
Background: #5588cc
Foreground: #fefefe
Shape: Circle or rounded rectangle (4px radius)
```

---

## Typography & Text Hierarchy

### Font Weights
- **Regular (400)**: Body text, standard UI elements
- **Bold (700)**: Headings, function names, emphasized elements
- **Italic**: Comments, keywords, quotations

### Hierarchy by Color

| Level | Color | Usage |
|-------|-------|-------|
| **H1 - Emphasis** | `#fefefe` (Pure White) | Function names, selected items, titles |
| **H2 - Primary** | `#e8f4f8` (Primary Text) | Body text, labels, active elements |
| **H3 - Secondary** | `#708090` (Dimmed Text) | Comments, hints, inactive elements |
| **H4 - Accent** | `#00d4ff` (Bright Cyan) | Links, keywords, interactive highlights |

---

## State Management

### Interaction States Priority

1. **Disabled** → `#708090` (overrides all)
2. **Error** → `#ff6b8a` (overrides focus/hover)
3. **Focus** → `#5588cc` or `#00d4ff` borders
4. **Hover** → Background opacity changes (+80)
5. **Active** → Background solid color
6. **Default** → Base colors

### Visual Feedback Patterns

#### On Click/Activate
- Background changes from hover to solid color
- Border color intensifies (subtle → active)

#### On Hover
- Background adds 80 opacity variant
- Text color may brighten slightly

#### On Focus
- Border changes to `#5588cc` (keyboard navigation)
- May include subtle glow effect using box-shadow

#### On Disable
- All colors shift to `#708090`
- Opacity reduced to 50%
- Cursor: not-allowed

---

## Application-Specific Adaptations

### Terminal/Console Applications
**ANSI Color Mapping:**
```
Black:   #050a14    Bright Black:   #2d4a6b
Red:     #ff6b8a    Bright Red:     #ff6b8a
Green:   #00d4ff    Bright Green:   #00d4ff
Yellow:  #ffb347    Bright Yellow:  #ffb347
Blue:    #5588cc    Bright Blue:    #5588cc
Magenta: #87ceeb    Bright Magenta: #87ceeb
Cyan:    #00d4ff    Bright Cyan:    #00d4ff
White:   #e8f4f8    Bright White:   #fefefe
```

**Cursor:**
- Color: `#5588cc`
- Text: `#e8f4f8`

**Selection:**
- Background: `#2d4a6b`
- Foreground: `#e8f4f8`

### Code Editors (VSCode, Neovim, Zed)

#### Syntax Highlighting
```
Comments:     #708090 (italic)
Keywords:     #00d4ff (italic)
Strings:      #87ceeb
Numbers:      #4a7ba7
Booleans:     #00d4ff
Functions:    #fefefe (bold)
Types/Classes: #5588cc
Operators:    #5588cc
Variables:    #e8f4f8
Constants:    #4a7ba7
```

#### Editor Features
```
Line Highlight:         #0a1018
Selection:              #2d4a6b
Find Match:             #2d4a6b
Current Find Match:     #5588cc
Cursor:                 #5588cc
Line Numbers:           #2d4a6b
Active Line Number:     #00d4ff (bold)
Indent Guides:          #2d4a6b
Active Indent Guide:    #5588cc
```

#### Git Decorations
```
Added:       #99FFE4
Modified:    #00d4ff
Deleted:     #ff6b8a
Untracked:   #87ceeb
Ignored:     #708090
Conflicting: #ff6b8a
```

### File Managers (Yazi)

#### File Type Colors
```
Directories:  #5588cc
Executables:  #99FFE4
Images:       #87ceeb
Videos/Audio: #ffb347
Archives:     #ff6b8a
Documents:    #e8f4f8
Code Files:   Varies by language
```

#### Permissions Display
```
Read (r):     #ffb347
Write (w):    #ff6b8a
Execute (x):  #00d4ff
Special (s):  #87ceeb
Directory (d): #99FFE4
```

### System Monitors (btop)

#### Graph Gradients
Use 3-color gradients for smooth transitions:

**CPU:**
```
Start:  #87ceeb
Mid:    #6bb6d6
End:    #5588cc
```

**Memory:**
```
Start:  #4a7ba7
Mid:    #5588cc
End:    #6bb6d6
```

**Network Download:**
```
Start:  #87ceeb
Mid:    #6bb6d6
End:    #5588cc
```

**Network Upload:**
```
Start:  #5588cc
Mid:    #4a7ba7
End:    #2d4a6b
```

---

## Accessibility Guidelines

### Minimum Contrast Ratios
- **Normal text**: 4.5:1 (WCAG AA)
- **Large text**: 3:1 (WCAG AA)
- **UI components**: 3:1 (WCAG AA)

### Color Blindness Considerations
- Never rely on color alone for critical information
- Use icons, patterns, or text labels alongside colors
- Test with deuteranopia and protanopia simulators
- The blue-based palette generally works well for most color vision deficiencies

### Focus Indicators
- Always visible with 3:1 contrast minimum
- Use `#5588cc` or `#00d4ff` borders
- Minimum 2px border width
- Consider adding subtle box-shadow for additional visibility

---

## Implementation Notes

### Opacity Best Practices
When using opacity variants, prefer rgba or hex with alpha:
- Hex with alpha: `#2d4a6b80` (50%)
- RGBA: `rgba(45, 74, 107, 0.5)`

### Smooth Transitions
Apply transitions to interactive elements:
```css
transition: background-color 150ms ease-in-out,
            border-color 150ms ease-in-out,
            color 100ms ease-in-out;
```

### Dark Theme Considerations
- Avoid pure black to reduce eye strain
- Use slightly lighter text on very dark backgrounds
- Add subtle depth with layered backgrounds
- Consider blur effects for floating elements (background-blur)

### Recommended Background Opacity
For applications supporting transparency:
- Editor/Terminal: 95% (`0.95`)
- Unfocused splits: 70% (`0.7`)
- Overlay modals: 90-95% (`0.9-0.95`)

---

## Design Checklist

When implementing the Bleu design system:

- [ ] Use `#050a14` as the primary background
- [ ] Use `#e8f4f8` for main text (never pure white for body text)
- [ ] Reserve `#fefefe` for emphasis and important elements
- [ ] Use `#00d4ff` for primary interactive elements
- [ ] Use `#5588cc` for secondary interactive elements
- [ ] Apply semantic colors consistently (green=success, red=error, orange=warning)
- [ ] Ensure 4.5:1 contrast ratio minimum for text
- [ ] Use opacity variants for hover states (`80` opacity)
- [ ] Add focus indicators with `#5588cc` or `#00d4ff` borders
- [ ] Layer backgrounds progressively (base → sidebar → panel → card)
- [ ] Test with keyboard navigation
- [ ] Verify color meanings are clear without relying on color alone

---

## Version History

**v1.0** - Initial release
- Core color palette defined
- UI component guidelines established
- Application-specific adaptations documented
- Accessibility guidelines included

---

**Maintained by**: bnema
**Last Updated**: 2025
**License**: MIT
