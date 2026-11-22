# AGENTS.md

A single-page [Quarto](https://quarto.org/) presentation rendered to
[RevealJS](https://revealjs.com/) slides and deployed as a static site via
GitHub Pages. The `justfile` lists the commands; `just render` must succeed
before you push. CI renders with `options(warn = 2)`, so any R warning fails
the build.

## Key conventions

- **Single-file deck.** All slides live in `index.qmd`; do not split it.
- **Design specification.** The visual design follows [DESIGN.md](DESIGN.md).
  Respect it when creating or modifying slides, components, styling, colours,
  and typography. Restyle through `style.css`; new widgets follow the naming
  patterns already there.
- **Title image.** Keep `.nostretch` and the explicit output height on the
  title image: auto-stretch collapses it in native scroll view, while an
  unconstrained natural size overflows the title slide.
- **Sources.** References go in "Further Reading" tip callouts, and example
  packages in each section's "Self-study" slide. Follow this pattern.
- **Spelling and punctuation.** Use British spelling in prose (colour, licence,
  catalogue, artefact) and the Oxford comma in lists of three or more. Leave
  code, identifiers, file names, URLs, quotations, and proper names (`license`
  in YAML, `color` in `style.css`) as they are.
- **Spoken notes.** The read-aloud control speaks the `.notes` content. Write
  complete, audience-facing narration; keep staging cues, private reminders,
  and delivery checklists outside these blocks.
- **Accessibility.** Images must have `fig-alt` text; raw HTML widgets use
  `role="img"` and `aria-label`.
- **Icons.** Icons are HTML spans backed by only the required SVG path data in
  `style.css`; no icon font or Quarto icon extension. When adding one, add only
  its mask data, preserve the source licence attribution, and keep an
  accessible label where the icon conveys meaning.
- **Mermaid.** Keep diagrams as Mermaid source; do not replace them with
  pre-rendered SVGs to shrink the bundle.
- **Code execution.** The front matter sets `execute: eval: false`; code
  blocks are display-only. Only the image chunks (to run
  `knitr::include_graphics()`) and the `{mermaid}` diagrams opt in with
  `eval: true`; the global setting also governs diagram chunks, so a new
  Mermaid diagram needs the opt-in too.
- **Discoverability files.** Update `meta-tags.html` when the title,
  description, or social card changes, and `llms.txt` / `llms-full.txt` (and
  their `.well-known/` mirrors) when the content changes significantly.
- **No new top-level files** without a clear reason; the structure is flat.

## Pull requests

Follow these rules without relying on any instructions outside this
repository:

- Write every commit message and PR title as a Conventional Commit,
  `type(scope): description`, lowercase and imperative, with an allowed type
  (`build`, `chore`, `ci`, `docs`, `feat`, `fix`, `perf`, `refactor`,
  `revert`, `style`, `test`). Keep the PR title and body in sync with the
  net diff.

- Open every PR ready for review with `gh pr create`, never as a draft.

- Never add agent or tool attribution to commits, PRs, or comments.

- When a PR needs visual evidence (such as slide layout or styling changes),
  use the shared `pr-screenshot` skill to post verified screenshots. Verify the
  uploaded images render in the comment.

- After opening or pushing, wait for hosted CI to finish. Inspect failed jobs,
  fix the cause, run the local checks, push, and repeat. Skipped, queued, or
  failing required checks are not success.

- If an automatic AI review (Codex, for the owner) runs on the PR, wait for
  its result instead of requesting one. Fix merited findings, reply to and
  resolve addressed threads, and continue until the review approves the
  current head with no unresolved findings. Never write `@codex` anywhere in
  a PR, even in backticks: it cancels the automatic review. Say "a Codex
  review request" instead.

- If Codex reports exhausted usage, take no workaround action: leave the PR
  open, do not merge, and report the review limit. CI work can still finish.
  Once usage refreshes, comment `@codex review` once; this is the only case
  that needs the comment.

- Once CI is green and the review gate is met, squash-merge with the owner's
  authenticated `gh` credentials, then verify the merged state. Recheck the
  head, threads, and checks immediately before merging, and never bypass
  branch protections.

- Update a PR branch from `main` only to resolve conflicts or pick up a change
  the PR depends on, never just to bring it up to date.

- Report local validation, hosted CI, review, and merge state separately. If
  an external blocker stops completion, leave the PR open and say so.

# CI/CD

- `.github/workflows/build-presentation.yaml` calls a reusable workflow from
  `IndrajeetPatil/workflows`: pushes to `main` build and deploy to GitHub
  Pages, pull requests build without deploying. Do not inline or modify that
  workflow here.

- Reference `IndrajeetPatil/workflows` reusable workflows as `@main`, never a
  commit SHA. The owner maintains them and is the only person who can
  contribute to this repository, so there is no external-contributor risk, and
  `@main` keeps it on the latest version. Code scanners (CodeQL
  `actions/unpinned-tag`, zizmor `unpinned-uses`) flag this by design: do not
  report it or propose a pin; dismiss such alerts as "won't fix" with this
  reason.

- `check-link-rot.yaml` checks external links; list false positives in
  `lychee.toml`.
