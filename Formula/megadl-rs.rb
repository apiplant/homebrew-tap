# Generated from packaging/homebrew/megadl-rs.rb in apiplant/megadl-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/megadl-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class MegadlRs < Formula
  desc "Command-line downloader and terminal download manager for mega.nz links"
  homepage "https://github.com/apiplant/megadl-rs"
  version "0.1.0"
  license "MIT"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/megadl-rs/releases/download/v0.1.0/megadl-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "66f6ad781eadd8442c6ef99daecce5881018e3ef3ad81eacde82d193721be299"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/megadl-rs/releases/download/v0.1.0/megadl-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab493e897a661f5cd2bcbde0f575e905d937531dae8cdf5dd60fd94a9a672cb1"
    end
    on_arm do
      url "https://github.com/apiplant/megadl-rs/releases/download/v0.1.0/megadl-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2323ac61b5a39275deae5b7aba422671142a65f3de67242b4c953772e8ea3c09"
    end
  end

  def install
    bin.install "megadl"
    bin.install "megadl-tui"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/megadl --version").split(" ").last
    assert_match version.to_s, shell_output("#{bin}/megadl-tui --version").split(" ").last
  end
end
