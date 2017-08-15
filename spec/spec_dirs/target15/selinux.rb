describe ("check selinux status is permissive") do
  describe command("getenforce") do
    its(:stdout) { should match /Permissive/ }
  end

  describe file("/etc/selinux/config") do
    its(:content) { should match /^SELINUX=permissive$/ }
  end
end
