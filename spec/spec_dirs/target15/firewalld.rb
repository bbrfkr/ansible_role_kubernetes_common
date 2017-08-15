describe ("check firewalld service is stopped and disabled") do
  describe service("firewalld") do
    it { should_not be_running }
    it { should_not be_enabled }
  end
end
