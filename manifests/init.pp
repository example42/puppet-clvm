# = Class: clvm
#
# This is the main clvm class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, clvm class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $clvm_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, clvm main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $clvm_source
#
# [*source_dir*]
#   If defined, the whole clvm configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $clvm_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $clvm_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, clvm main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $clvm_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $clvm_options
#
# [*service_autorestart*]
#   Automatically restarts the clvm service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $clvm_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $clvm_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $clvm_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $clvm_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for clvm checks
#   Can be defined also by the (top scope) variables $clvm_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $clvm_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $clvm_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $clvm_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $clvm_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for clvm port(s)
#   Can be defined also by the (top scope) variables $clvm_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling clvm. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $clvm_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $clvm_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $clvm_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $clvm_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: undef
#
# Default class params - As defined in clvm::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of clvm package
#
# [*service*]
#   The name of clvm service
#
# [*service_status*]
#   If the clvm service init script supports status argument
#
# [*process*]
#   The name of clvm process
#
# [*process_args*]
#   The name of clvm arguments. Used by puppi and monitor.
#   Used only in case the clvm process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user clvm runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $clvm_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $clvm_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include clvm"
# - Call clvm as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class clvm (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits clvm::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $clvm::bool_absent ? {
    true  => 'absent',
    false => $clvm::version,
  }

  $manage_service_enable = $clvm::bool_disableboot ? {
    true    => false,
    default => $clvm::bool_disable ? {
      true    => false,
      default => $clvm::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $clvm::bool_disable ? {
    true    => 'stopped',
    default =>  $clvm::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $clvm::bool_service_autorestart ? {
    true    => Service[clvm],
    false   => undef,
  }

  $manage_file = $clvm::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $clvm::bool_absent == true
  or $clvm::bool_disable == true
  or $clvm::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $clvm::bool_absent == true
  or $clvm::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $clvm::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $clvm::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $clvm::source ? {
    ''        => undef,
    default   => $clvm::source,
  }

  $manage_file_content = $clvm::template ? {
    ''        => undef,
    default   => template($clvm::template),
  }

  ### Managed resources
  package { $clvm::package:
    ensure  => $clvm::manage_package,
    noop    => $clvm::noops,
  }

  service { 'clvm':
    ensure     => $clvm::manage_service_ensure,
    name       => $clvm::service,
    enable     => $clvm::manage_service_enable,
    hasstatus  => $clvm::service_status,
    pattern    => $clvm::process,
    require    => [ Package[$clvm::package] , Service['cman'] ],
    before     => Service['rgmanager'],
    noop       => $clvm::noops,
  }

  file { 'clvm.conf':
    ensure  => $clvm::manage_file,
    path    => $clvm::config_file,
    mode    => $clvm::config_file_mode,
    owner   => $clvm::config_file_owner,
    group   => $clvm::config_file_group,
    require => Package[$clvm::package],
    notify  => $clvm::manage_service_autorestart,
    source  => $clvm::manage_file_source,
    content => $clvm::manage_file_content,
    replace => $clvm::manage_file_replace,
    audit   => $clvm::manage_audit,
    noop    => $clvm::noops,
  }

  # The whole clvm configuration directory can be recursively overriden
  if $clvm::source_dir {
    file { 'clvm.dir':
      ensure  => directory,
      path    => $clvm::config_dir,
      require => Package[$clvm::package],
      notify  => $clvm::manage_service_autorestart,
      source  => $clvm::source_dir,
      recurse => true,
      purge   => $clvm::bool_source_dir_purge,
      force   => $clvm::bool_source_dir_purge,
      replace => $clvm::manage_file_replace,
      audit   => $clvm::manage_audit,
      noop    => $clvm::noops,
    }
  }


  ### Include custom class if $my_class is set
  if $clvm::my_class {
    include $clvm::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $clvm::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'clvm':
      ensure    => $clvm::manage_file,
      variables => $classvars,
      helper    => $clvm::puppi_helper,
      noop      => $clvm::noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $clvm::bool_monitor == true {
    if $clvm::port != '' {
      monitor::port { "clvm_${clvm::protocol}_${clvm::port}":
        protocol => $clvm::protocol,
        port     => $clvm::port,
        target   => $clvm::monitor_target,
        tool     => $clvm::monitor_tool,
        enable   => $clvm::manage_monitor,
        noop     => $clvm::noops,
      }
    }
    if $clvm::service != '' {
      monitor::process { 'clvm_process':
        process  => $clvm::process,
        service  => $clvm::service,
        pidfile  => $clvm::pid_file,
        user     => $clvm::process_user,
        argument => $clvm::process_args,
        tool     => $clvm::monitor_tool,
        enable   => $clvm::manage_monitor,
        noop     => $clvm::noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $clvm::bool_firewall == true and $clvm::port != '' {
    firewall { "clvm_${clvm::protocol}_${clvm::port}":
      source      => $clvm::firewall_src,
      destination => $clvm::firewall_dst,
      protocol    => $clvm::protocol,
      port        => $clvm::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $clvm::firewall_tool,
      enable      => $clvm::manage_firewall,
      noop        => $clvm::noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $clvm::bool_debug == true {
    file { 'debug_clvm':
      ensure  => $clvm::manage_file,
      path    => "${settings::vardir}/debug-clvm",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $clvm::noops,
    }
  }

}
