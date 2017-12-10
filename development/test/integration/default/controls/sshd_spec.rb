control 'sshd' do
  title 'SSHd controls'
  desc "checks config of host's SSH daemon is correct"
  tag 'sshd', 'ubuntu'

  describe service('sshd') do
    it {should be_enabled}
    it {should be_running}
  end

  describe sshd_config do
    its('Protocol') { should eq '2'}
    its('Port') { should eq('22') }
  end
end

