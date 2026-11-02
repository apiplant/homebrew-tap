# Generated from packaging/homebrew/kr-rs.rb in apiplant/kr-rs by the release
# workflow, which fills in the version and checksums and commits the result to
# apiplant/homebrew-tap as Formula/kr-rs.rb. Changes belong in the source
# repository: the next release overwrites this file.
class KrRs < Formula
  desc "Kubernetes in one static binary: no libc, no third-party crates"
  homepage "https://github.com/apiplant/kr-rs"
  version "0.1.0"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles. kr is
  # Linux only (namespaces, cgroup v2, overlayfs).
  on_linux do
    on_intel do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.1.0/kr-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "547bada750e2f2e3c6ac9b337a053cb3fda0ffde40e33af6fb43130a5d73d497"
    end
    on_arm do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.1.0/kr-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70d15c069a4887f4d21a9e6da3006d27db3705a26bd6ebe119f9f12a39adc9bb"
    end
  end

  def install
    bin.install "kr"
    (share/"kr-rs").install Dir["systemd/*"]
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kr version")
  end
end
