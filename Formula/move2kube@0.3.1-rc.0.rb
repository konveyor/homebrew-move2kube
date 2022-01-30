class Move2kubeAT031Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://konveyor.io/move2kube"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.1-rc.0",
      revision: "bec3694435dfbb8370bf5a95fe50534c195680eb"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.1-rc.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "262c099b6a070df276d7790bca1b5051023bc8cf1fe13a7cced07577f8efe8de"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "274e590be598ee880d49a31b437ce9757eade850c34975b47eb1f389733179ec"
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
