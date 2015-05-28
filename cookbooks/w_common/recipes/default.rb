execute 'apt-get update'

# doc start handle bash vulnerability http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6271
package 'bash' do
  action :upgrade
end

include_recipe 'sudo'
include_recipe 'ntp'
include_recipe 'timezone-ii'

include_recipe 'vmware-tools::default' if node['w_common']['vmware-tools_enabled']

firewall 'ufw' do
  action :enable
end

firewall_rule 'ssh' do
  port     22
  protocol :tcp
  action   :allow
end