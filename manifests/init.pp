class haproxy(
                            $manage_package              = true,
                            $package_ensure              = 'installed',
                            $manage_service              = true,
                            $manage_docker_service       = true,
                            $service_ensure              = 'running',
                            $service_enable              = true,
                            $chroot                      = '/var/lib/haproxy',
                            $stats_socket                = undef,
                            $stats_socket_mode           = '660',
                            $stats_socket_level          = 'admin',
                            $stats_socket_timeout        = '30s',
                            $user                        = 'haproxy',
                            $group                       = 'haproxy',
                            $daemon                      = true,
                            $ssl_options                 = 'no-sslv3',
                            $ssl_ciphers                 = 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS',
                            $selinux_haproxy_connect_any = true,
                          ) inherits haproxy::params{

  class { '::haproxy::install': } ->
  class { '::haproxy::config': } ~>
  class { '::haproxy::service': } ->
  Class['::haproxy']

}
