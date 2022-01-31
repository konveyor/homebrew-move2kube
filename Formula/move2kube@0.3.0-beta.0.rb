class Move2kubeAT030Beta0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0-beta.0",
      revision: "d7f0602428e0c10a4bd36fa2f090d87d3b80f216"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0-beta.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "9a8831ae6f7f6161c9c290211878c9595929c4addcfa70f388e713d6dd645d48"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a810ea27ee8ffc72458f6bde1661b044c07aa4e5cc8152c88ea2f86ba9c714e0"
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
