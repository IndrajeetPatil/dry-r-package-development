# Default recipe - install, render, and open slides
default: install preview

# Show help
help:
    @echo "Available recipes:"
    @echo "  just install       - Install R dependencies and Quarto extensions"
    @echo "  just sync          - Alias for install"
    @echo "  just update        - Update R dependencies"
    @echo "  just render        - Render the Quarto slides to HTML"
    @echo "  just preview       - Start Quarto preview with live reload"
    @echo "  just open          - Alias for preview (live-reload dev server)"
    @echo "  just clean         - Remove generated files and caches"
    @echo "  just check         - Check Quarto and R setup"
    @echo "  just axe           - Preview with the axe accessibility checker enabled"
    @echo "  just (default)     - Install dependencies and start live-reload preview"

# Install/sync dependencies
install:
    @echo "Installing R dependencies from DESCRIPTION..."
    Rscript -e 'if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak", repos = "https://cloud.r-project.org"); pak::pak(".")'
    quarto add mcanouil/quarto-revealjs-a11y --no-prompt

# Alias for install
alias sync := install

# Update all dependencies
update:
    @echo "Updating R dependencies..."
    Rscript -e 'if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak", repos = "https://cloud.r-project.org"); pak::pak(".", upgrade = TRUE)'
    @echo "All dependencies updated!"

# Render slides
render:
    quarto render index.qmd

# Preview with live reload
preview:
    quarto preview index.qmd

# Alias for preview (live-reload dev server)
alias open := preview

# Clean generated files
clean:
    rm -rf .quarto/
    rm -rf _site/
    rm -rf _extensions/
    rm -f index.html
    rm -rf index_files/
    rm -rf .ipynb_checkpoints/
    rm -f README.html

# Check Quarto and R setup
check:
    quarto check
    Rscript -e 'stopifnot(getRversion() >= "4.6.1")'

# Audit accessibility with axe-core, appending a violations report slide to the deck.
# Uses the a11y profile because `-M axe:true` cannot override the format block in index.qmd.
[positional-arguments]
axe *args:
    QUARTO_PROFILE=a11y quarto preview index.qmd "$@"
