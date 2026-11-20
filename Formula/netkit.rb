class Netkit < Formula
  desc "Zero-dependency IP, DNS, and domain diagnostics CLI"
  homepage "https://github.com/will-opz/netkit"
  # Pinned source snapshot until upstream publishes formal release tags.
  # Do not use a moving branch as the stable version.
  url "https://github.com/will-opz/netkit.git",
      revision: "d349371b51ba2f3258f828991b820b31fdd74382"
  version "0.1.2"

  head "https://github.com/will-opz/netkit.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-o", bin/"netkit", "./cmd/netkit"
  end

  test do
    assert_match "NetKit", shell_output("#{bin}/netkit -h")
    assert_match "192.168.31.0/24", shell_output("#{bin}/netkit ip -cidr 192.168.31.158/24")
    assert_match "Cloudflare", shell_output("#{bin}/netkit dns list")
    assert_match "records", shell_output("#{bin}/netkit domain -h")
    assert_match "records", shell_output("#{bin}/netkit domain records -h")
  end
end
