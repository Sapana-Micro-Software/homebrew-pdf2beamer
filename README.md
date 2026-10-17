# pdf2beamer

Homebrew tap for [pdf2beamer](https://sapana-micro-software.github.io/Document2Slides/).
The application source stays in a private repository. This tap distributes the signed worker binary and the `pdf2beamer` script.

Copyright (C) Shyamal Chandra, 2026. All rights reserved.

## Install

```sh
brew tap sapana-micro-software/pdf2beamer
brew trust --tap sapana-micro-software/pdf2beamer
brew install sapana-micro-software/pdf2beamer/pdf2beamer
```

A local checkout of this tap can be trusted and installed the same way. `brew tap-new` already registers it on this machine.

The formula depends on Ghostscript, ImageMagick, Ollama, and Xpdf (`pdfinfo` and `pdftotext`). `--pdf` also needs `pdflatex`. The worker requires macOS 27.

Release `v1.0.0` contains `pdf2beamer-1.0.0.tar.gz`. The `d2s` binary inside it is codesigned with a hardened runtime and a timestamp.
