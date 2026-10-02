# Generated from packaging/homebrew/phonon-rs.rb in apiplant/phonon-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/phonon-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class PhononRs < Formula
  desc "Phonon-2 speech-to-text CLI and dictation daemon (candle)"
  homepage "https://github.com/apiplant/phonon-rs"
  version "0.1.2"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.2/phonon-rs-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "4681681b8603ebb492b497b040e6508717ba57da279b87313c26d3368275ca8c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.2/phonon-rs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23e68ee729330331f7c685521be39c6f546cd74698c8b2b325055ea0c0b857c8"
    end
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.2/phonon-rs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c46cabc1b9ba6e97a04a7692349e259bb5a92762fd9b89eec546f4b0de7419a"
    end
  end

  conflicts_with "phonon-rs-cuda", because: "both install the same binaries"

  def install
    bin.install "phonon"
    bin.install "phonon-dictate" if OS.linux?
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phonon --version")
  end
end
