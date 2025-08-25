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

## 📁 Files

- **`styles.css`** - Complete CSS framework with design tokens and components
- **`docs/index.html`** - Interactive style guide showcasing all components
- **`templates/githubpages.html`** - Clean template for GitHub Pages
- **`docs/install.sh`** - Installer script for easy setup
- **`README.md`** - Documentation and usage instructions

## 🚀 Quick Start

### npm Package Installation (Recommended)

The modern way to add the Nord theme to any project:

```bash
npm install @glassc/personal-styles
```

Then import in your project:

```javascript
// Import the full CSS framework
import '@glassc/personal-styles/styles.css';

// Or import the minified version
import '@glassc/personal-styles/styles.min.css';
```

```html
<!-- Or link directly in HTML -->
<link rel="stylesheet" href="node_modules/@glassc/personal-styles/styles.css" />
```

### One-Command Installation (Legacy)

The shell script installation is still available:

```bash
curl -fsSL https://styles.chrisglass.dev/install.sh | sh
```

This will:

- Download the latest CSS file
- Optionally create a ready-to-use `index.html` with theme toggle
- Automatically detect your project structure and suggest the best directory
- Update file paths to match your setup

### Manual Installation

### For Astro Projects

**Using npm (Recommended):**

```bash
npm install @glassc/personal-styles
```

```astro
---
// src/layouts/Layout.astro
import '@glassc/personal-styles/styles.css';
---
```

**Manual Installation:**

1. Copy `styles.css` to your `public/` directory
2. Import in your layout component with theme support:

```astro
---
// src/layouts/Layout.astro
---
<html lang="en">
  <head>
    <link rel="stylesheet" href="/styles.css">
  </head>
  <body>
    <div class="container">
      <!-- Optional: Add theme toggle -->
      <button class="theme-toggle" id="themeToggle" aria-label="Toggle theme">
        <svg class="moon-icon" viewBox="0 0 24 24">
          <path d="M21.75 12.79A9 9 0 1111.21 2.25 7 7 0 0021.75 12.79z"/>
        </svg>
        <svg class="sun-icon" viewBox="0 0 24 24">
          <circle cx="12" cy="12" r="5"/>
          <path d="M12 1v2m0 18v2M4.22 4.22l1.42 1.42m12.72 12.72l1.42 1.42M1 12h2m18 0h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"/>
        </svg>
      </button>

      <slot />
    </div>

    <!-- Theme toggle script -->
    <script>
      const themeToggle = document.getElementById('themeToggle');
      if (themeToggle) {
        // Theme switching logic here
      }
    </script>
  </body>
</html>
```

### For GitHub Pages

**Using npm (Recommended):**

```bash
npm install @glassc/personal-styles
```

For Jekyll sites, create `_includes/styles.html`:

```html
<link
  rel="stylesheet"
  href="{{ '/node_modules/@glassc/personal-styles/styles.css' | relative_url }}"
/>
```

**Manual Installation:**

1. Copy `styles.css` to your `assets/css/` directory
2. Add to your `_layouts/default.html`:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <link
      rel="stylesheet"
      href="{{ '/assets/css/styles.css' | relative_url }}"
    />
  </head>
  <body>
    <div class="container">
      <!-- Theme toggle button -->
      <button
        class="theme-toggle"
        onclick="toggleTheme()"
        aria-label="Toggle theme"
      >
        <svg class="moon-icon" viewBox="0 0 24 24">
          <path d="M21.75 12.79A9 9 0 1111.21 2.25 7 7 0 0021.75 12.79z" />
        </svg>
        <svg class="sun-icon" viewBox="0 0 24 24">
          <circle cx="12" cy="12" r="5" />
          <path
            d="M12 1v2m0 18v2M4.22 4.22l1.42 1.42m12.72 12.72l1.42 1.42M1 12h2m18 0h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"
          />
        </svg>
      </button>

      {{ content }}
    </div>

    <script>
      function toggleTheme() {
        const html = document.documentElement;
        const currentTheme = html.getAttribute('data-theme');
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        html.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
      }

      // Set initial theme
      const savedTheme = localStorage.getItem('theme');
      const systemPrefersDark = window.matchMedia(
        '(prefers-color-scheme: dark)'
      ).matches;
      document.documentElement.setAttribute(
        'data-theme',
        savedTheme || (systemPrefersDark ? 'dark' : 'light')
      );
    </script>
  </body>
</html>
```

## 🎯 Design Tokens

### Light Mode Colors (Nord Snow Storm)

```css
:root {
  --color-primary: #5e81ac; /* Nord Frost - darker blue */
  --color-background: #eceff4; /* Nord Snow Storm - brightest */
  --color-text-primary: #2e3440; /* Nord Polar Night - darkest */
  --color-text-secondary: #434c5e; /* Nord Polar Night - medium */
  --color-border: #d8dee9; /* Nord Snow Storm - medium */
}
```

### Dark Mode Colors (Nord Polar Night)

```css
@media (prefers-color-scheme: dark) {
  :root {
    --color-primary: #88c0d0; /* Nord Frost - light blue */
    --color-background: #2e3440; /* Nord Polar Night - darkest */
    --color-text-primary: #e5e9f0; /* Nord Snow Storm - bright */
    --color-text-secondary: #d8dee9; /* Nord Snow Storm - medium */
    --color-border: #434c5e; /* Nord Polar Night - light */
  }
}
```

### Typography

```css
--font-family-primary: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
  sans-serif;
