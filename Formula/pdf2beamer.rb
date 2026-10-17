class Pdf2beamer < Formula
  desc "Convert a PDF into a throttled, resumable Beamer deck"
  homepage "https://sapana-micro-software.github.io/Document2Slides/"
  url "https://github.com/Sapana-Micro-Software/homebrew-pdf2beamer/releases/download/v1.0.1/pdf2beamer-1.0.1.tar.gz"
  sha256 "SHA256_PLACEHOLDER"
  license :cannot_represent

  # Default path: rasterize, read embedded text, and OCR through Ollama.
  depends_on "ghostscript"
  depends_on "imagemagick"
  depends_on "ollama"
  depends_on "xpdf"

  def install
    odie "pdf2beamer requires macOS 27 or newer." if MacOS.version < "27"

    bin.install "pdf2beamer"
    bin.install "d2s"
    man1.install "pdf2beamer.1"
  end

  def caveats
    <<~EOS
      The worker binary d2s is signed and sealed (hardened runtime, timestamped).
      It links Apple NaturalLanguage and requires macOS 27.
      The manual page is pdf2beamer(1): man pdf2beamer

      OCR uses a local Ollama server. Pull the models once:
        ollama pull glm-ocr
        ollama pull gemma3:12b

      --pdf needs pdflatex on PATH, such as MacTeX or BasicTeX
      (/Library/TeX/texbin).

      This tap is not an official Homebrew tap. Trust it before installing:
        brew trust --tap sapana-micro-software/pdf2beamer
        brew install sapana-micro-software/pdf2beamer/pdf2beamer
    EOS
  end

  test do
    assert_match "pdf2beamer(1)", shell_output("#{bin}/pdf2beamer --help")
    assert_predicate bin/"d2s", :executable?
    assert_path_exists man1/"pdf2beamer.1.gz"
  end
end
