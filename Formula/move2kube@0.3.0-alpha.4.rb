class Move2kubeAT030Alpha4 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://konveyor.io/move2kube"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0-alpha.4",
      revision: "62c1ef5ec8a4cafb431102ed79cda01efa2880cd"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0-alpha.4"
    sha256 cellar: :any_skip_relocation, big_sur:      "dd3b5119a76db366b446ee9f295304de4adbcabffc6736ae5de40fc413ee2620"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c7db142bca0dd5f9326884e703100f25743c5bfae4f585f5858d27700d66f1bd"
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
