class Move2kubeAT034 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.4",
      revision: "e3f27b0a75aeb996aa3a50d7cbb82cb5d276ba4e"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.4"
    sha256 cellar: :any_skip_relocation, big_sur:      "eb305ec370376ec5bfb2d7fbfa0512b6faeb057ab15a347ca84c61b26893ce5a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3be29d999afe9e47e45ec37e29a4f8bc98262d9603d10b8dbd0294e9168415c8"
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
