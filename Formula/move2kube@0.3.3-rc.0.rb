class Move2kubeAT033Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.3-rc.0",
      revision: "e36c7f0883a29b9613fffd472e5dc4563f399c2f"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.3-rc.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "a50a21afaf57fd7ff6439291a8f1ec9e47abd9e35948551e32d9ae967de4c7c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3091718c6969427ac7cafd200c86652f9cb84c62c3189b1bc4bab9a90066cee5"
  end

  depends_on "go@1.18" => :build
  depends_on "buildpacks/tap/pack" => :optional
  depends_on "docker" => :optional
  depends_on "helm" => :optional
  depends_on "kubernetes-cli" => :optional
  depends_on "operator-sdk" => :optional

  def install
    system "make", "build"
    bin.install "bin/move2kube"
  end

  test do
    # test the version
    want = "v" + version
    assert_equal want, shell_output("#{bin}/move2kube version").strip
  end
end
