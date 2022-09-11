class Move2kube < Formula
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
    sha256 cellar: :any_skip_relocation, big_sur:      "fbf2348782367e519c8aac79d0d5515fd264ba8d3a0bf64c3b3aa54519039551"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "925a8b5a9757f26cf1d354b24e9601448e8f6fed43210817e2de7f27dbf0f420"
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
