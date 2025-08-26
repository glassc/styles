# Personal Style Guide

A clean, modern design system using the [Nord color palette](https://www.nordtheme.com/) for both light and dark themes, with layout and typography patterns inspired by Ghost's [Journal theme](https://ghost.org/themes/journal/). This style guide provides a comprehensive CSS framework with automatic theme switching for building consistent, beautiful websites and GitHub Pages.

## 🎨 Design Philosophy

This style guide creates visual harmony through consistent color relationships:

- **Unified Palette**: Nord colors for both light and dark themes
- **Light Mode**: Nord Snow Storm palette (light grays and blues)
- **Dark Mode**: Nord Polar Night palette (dark grays and blues)
- **Automatic Switching**: Respects system preferences with manual override
- **Consistent Spacing**: 8px-based scale for harmonious layouts
- **Responsive Design**: Mobile-first approach with flexible components

## 🚀 Quick Start

### npm Package Installation (Recommended)

The modern way to add the Nord theme to any project:

```bash
npm install @glassc/styles
```

Then import in your project:

```javascript
// Import the full CSS framework
import '@glassc/styles/styles.css';

// Or import the minified version
import '@glassc/styles/styles.min.css';
```

```html
<!-- Or link directly in HTML -->
<link rel="stylesheet" href="node_modules/@glassc/styles/styles.css" />
```

### For GitHub Pages

**Using npm (Recommended):**

```bash
npm install @glassc/styles
```

```html
<link
  rel="stylesheet"
  href="{{ '/node_modules/@glassc/styles/styles.css' | relative_url }}"
/>
```

## 🙏 Attribution

This style guide combines elements from two excellent design systems:

**Colors:** [Nord color palette](https://www.nordtheme.com/)

- Arctic-inspired color scheme for both light and dark themes
- Harmonious blues and neutral grays
- Snow Storm palette (light theme) and Polar Night palette (dark theme)
- **Documentation:** [nordtheme.com](https://www.nordtheme.com/)

**Design Patterns:** Inspired by Ghost's [Journal theme](https://ghost.org/themes/journal/)

- Clean typography and minimal aesthetic
- Layout patterns and component design
- Responsive grid systems and spacing
- **Demo:** [journal.ghost.io](https://journal.ghost.io)

Both design systems have been harmoniously combined and reimplemented for use with Astro and GitHub Pages.

## 🚀 Distribution

This theme is available through multiple distribution methods:

### npm Package (Recommended)

```bash
npm install @glassc/styles
```

The package includes:

- **styles.css** - Full CSS framework with design tokens
- **styles.min.css** - Minified version for production

`

## 📄 License

This style guide is provided as-is for personal and educational use. Please respect Ghost's original theme license when using these adapted styles.

## 🔗 Links

- [View Style Guide](https://styles.chrisglass.dev) - Interactive component showcase with theme toggle
- [Nord Color Palette](https://www.nordtheme.com/) - Unified color system
- [Ghost Journal Theme](https://ghost.org/themes/journal/) - Design pattern inspiration
