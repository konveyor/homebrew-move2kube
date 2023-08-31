class Move2kubeAT0310Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.10-rc.0",
      revision: "18bb00d8c08885e62c24c33a704f506d7f51f771"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.10-rc.0"
    sha256 cellar: :any_skip_relocation, monterey:     "9819a8f6c9f1e057b3947318ac81d2d4429b77b79ce781e30ee3351c60710d76"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bb7d3c0c7c7851190a2ad7637fae1742fcccecf218f67531e5ddbc650e09076c"
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
