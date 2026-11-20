class Netkit < Formula
  desc "Zero-dependency IP, DNS, and domain diagnostics CLI"
  homepage "https://github.com/will-opz/netkit"
  # Pinned source snapshot until upstream publishes formal release tags.
  # Do not use a moving branch as the stable version.
  url "https://github.com/will-opz/netkit.git",
      revision: "6af23ac5a2621a217039b5f9b37be06fe735adea"
  version "0.1.1"

  head "https://github.com/will-opz/netkit.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-o", bin/"netkit", "./cmd/netkit"
  end

  test do
    assert_match "NetKit", shell_output("#{bin}/netkit -h")
    assert_match "192.168.31.0/24", shell_output("#{bin}/netkit ip -cidr 192.168.31.158/24")
    assert_match "Cloudflare", shell_output("#{bin}/netkit dns list")
    assert_match "注册信息", shell_output("#{bin}/netkit domain -h")
  end
end
