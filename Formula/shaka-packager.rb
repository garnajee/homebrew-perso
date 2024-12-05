class ShakaPackager < Formula
  desc "SDK for media packaging of DASH/HLS content"
  homepage "https://github.com/shaka-project/shaka-packager"
  url "https://github.com/shaka-project/shaka-packager.git",
      using:    :git,
      tag:      "v3.4.0",
      revision: "1f0a4d1959a17ea77b7f18b608338329395b6a45"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "git" => :build

  def install
    system "git", "submodule", "update", "--init", "--recursive"
    args = std_cmake_args + ["-G", "Ninja", "-DCMAKE_BUILD_TYPE=Release"]
    system "cmake", "-B", "build", *args
    system "cmake", "--build", "build", "--parallel"
    system "cmake", "--install", "build", "--strip", "--config", "Release"
  end

  test do
    system "#{bin}/packager", "-h"
  end
end

