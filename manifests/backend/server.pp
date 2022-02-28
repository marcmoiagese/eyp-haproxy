define haproxy::backend::server(
                                  $server_address,
                                  $backend_name,
                                  $server_name   = $name,
                                  $check         = true,
                                  $backup        = false,
                                  $order         = '00',
                                ) {
  include ::haproxy

  concat::fragment{ "backend-server: ${backend_name} ${server_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "98-backend-${backend_name}-9-server-${order}",
    content => template("${module_name}/backend/server.erb"),
  }
}
