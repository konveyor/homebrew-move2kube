class Move2kubeAT0311 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.11",
      revision: "73077ae4f7e79f9c7f95208963ba284407f627af"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.11"
    sha256 cellar: :any_skip_relocation, monterey:     "f4144f0c683e7fa0fa7f87b8b1356bccc4b2b15ee186a833447da516193492a6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fef513d2d5ceda13a4f02591b953cd40bf551041dfdaab6e54b397d6871649eb"
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
