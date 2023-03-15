class Move2kubeAT037Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.7-rc.0",
      revision: "a24d00e8960912017841f013c49ae9559bfad64f"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.7-rc.0"
    sha256 cellar: :any_skip_relocation, monterey:     "4340bd3a749b72e62e7ff0b105b0dbcb085f3ce7f28cffca7601f3cf6f503010"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2fd7f841d461b87444580ca3b3b9b653798f0c6f9a25c5c112d1dd27e0024351"
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
