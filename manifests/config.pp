class haproxy::config inherits haproxy {

  if(defined(Class['::selinux']))
  {
    $current_selinux_mode = $::selinux? {
      bool2boolstr(false) => 'disabled',
      false               => 'disabled',
      default             => $::selinux_current_mode,
    }

    case $current_selinux_mode
    {
      /^(enforcing|permissive)$/:
      {
        selinux::setbool { 'haproxy_connect_any':
          value => $haproxy::selinux_haproxy_connect_any,
        }
      }
      'disabled': { }
      default: { fail('this should not happen') }
    }
  }

  # TODO: load multiple configuration files using the -f flag, for example:
  #       haproxy -f conf/http-defaults -f conf/http-listeners ...

  concat { '/etc/haproxy/haproxy.cfg':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment { 'defaults haproxy':
    target  => '/etc/haproxy/haproxy.cfg',
    order   => '00',
    content => template("${module_name}/haproxycfg.erb"),
  }

  file { '/etc/haproxy/errors':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  #400.http  403.http  408.http  500.http  502.http  503.http  504.http

  file { '/etc/haproxy/errors/400.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/400.http"
  }

  file { '/etc/haproxy/errors/403.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/403.http"
  }

  file { '/etc/haproxy/errors/408.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/408.http"
  }

  file { '/etc/haproxy/errors/500.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/500.http"
  }

  file { '/etc/haproxy/errors/502.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/502.http"
  }

  file { '/etc/haproxy/errors/503.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/503.http"
  }

  file { '/etc/haproxy/errors/504.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/504.http"
  }

}
