include ::selinux

class { 'haproxy': }

haproxy::stats { ':2222':
}

haproxy::balancer { 'demo':
  listen => ':3333'
}

haproxy::balancer::server { 'demo1':
  balancer_name  => 'demo',
  server_address => '127.0.0.1:2222',
}

haproxy::balancer::server { 'demo2':
  balancer_name  => 'demo',
  server_address => '127.0.0.1:2222',
}
