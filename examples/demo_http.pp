class { 'haproxy': }

haproxy::stats { ':2222':
}

haproxy::balancer { 'http':
  listen => ':80'
}

haproxy::balancer { 'https':
  listen => ':443'
}

haproxy::balancer::server { 'mailcow_http':
  balancer_name  => 'http',
  server_address => '127.0.0.1:1180',
}

haproxy::balancer::server { 'mailcow_https':
  balancer_name  => 'https',
  server_address => '127.0.0.1:1443',
}
