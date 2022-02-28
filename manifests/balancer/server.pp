define haproxy::balancer::server(
                                  $server_address,
                                  $balancer_name,
                                  $server_name   = $name,
                                  $check         = true,
                                  $backup        = false,
                                  $order         = '00',
                                ) {
  include ::haproxy

  concat::fragment{ "balancer-server: ${balancer_name} ${server_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "99-balancer-${balancer_name}-9-server-${order}",
    content => template("${module_name}/balancer/server.erb"),
  }
}
