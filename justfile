# Default recipe - install, render, and open slides
default: install render open

# Show help
help:
    @echo "Available recipes:"
    @echo "  just install       - Install R dependencies from DESCRIPTION"
    @echo "  just render        - Render the Quarto slides to HTML"
    @echo "  just preview       - Start Quarto preview with live reload"
    @echo "  just open          - Open rendered slides in default browser"
    @echo "  just clean         - Remove generated files and caches"
    @echo "  just check         - Check Quarto and R version setup"
    @echo "  just (default)     - Install dependencies, render, and open slides"

# Install R dependencies
install:
    @echo "Installing R dependencies from DESCRIPTION..."
    Rscript -e 'if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak", repos = "https://cloud.r-project.org"); pak::pak(".")'

# Render slides
render:
    quarto render index.qmd

# Preview with live reload
preview:
    quarto preview index.qmd

# Open rendered slides in browser (macOS)
open:
    open _site/index.html

# Clean generated files
clean:
    rm -rf .quarto/
    rm -rf _site/
    rm -rf index_files/
    rm -rf .ipynb_checkpoints/

# Check Quarto and R setup
check:
    quarto check
    Rscript -e 'stopifnot(getRversion() >= "4.6.0")'
