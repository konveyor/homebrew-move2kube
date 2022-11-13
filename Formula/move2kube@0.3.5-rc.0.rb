class Move2kubeAT035Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.5-rc.0",
      revision: "6ad99a100bd0dd10ed271dcaae6fae7dd53a2a09"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.5-rc.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "362de5a2490a2bea4aef9f6b8634700835175b63efa88bf30030148451c9f646"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3dd2edda986a6bdc1c049e6f9ddc56b72459abcb0c5e28888c18e29c9b8877cc"
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
