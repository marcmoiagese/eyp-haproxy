define haproxy::frontend::server(
                                  $server_address,
                                  $frontend_name,
                                  $server_name   = $name,
                                  $check         = true,
                                  $backup        = false,
                                  $order         = '00',
                                ) {
  include ::haproxy

  concat::fragment{ "frontend-server: ${frontend_name} ${server_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "99-frontend-${frontend_name}-9-server-${order}",
    content => template("${module_name}/frontend/server.erb"),
  }
}
