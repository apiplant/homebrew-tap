# Generated from packaging/homebrew/opendlss-rs.rb in apiplant/opendlss-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/opendlss-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class OpendlssRs < Formula
  desc "Rust host and model tools for the OpenDLSS-NR neural renderer"
  homepage "https://github.com/apiplant/opendlss-rs"
  version "0.1.2"
  license "MIT"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/opendlss-rs/releases/download/v0.1.2/opendlss-rs-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "ae82e085e73fd38b29e37dbfcef3906e40abc0d1ae54b3c936f14dccdaa402c0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/opendlss-rs/releases/download/v0.1.2/opendlss-rs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aac125a55cb84b88ad6e7c5083a2cf6eeac5084e4cdc3fa2f80c2ade9ef94846"
    end
    on_arm do
      url "https://github.com/apiplant/opendlss-rs/releases/download/v0.1.2/opendlss-rs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa9910e85e04bc3cf336d207a778449e914c17b60ea22a8c912e5b0df54e119d"
    end
  end

  def install
    bin.install "opendlss"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opendlss --version")
  end
end
