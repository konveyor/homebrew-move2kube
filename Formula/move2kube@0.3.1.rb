class Move2kubeAT031 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.1",
      revision: "bec3694435dfbb8370bf5a95fe50534c195680eb"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "7592e342d5d913d338b13cca834da7c3399b5aebef42c5dbe1f6ee548bc4c12d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2fc1738cde22006b3a520b7d589058e9d3f5956fa1a57903d4f3059928fc625f"
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