--font-size-base: 1rem; /* 16px */
--font-size-lg: 1.125rem; /* 18px */
--font-size-xl: 1.5rem; /* 24px */
--font-size-2xl: 2rem; /* 32px */
```

### Spacing

```css
--spacing-xs: 0.5rem; /* 8px */
--spacing-sm: 1rem; /* 16px */
--spacing-md: 1.5rem; /* 24px */
--spacing-lg: 2rem; /* 32px */
--spacing-xl: 3rem; /* 48px */
```

## 🧱 Components

### Buttons

```html
<button class="btn btn-primary">Primary Button</button>
<button class="btn btn-secondary">Secondary Button</button>
<button class="btn btn-ghost">Ghost Button</button>
```

### Cards

```html
<div class="card">
  <div class="card-header">
    <div class="card-title">Card Title</div>
    <div class="card-meta">Metadata</div>
  </div>
  <div class="card-content">
    <p>Card content goes here...</p>
  </div>
</div>
```

### Navigation

```html
<nav class="nav">
  <a href="#" class="nav-brand">Brand</a>
  <ul class="nav-links">
    <li><a href="#" class="nav-link active">Home</a></li>
    <li><a href="#" class="nav-link">About</a></li>
  </ul>
</nav>
```

### Grid System

```html
<div class="grid grid-cols-3 gap-md">
  <div>Column 1</div>
  <div>Column 2</div>
  <div>Column 3</div>
</div>
```

## 🎨 Utility Classes

### Typography

- `.text-xs`, `.text-sm`, `.text-base`, `.text-lg`, `.text-xl`, `.text-2xl`, `.text-3xl`
- `.font-normal`, `.font-medium`, `.font-semibold`, `.font-bold`
- `.text-primary`, `.text-secondary`, `.text-muted`

### Spacing

- Margin: `.m-xs`, `.m-sm`, `.m-md`, `.m-lg`, `.m-xl`
- Padding: `.p-xs`, `.p-sm`, `.p-md`, `.p-lg`, `.p-xl`
- Specific sides: `.mt-sm`, `.mb-lg`, `.pt-md`, etc.

### Layout

- `.container` - Responsive container with max-width
- `.grid` - CSS Grid container
- `.grid-cols-1`, `.grid-cols-2`, `.grid-cols-3`, `.grid-cols-4`
- `.flex`, `.flex-col`, `.items-center`, `.justify-between`

## 📱 Responsive Design

The framework uses a mobile-first approach with these breakpoints:

- **Small**: 640px and down
- **Medium**: 768px and down
- **Large**: 1024px and down

Responsive utilities:

- `.sm:hidden` - Hide on small screens
- `.md:text-center` - Center text on medium screens and down

## 🌙 Theme Switching

### Automatic Theme Detection

The style guide automatically detects your system's color scheme preference:

```css
/* Automatically switches based on system preference */
@media (prefers-color-scheme: dark) {
  :root {
    /* Nord dark colors applied */
  }
}
```

### Manual Theme Toggle

Add a theme toggle button to your site:

```html
<button class="theme-toggle" id="themeToggle" aria-label="Toggle theme">
  <svg class="moon-icon" viewBox="0 0 24 24">
    <path d="M21.75 12.79A9 9 0 1111.21 2.25 7 7 0 0021.75 12.79z" />
  </svg>
  <svg class="sun-icon" viewBox="0 0 24 24">
    <circle cx="12" cy="12" r="5" />
    <path
      d="M12 1v2m0 18v2M4.22 4.22l1.42 1.42m12.72 12.72l1.42 1.42M1 12h2m18 0h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"
    />
  </svg>
</button>

<script>
  const themeToggle = document.getElementById('themeToggle');
  const html = document.documentElement;

  function toggleTheme() {
    const currentTheme = html.getAttribute('data-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    html.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
  }

  themeToggle.addEventListener('click', toggleTheme);
</script>
```

## 🎨 Customization

All design tokens are defined as CSS custom properties, making customization easy:

```css
/* Override default colors */
:root {
  --color-primary: #your-brand-color;
  --font-family-primary: 'Your Font', sans-serif;
}

/* Custom dark mode colors */
[data-theme='dark'] {
  --color-primary: #your-dark-accent;
  --color-background: #your-dark-bg;
}
```

## 📖 Examples

### Blog Post Layout

```html
<article class="container mt-xl">
  <header class="mb-lg">
    <h1 class="text-3xl font-bold mb-sm">Article Title</h1>
    <div class="text-secondary">January 15, 2024 • 5 min read</div>
  </header>

  <div class="prose">
    <p>Article content with proper typography...</p>
  </div>
</article>
```

### Project Grid

```html
<div class="container">
  <div class="grid grid-cols-3 gap-md">
    <div class="card">
      <div class="card-title">Project Name</div>
      <div class="card-content">
        <p>Project description...</p>
      </div>
      <div class="card-footer">
        <a href="#" class="btn btn-primary btn-sm">View Project</a>
      </div>
    </div>
    <!-- More project cards... -->
  </div>
</div>
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
npm install @glassc/personal-styles
```

The package includes:

- **styles.css** - Full CSS framework with design tokens
- **styles.min.css** - Minified version for production
- Automatic version management with semantic versioning
- Easy integration with build tools and bundlers

`

## 📄 License

This style guide is provided as-is for personal and educational use. Please respect Ghost's original theme license when using these adapted styles.

## 🔗 Links

- [View Style Guide](https://styles.chrisglass.dev) - Interactive component showcase with theme toggle
- [Nord Color Palette](https://www.nordtheme.com/) - Unified color system
- [Ghost Journal Theme](https://ghost.org/themes/journal/) - Design pattern inspiration
- [GitHub Pages Documentation](https://docs.github.com/en/pages) - For GitHub Pages setup
