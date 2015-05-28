include_recipe 'jenkins::java'
include_recipe 'jenkins::master'
include_recipe 'git'
include_recipe 'build-essential'
include_recipe 'ruby-install'

package 'ruby' do
	action :purge
end

ruby_install_ruby 'ruby 2.2.2' do
  user 'jenkins'
  group 'jenkins'
  no_reinstall true
  action :install
end

bashrc = <<EOF
export PATH=$PATH:~/.rubies/ruby-2.2.2/bin
export EDITOR=/usr/bin/vi
EOF

file "/var/lib/jenkins/.bashrc" do
  owner 'jenkins'
  group 'jenkins'
  content bashrc
  action :create
end

bashprofile = <<EOF
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
EOF

file "/var/lib/jenkins/.bash_profile" do
  owner 'jenkins'
  group 'jenkins'
  content bashprofile
  action :create
end

firewall 'ufw' do
  action :enable
end

firewall_rule 'jenkins' do
  port     8080
  protocol :tcp
  action   :allow
end