source 'https://supermarket.chef.io'

cookbook 'poise'
cookbook 'sudo'
cookbook 'ntp'
cookbook 'timezone'
cookbook 'firewall', "~> 1.1.2"
cookbook 'vmware-tools'
cookbook 'hostsfile'
cookbook 'jenkins'
cookbook 'git'
cookbook 'ruby-install'

group :wrapper do
  cookbook 'w_common', path: 'cookbooks/w_common'
  cookbook 'w_jenkins', path: 'cookbooks/w_jenkins'
end
