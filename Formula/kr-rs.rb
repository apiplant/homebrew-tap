# Generated from packaging/homebrew/kr-rs.rb in apiplant/kr-rs by the release
# workflow, which fills in the version and checksums and commits the result to
# apiplant/homebrew-tap as Formula/kr-rs.rb. Changes belong in the source
# repository: the next release overwrites this file.
class KrRs < Formula
  desc "Kubernetes in one static binary: no libc, no third-party crates"
  homepage "https://github.com/apiplant/kr-rs"
  version "0.1.1"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles. kr is
  # Linux only (namespaces, cgroup v2, overlayfs).
  on_linux do
    on_intel do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.1.1/kr-rs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "490815db0361445e5315eca6932f3df8abbcb1659ed4bd0e7bc11ea4a7224657"
    end
    on_arm do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.1.1/kr-rs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "edd75b4b9915ae43f819b580695273877c9dd9d6f674a49cfb019798992b95da"
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
