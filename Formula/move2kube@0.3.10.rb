class Move2kubeAT0310 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.10",
      revision: "1862c9c951d760a9f3e8504abb0d25161c7b541c"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.10"
    sha256 cellar: :any_skip_relocation, monterey:     "12c0db838f33f17e2fd718a0da0099c722fd079a952e69c96595ecca7cf01bb8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aefd5f88c945bd7a9cdc01e48add6e1cef697d42839b5d6ece00c3487326ef4a"
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
