class Move2kubeAT034Rc1 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.4-rc.1",
      revision: "d100c5416f6aaba539e291e58a8036325db4eb4c"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.4-rc.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "9eefd37429330a9d11a669521732a31f5a8503dd1017065b3b94353542d46b92"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "41a3e8cc2f300d263ee5c214fd920549fbeb329d4d99a9ad4489430338feca8e"
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
