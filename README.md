# DRY R Package Development

This presentation contains tips on how to develop R packages without
violating the DRY (Don't Repeat Yourself) Principle in

- documentation
- unit testing
- vignette setup
- data
- conditions

Link to slides:
<https://www.indrapatil.com/dry-r-package-development/>

<img src="media/simpsons.webp" width="50%" alt="Simpsons cartoon where a character is writing on the blackboard that they will not repeat themselves while repeating themselves by writing the same thing again and again" />

## Development

This project uses R 4.6.0 or later (declared in `DESCRIPTION`), [Quarto](https://quarto.org/) for rendering slides, and [just](https://github.com/casey/just) as a command runner.

### Prerequisites

```bash
# Install just (macOS)
brew install just
```

### Setup

```bash
just install
```

### Just Commands

```bash
just help     # Show all available commands
just install  # Install R dependencies from DESCRIPTION
just render   # Render slides to HTML
just preview  # Start a live preview with auto-reload
just open     # Alias for preview (live-reload dev server over localhost)
just clean    # Remove generated files and caches
just axe      # Preview with an accessibility report slide (accepts preview flags)
just check    # Check the Quarto and R version setup
just          # Install dependencies and start live-reload preview
```

The `just axe` command activates the `a11y` profile for Quarto's accessibility report.
For a headless audit, run `just axe --no-browser --port 8860`, then open that URL in a browser.
Inspect the report and each slide, including fragments, scroll view, and keyboard navigation.
Normal renders omit the audit payload and report. Use
`QUARTO_PROFILE=a11y quarto render index.qmd` for an audit build without a preview server.

## Feedback

Feedback and suggestions are welcome in [the issue tracker](https://github.com/IndrajeetPatil/dry-r-package-development/issues).
