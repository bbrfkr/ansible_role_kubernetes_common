describe ("check hosts entries") do
  hosts_entries = ["k8s-master"]
  hosts_entries.each do |host|
    describe host(host) do
      it { should be_resolvable }
    end
  end
end
