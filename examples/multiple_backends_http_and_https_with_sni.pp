class { 'haproxy': }

haproxy::stats { ':2222':
  show_node => true,
  password  => 'password',
}

haproxy::balancer { 'http':
  listen => ':80'
}

haproxy::balancer::server { 'mailcow_http':
  balancer_name  => 'http',
  server_address => '127.0.0.1:1180',
}

# frontend env_ssl_frontend
#   bind *:443
#   mode tcp
#   option tcplog
#   tcp-request inspect-delay 10s
#   tcp-request content accept if { req_ssl_hello_type 1 }
#   use_backend bk_app1 if { req.ssl_sni -m end app1.domain.com }
#   use_backend bk_app2 if { req.ssl_sni -m end app2.domain.com }
#   use_backend bk_app3 if { req.ssl_sni -m end app3.domain.com }

haproxy::frontend { 'https':
  bind                                     => '127.0.0.1:9443',
  mode                                     => 'tcp',
  tcplog                                   => true,
  tcp_request_inspect_delay                => '10s',
  tcp_request_content_action_and_condition => 'accept if { req_ssl_hello_type 1 }',
}

haproxy::frontend::usebackend { 'mailcow_https':
  frontend_name => 'https',
  condition     => 'if { req.ssl_sni -m end tachi.systemadmin.es }',
}

#
# backend bk_app1
#   balance source
#   mode tcp
#   option ssl-hello-chk
#   server main 127.0.0.1:3000
# backend bk_app2
#   balance source
#   mode tcp
#   option ssl-hello-chk
#   server main 127.0.0.1:3001
# backend bk_app3
#   balance source
#   mode tcp
#   option ssl-hello-chk
#   server main 127.0.0.1:3002

haproxy::backend { 'mailcow_https':
  ssl_hello_chk => true,
}

haproxy::backend::server { 'mailcow_https':
  backend_name   => 'mailcow_https',
  server_address => '127.0.0.1:1443',
}
