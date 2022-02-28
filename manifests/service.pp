class haproxy::service inherits haproxy {

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $haproxy::manage_docker_service)
  {
    if($haproxy::manage_service)
    {
      exec { 'haproxy check':
        command     => 'haproxy -c -f /etc/haproxy/haproxy.cfg',
        refreshonly => true,
        before      => Service[$haproxy::params::service_name],
        path        => '/usr/sbin:/usr/bin:/sbin:/bin',
      }

      service { $haproxy::params::service_name:
        ensure => $haproxy::service_ensure,
        enable => $haproxy::service_enable,
      }
    }
  }
}
