# Puppet module: clvm

## DEPRECATION NOTICE
This module is no more actively maintained and will hardly be updated.

Please find an alternative module from other authors or consider [Tiny Puppet](https://github.com/example42/puppet-tp) as replacement.

If you want to maintain this module, contact [Alessandro Franceschi](https://github.com/alvagante)


This is a Puppet module for clvmd based on the second generation layout ("NextGen") of Example42 Puppet Modules.

This module requires example42 rhcs module

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-clvm

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install clvm with default settings

        class { 'clvm': }

* Install a specific version of clvm package

        class { 'clvm':
          version => '1.0.1',
        }

* Disable clvm service.

        class { 'clvm':
          disable => true
        }

* Remove clvm package

        class { 'clvm':
          absent => true
        }

* Enable auditing without without making changes on existing clvm configuration *files*

        class { 'clvm':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'clvm':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'clvm':
          source => [ "puppet:///modules/example42/clvm/clvm.conf-${hostname}" , "puppet:///modules/example42/clvm/clvm.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'clvm':
          source_dir       => 'puppet:///modules/example42/clvm/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'clvm':
          template => 'example42/clvm/clvm.conf.erb',
        }

* Automatically include a custom subclass

        class { 'clvm':
          my_class => 'example42::my_clvm',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'clvm':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'clvm':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'clvm':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'clvm':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }



[![Build Status](https://travis-ci.org/example42/puppet-clvm.png?branch=master)](https://travis-ci.org/example42/puppet-clvm)
