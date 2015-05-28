require_relative '../spec_helper'

describe 'w_jenkins::default' do

  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  
	%w( jenkins::java jenkins::master git build-essential ruby-install ).each do |recipe|
		it "runs recipe #{recipe}" do
			expect(chef_run).to include_recipe("#{recipe}")
		end
	end
	
  it 'purges a package with ruby' do
    expect(chef_run).to purge_package('ruby')
  end

  it 'installs ruby 2.2.2 with user jenkins, group jenkins' do
    expect(chef_run).to install_ruby_install_ruby('ruby 2.2.2').with(user: 'jenkins', group: 'jenkins', no_reinstall: true)
  end  

bashrc = <<EOF
export PATH=$PATH:~/.rubies/ruby-2.2.2/bin
export EDITOR=/usr/bin/vi
EOF

  it 'creates jenkins .bashrc file' do
    expect(chef_run).to create_file('/var/lib/jenkins/.bashrc').with(
      user:   'jenkins',
      group:  'jenkins',
      content: bashrc
    )
  end

bashprofile = <<EOF
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
EOF

  it 'creates jenkins .bash_profile' do
    expect(chef_run).to create_file('/var/lib/jenkins/.bash_profile').with(
      user:   'jenkins',
      group:  'jenkins',
      content: bashprofile
    )
  end
  
  it 'enable ufw and open port 8080 for jenkins' do
		expect(chef_run).to enable_firewall('ufw')
		expect(chef_run).to allow_firewall_rule('jenkins').with(port: 8080, protocol: :tcp)
  end
 	
end