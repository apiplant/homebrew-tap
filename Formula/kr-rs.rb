# Generated from packaging/homebrew/kr-rs.rb in apiplant/kr-rs by the release
# workflow, which fills in the version and checksums and commits the result to
# apiplant/homebrew-tap as Formula/kr-rs.rb. Changes belong in the source
# repository: the next release overwrites this file.
class KrRs < Formula
  desc "Kubernetes in one static binary: no libc, no third-party crates"
  homepage "https://github.com/apiplant/kr-rs"
  version "0.3.0"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles. kr is
  # Linux only (namespaces, cgroup v2, overlayfs).
  on_linux do
    on_intel do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.3.0/kr-rs-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51f2430b9cb90d8dc12543dee5f66bfbe4b4d502e233538a42ee5d217e23d047"
    end
    on_arm do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.3.0/kr-rs-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1615285f0b5b614ecad70ae868131663375d0e481a9b39114070d213bf69c703"
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
