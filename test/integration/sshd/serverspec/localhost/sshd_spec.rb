require 'spec_helper'

version = Specinfra::Runner.get_package_version('openssh').stdout

describe package('openssh'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe service('sshd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe port(22) do
  it { should be_listening }
end

describe file('/etc/ssh/sshd_config'),:if => os[:family] == 'redhat' do
  it { should be_file }
  it { should contain 'Protocol 2' }
  it { should contain 'AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES' }

  it { should contain 'AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT' }
  it { should contain 'AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE' }
  it { should contain 'AcceptEnv XMODIFIERS' }
  it { should contain 'SyslogFacility AUTHPRIV' }
  it { should contain 'PasswordAuthentication yes' }
  it { should contain 'Subsystem sftp  /usr/libexec/openssh/sftp-server' }
  it { should contain 'AuthorizedKeysFile .ssh/authorized_keys' }
  it { should contain 'ChallengeResponseAuthentication no' }
  it { should contain 'GSSAPIAuthentication yes' }
  it { should contain 'GSSAPICleanupCredentials yes' }
  it { should contain 'UsePAM yes' }

  it { should contain 'X11Forwarding yes' }
  it { should contain 'UseDNS no' }

  if version.include?("5.")
    it { should_not contain 'UsePrivilegeSeparation sandbox' }
  end

  if version.include?("6.")
    it { should contain 'HostKey /etc/ssh/ssh_host_rsa_key' }
    it { should contain 'HostKey /etc/ssh/ssh_host_ecdsa_key' }
    it { should contain 'UsePrivilegeSeparation sandbox' }
  end
end



