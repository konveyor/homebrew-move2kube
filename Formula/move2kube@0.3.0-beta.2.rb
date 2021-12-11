class Move2kubeAT030Beta2 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://konveyor.io/move2kube"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0-beta.2",
      revision: "dcf8793a889c0a8f9f4423e9e9ee3a95003c6bcc"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0-beta.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "1c5b64c8e9dfdfbf1206d93f9b9c993ceadaa6e3d711f6723ad0eff4c6ffe949"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e0b438317c43f984f4059b706f5c9316249f4840e6934835027bd84a55882b6a"
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
