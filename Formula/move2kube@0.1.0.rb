class Move2kubeAT010 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://konveyor.io/move2kube"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.1.0",
      revision: "0e9d69d02c16379c6492e2404080fa295cc08a5f"
  end

  # bottle do
  #   root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/move2kube-0.1.0"
  #   sha256 cellar: :any_skip_relocation, big_sur:      "b5076d440d60e6fbf78a0e46700bb25fac3c8a72c8b8b705f17a8c27d76aaecb"
  #   sha256 cellar: :any_skip_relocation, catalina:     "9f3d4caacba9e2e55d06ee02a13f3efc73748090759e98f612bc2ae4484349a6"
  #   sha256 cellar: :any_skip_relocation, x86_64_linux: "f2758815ccbcf7d1465c06b8169cab2c62c15d7b862032fc9df1cda81a47f590"
  # end

  depends_on "go@1.15" => :build
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
