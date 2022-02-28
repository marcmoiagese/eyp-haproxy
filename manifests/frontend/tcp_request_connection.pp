# tcp-request connection reject if !network_allowed
# tcp-request connection <action> [{if | unless} <condition>]
  define haproxy::frontend::tcp_request_connection(
                                                    $frontend_name,
                                                    $action,
                                                    $condition = $name,
                                                    $unless    = false,
                                                    $order     = '00',
                                                  ) {
  include ::haproxy

  concat::fragment{ "frontend-acl: ${action} ${unless} ${condition} ${frontend_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "97-frontend-${frontend_name}-2-tcp_request_connection-${order}",
    content => template("${module_name}/frontend/tcp_request_connection.erb"),
  }
}
