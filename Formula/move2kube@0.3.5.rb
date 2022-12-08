class Move2kubeAT035 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.5",
      revision: "6af1220e009c7548905fd8d9a6896a6175451512"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.5"
    sha256 cellar: :any_skip_relocation, monterey:     "0a173343df95d38e409a0d692163ce64c219972efbbeceee50b426ca9ced6541"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4d4b49bbaf16bf8c4e272f8a67383bf520c4fefaa78e2a0f99fc9a91895fca0"
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
