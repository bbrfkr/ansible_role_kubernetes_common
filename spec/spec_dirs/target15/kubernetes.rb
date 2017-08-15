describe ("check kubernetes common setting") do
  describe file("/etc/kubernetes/config") do
    its(:content) { should match /^KUBE_ALLOW_PRIV="--allow-privileged=true"$/ }
    its(:content) { should match /^KUBE_MASTER="--master=http:\/\/k8s-master:8080"$/ }
  end
end

