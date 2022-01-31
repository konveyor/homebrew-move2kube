class Move2kubeAT030Rc2 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0-rc.2",
      revision: "82fcb2641ece93dd80616cb9f40713a8e47a4f87"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0-rc.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "4615bdc01b87c6a160b8cecb4d173b8516a56314221288653a14acd806624600"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ccf40cdf49c2b0145472c1745ba3a5573245ddc74ffeb14b0eae1d66bb2f8e42"
  end

  depends_on "go@1.17" => :build
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
