---
version: alpha
name: DRY R Package Development
description: >-
  Solarized Light presentation design: warm cream canvas, calibrated slate ink,
  high-contrast blue links, and Solarized accent hierarchy.
colors:
  primary: "#006dad"
  secondary: "#268bd2"
  bg-canvas: "#fdf6e3"
  bg-card: "#eee8d5"
  text: "#526971"
  muted: "#657b83"
  link: "#006dad"
  link-hover: "#00547f"
  solarized-yellow: "#b58900"
  solarized-orange: "#cb4b16"
  solarized-red: "#dc322f"
  solarized-magenta: "#d33682"
  solarized-violet: "#6c71c4"
  solarized-blue: "#268bd2"
  solarized-cyan: "#2aa198"
  solarized-green: "#859900"
  node-label: "#405760"
typography:
  display:
    fontFamily: News Cycle, Lato, sans-serif
    fontSize: 2.1em
    fontWeight: 700
  heading:
    fontFamily: News Cycle, Lato, sans-serif
    fontSize: 1.4em
    fontWeight: 700
  body:
    fontFamily: Lato, sans-serif
    fontSize: 32px
    fontWeight: 400
  mono:
    fontFamily: monospace
rounded:
  sm: 4px
  md: 8px
components:
  page:
    backgroundColor: "{colors.bg-canvas}"
    textColor: "{colors.text}"
  link:
    color: "{colors.link}"
    hoverColor: "{colors.link-hover}"
---

# DESIGN.md

The visual design specification of the DRY R Package Development presentation deck.

## Overview

The visual design is based on Ethan Schoonover's classic Solarized Light palette, meticulously calibrated to guarantee WCAG AA contrast at presentation and scroll sizes. It pairs the warm cream base (`#fdf6e3`) with darkened slate ink (`#526971`), clear oceanic blue links (`#006dad`), and the full eight-color Solarized accent spectrum for code, callouts, and architectural diagrams.

The presentation format is Quarto RevealJS (`theme: solarized`). Custom styles are defined in `style.css` and mirrored in the front matter above.

## Colours

- **Canvas & Ink:**
  - `bg-canvas` (`#fdf6e3`): Warm cream background across all slides.
  - `bg-card` (`#eee8d5`): Subtle tinted panels and table stripes.
  - `text` (`#526971`): Deep slate body text providing high readability against the cream canvas.
  - `muted` (`#657b83`): Secondary captions and metadata.
- **Interactive Elements:**
  - `link` (`#006dad`): High-contrast blue for hyperlinks.
  - `link-hover` (`#00547f`): Deepened blue hover state.
- **Solarized Accent Spectrum:**
  - `solarized-yellow` (`#b58900`): Warning cues and key takeaway highlights.
  - `solarized-orange` (`#cb4b16`): Critical alerts and architectural boundaries.
  - `solarized-red` (`#dc322f`): Antipatterns, errors, and DRY violations.
  - `solarized-magenta` (`#d33682`): Function signatures and metadata tags.
  - `solarized-violet` (`#6c71c4`): Package structure and module namespaces.
  - `solarized-blue` (`#268bd2`): Documentation references and standard library tools.
  - `solarized-cyan` (`#2aa198`): Test helpers, mocks, and fixtures.
  - `solarized-green` (`#859900`): Recommended patterns, clean refactorings, and DRY solutions.
- **Diagrams & Code:**
  - Diagram labels, filename headers, and Mermaid connector paths are calibrated to `#405760` and `#526971` to remain distinct on `#fdf6e3`.

## Typography

- **Headings & Body:** Default clean sans-serif stack from RevealJS `solarized` (`News Cycle`, `Lato`, sans-serif).
- **Code:** Monospace stack for R source snippets, DESCRIPTION metadata, and roxygen2 tags.

## Layout & Components

- **Title Slide:** Features the Bart Simpson DRY blackboard illustration with `.nostretch` and an explicit height constraint (`out-height: 390px`) to prevent layout collapse in vertical scroll views.
- **Icons:** Inline SVG mask spans (`.deck-icon`) powered by Font Awesome Free path data rendered with `currentColor`.
- **Diagrams:** Mermaid source diagrams rendered with `#526971` stroke and arrows.

## Do's and Don'ts

- **Do** retain `theme: solarized` in `index.qmd` front matter.
- **Do** use `#526971` for primary text and `#006dad` for links rather than standard low-contrast Solarized defaults.
- **Do** preserve `.nostretch` and explicit dimensions on title artwork.
- **Don't** introduce dark backgrounds or pure black text that disrupt the warm Solarized Light environment.
