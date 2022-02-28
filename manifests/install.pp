class haproxy::install inherits haproxy {

  if($haproxy::manage_package)
  {
    package { $haproxy::params::package_name:
      ensure => $haproxy::package_ensure,
    }
  }

}
