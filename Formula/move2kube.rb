class Move2kube < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0",
      revision: "842d8ff3953ca517f085cbc6f26b8f25db94115f"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "b3055f680d69ef90c636ab7fd7d66f73fd37596ffed60c0a0a2a500a966d4d0e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a054aa2621786937111be5ce2afc30cb976b4f2b5d7bd9d30a45fe7d35cf0d64"
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
