class Move2kubeAT030Beta3 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0-beta.3",
      revision: "1c303dd3e7e9fec50b0a97a734b4177a9016bce1"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0-beta.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "39f1573b0de8aa99de3503ef0ee5eaeddc70992a68287315aa5d63242f9c70bd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c61958bfd7a88faebf53c69261ba1eb518009d5d86253131305cbbdfa7cb7363"
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
