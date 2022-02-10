class Move2kubeAT032Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.2-rc.0",
      revision: "ed5da8c0bc3dfe04bb8c269b36b680889a8e21f2"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.2-rc.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "6f16b2d84a95c09e963ae525a26d7d07ad1c08252c74def620a1621a3d6bf59e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5acc106b83e37e62f06a441f320c766b8da8ec38d0071970b7c2530b52d55d10"
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
