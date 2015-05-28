require 'spec_helper'

describe 'w_comman::default' do
  describe command("env x='() { :;}; echo vulnerable' bash -c 'echo this is a test'") do
    its(:stdout) { should_not match /vulnerable/ }
  end

  describe command('date +%Z') do
    its(:stdout) { should match(/(EDT|EST)/) }
  end

	describe port(22) do
	  it { should be_listening.with('tcp') }
	end
	
end