class Move2kubeAT033Rc1 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.3-rc.1",
      revision: "12adbc7576abbb61dfdb5019ff3b073f37f556b9"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.3-rc.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "d8aa60bdf2bb8e527e39070bb70455e523904a5d876b3b85250d48f66e598662"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c7182573138ff339bddec31d883567ddde119d7d2cac6fe7890f613a0c1ff303"
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
