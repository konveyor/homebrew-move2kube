class Move2kubeAT030 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0",
      revision: "842d8ff3953ca517f085cbc6f26b8f25db94115f"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "ec0531eb11ea9af2051ad9c6d11dc17427e4e8e0970ff7f80a95eac63ed69c97"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "508f911619efb1919d94e4a6d72159181c1c2afb3229c72d4866d17a26b2281c"
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
