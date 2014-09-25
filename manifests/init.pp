# == Class: pf
#
# Full description of class pf here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { pf:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class pf {

  file {'/etc/sysctl.conf':
    ensure => present,
  }

#  sysctl { 'net.ipv4.ip_forward':
#   value => '1',
#  }
  file_line {'enable_routing':
    path => '/etc/sysctl.conf',
    line => "net.inet.ip.forwarding=1    # 1=Permit forwarding (routing) of packets ## This Line Managed by Puppet Module:${module_name}",
    require => File['/etc/sysctl.conf'],
  }

  package {'devel/git':
    ensure => installed,
    provider => pkgng,
  }
  package {'sysutils/pfstat':
    ensure => installed,
    provider => pkgng,
  }
  package {'sysutils/pftop':
    ensure   => installed,
    provider => pkgng,
  }

}
