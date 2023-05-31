class Move2kubeAT038Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.8-rc.0",
      revision: "5113d4ce474a1bdba04d1656490ddec38a36d804"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.8-rc.0"
    sha256 cellar: :any_skip_relocation, monterey:     "751923a3ee3e8ca10c379f5a6a87ec8bb36a8cf14dc2dd397ee995dc4951b58e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "49380cb3a1c72800a68f1f2bf8d5bddca035682e1605e7447ae9a7085c7a7348"
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
