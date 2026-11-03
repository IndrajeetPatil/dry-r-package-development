---
name: check-accessibility
description: >
  Audit the deck's accessibility with axe-core (just axe) and keep the a11y
  extension and accessibility.html working: what each provides, the disabled
  menu features, which states to inspect, headless runs and WCAG link cues.
  Use after changing slide markup, styles, HTML widgets, menus or the a11y
  setup, or when asked for an accessibility check.
---

# Check accessibility

- Verify with `just axe`, which appends an "Accessibility Report" slide listing
  axe-core violations. For headless checks, use
  `just axe --no-browser --port 8860`.
- Do not add `axe` to `index.qmd`: it belongs in `_quarto-a11y.yml` so the
  deployed deck never ships the axe-core payload. `-M axe:true` cannot enable
  it, because the `format:` block in `index.qmd` takes precedence over CLI
  metadata.
- The report alone does not exercise every state. Inspect all slides, revealed
  fragments, tab panels and menu panels in both presentation and native
  `?view=scroll` modes. Fix actionable findings rather than filtering rules.
- Links inside muted text need a non-colour cue (e.g.
  `text-decoration: underline`) to satisfy WCAG 1.4.1.
- Keep explicit `aria-label` attributes on repeated slide headings so
  scroll-view landmarks have unique names.

## The a11y extension and `accessibility.html`

- The `a11y` extension supplies zoom, focus indicators, link underlines,
  reduced motion, slide isolation, and screen-reader announcements. Install the
  latest directly from upstream with
  `quarto add mcanouil/quarto-revealjs-a11y --no-prompt` (in both `justfile`
  and CI). This extension is trusted; do not add version pins, vendoring, or
  checksum checks.
- Version 0.2.3's slide-menu patch and settings menu introduce ARIA and
  contrast failures, so both are disabled in `index.qmd`.
- Keep `accessibility.html` for code scrolling, menu focus, and
  vertical-slide semantics. This deck has no tabsets, but
  `accessibility.html` still ships the shared tabset keyboard handling: the
  file is copied verbatim across decks and kept in sync by hand, so never
  trim it locally.
