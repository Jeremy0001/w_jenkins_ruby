# -*- mode: ruby -*-
# vi: set ft=ruby :
Encoding.default_external = "UTF-8"
source 'https://supermarket.chef.io'

cookbook 'poise'
cookbook 'sudo'
cookbook 'ntp'
cookbook 'timezone'
cookbook 'firewall'
cookbook 'hostsfile'
cookbook 'windows', git: 'https://github.com/opscode-cookbooks/windows.git', ref: '0dae7405020b1521b61170267fdeedc022c3a448'

cookbook 'jenkins'
cookbook 'git'
cookbook 'ruby-install'

group :wrapper do
  cookbook 'w_jenkins', path: './'
end