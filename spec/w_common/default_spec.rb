require_relative '../spec_helper'

describe 'w_common::default' do

  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['w_common']['vmware-tools_enabled'] = false
    end.converge(described_recipe)
  end

  before do
    stub_command("which sudo").and_return(true)
  end

  it 'runs a execute with apt-get update' do
    expect(chef_run).to run_execute('apt-get update')
  end

	it 'upgrads bash' do
		expect(chef_run).to upgrade_package('bash')
	end
		  
	%w( sudo ntp timezone-ii ).each do |recipe|
		it "runs recipe #{recipe}" do
			expect(chef_run).to include_recipe("#{recipe}")
		end
	end
	
	it "does not run recipe vmware-tools::default" do
			expect(chef_run).to_not include_recipe('vmware-tools::default')
  end 
  
  it 'enable ufw and open port 22 for ssh' do
		expect(chef_run).to enable_firewall('ufw')
		expect(chef_run).to allow_firewall_rule('ssh').with(port: 22, protocol: :tcp)
  end
 	
end