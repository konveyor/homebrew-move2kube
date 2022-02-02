class Move2kube < Formula
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
    sha256 cellar: :any_skip_relocation, big_sur:      "ee700128f138b774ae5e96a951ffb899b42b4c2a93fc9ba7ece0703b8221e374"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "380ed92bc08b984ce91ca415ac731adaf7338e429082d8dbb4c4dbe20b73dd9d"
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
