describe ("check yum repo of kubernetes") do
  describe file("/etc/yum.repos.d/virt7-docker-common-release.repo") do
    it { should be_file }
  end
end

describe ("check packages are installed") do
  packages = ["kubernetes", "etcd", "flannel"]
  packages.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
