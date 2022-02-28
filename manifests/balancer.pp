define haproxy::balancer(
                          $listen,
                          $balancer_name = $name,
                          $mode          = 'tcp',
                          $balance_mode  = 'roundrobin',
                          $description   = undef,
                        ) {
  include ::haproxy

  concat::fragment{ "balancer: ${balancer_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "99-balancer-${balancer_name}-0",
    content => template("${module_name}/balancer.erb"),
  }
}
