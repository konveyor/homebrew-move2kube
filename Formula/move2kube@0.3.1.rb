class Move2kubeAT031 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.1",
      revision: "5c0d928dbe7717a233fabb96cd7cb968ad670e72"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "a79c7f209275810b21a23c9a3c4eeb566f0b059e00ce989b35fba4f03ec4c5e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0a696d3bc691b40c8d92ec676c9d9ef3f45640afe79f2b778beb6dc4e6f00c6e"
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
