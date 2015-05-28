name 'w_common'
license 'apachev2'
description 'Installs/Configures common components among all virtual machines'
long_description 'Installs/Configures common components such as sudo, iptables for ssh, etc'
version '0.0'

depends 'sudo'
depends 'ntp'
depends 'timezone-ii'
depends 'firewall'
depends 'vmware-tools'
depends 'hostsfile'