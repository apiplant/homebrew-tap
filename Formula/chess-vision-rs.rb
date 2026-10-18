# Generated from packaging/homebrew/chess-vision-rs.rb in apiplant/chess-vision-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/chess-vision-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class ChessVisionRs < Formula
  desc "Recognise a chess position from an image and print FEN, Lichess links or a rendered board"
  homepage "https://github.com/apiplant/chess-vision-rs"
  version "0.1.0"
  license "AGPL-3.0-only"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/chess-vision-rs/releases/download/v0.1.0/chess-vision-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "673df9ade832f4c59ae3bfabf712e0b2a57dad61b317a0f6d251d63ae986ae82"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/chess-vision-rs/releases/download/v0.1.0/chess-vision-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "adc171bbf01fea5f061df03c076207142512614b6cec55cc9aaccd4cd7b7eb15"
    end
    on_arm do
      url "https://github.com/apiplant/chess-vision-rs/releases/download/v0.1.0/chess-vision-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df16844a6376d7959cc9e3c1d6f27a0926429ef39fb1a446cd44887287deba7d"
    end
  end

  def install
    bin.install "chess-vision"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chess-vision --version")
  end
end
