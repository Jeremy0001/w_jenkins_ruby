require 'spec_helper'

describe 'w_jenkins::default' do

  describe file('/var/lib/jenkins/.rubies/ruby-2.2.2/bin/ruby') do
    it { should be_readable.by_user('jenkins') }
  end

  describe file('/var/lib/jenkins/.bashrc') do
    it { should contain 'ruby-2.2.2' }
    it { should be_owned_by 'jenkins' }
    it { should be_grouped_into 'jenkins' }
  end

  describe file('/var/lib/jenkins/.bash_profile') do
    it { should contain 'source ~/.bashrc' }
    it { should be_owned_by 'jenkins' }
    it { should be_grouped_into 'jenkins' }
  end
    
  describe command('ufw status') do
    its(:stdout) { should match /8080\/tcp[\s]*ALLOW[\s]*Anywhere/ }
  end
	
end