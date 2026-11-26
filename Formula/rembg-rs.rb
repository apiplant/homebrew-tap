# Rendered from this template by the tagged release workflow.
class RembgRs < Formula
  desc "Native Rust background removal with Bria RMBG-3.0"
  homepage "https://rembg-rs.apiplant.com"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/apiplant/rembg-rs/releases/download/v0.1.2/rembg-rs-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "cb52c90f9967def1da1fea3a84f1aff1f24177e452c278368412f2cfd0b3b47e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/rembg-rs/releases/download/v0.1.2/rembg-rs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84a791dd8327ad22a5676baa8f212f2192dec0108eaf041c92dc3e807ab74b9e"
    end
    on_arm do
      url "https://github.com/apiplant/rembg-rs/releases/download/v0.1.2/rembg-rs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22abe712be1630ee2359437aa74195f805951ec87e4576a1f0ff47174243246e"
    end
  end

  def install
    bin.install "rembg-rs"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rembg-rs --version")
  end
end
