class Netkit < Formula
  desc "Zero-dependency IP, DNS, and domain diagnostics CLI"
  homepage "https://github.com/will-opz/netkit"
  # Initial pinned source snapshot, before a formal upstream release tag.
  # Do not use a moving branch as the stable version.
  url "https://github.com/will-opz/netkit.git",
      revision: "9bcbe0e6d5cd7e6f7b58e6794953f91137e11d2e"
  version "0.1.0"

  head "https://github.com/will-opz/netkit.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-o", bin/"netkit", "./cmd/netkit"
  end

  test do
    assert_match "NetKit", shell_output("#{bin}/netkit -h")
    assert_match "192.168.31.0/24", shell_output("#{bin}/netkit ip -cidr 192.168.31.158/24")
    assert_match "Cloudflare", shell_output("#{bin}/netkit dns list")
  end
end
