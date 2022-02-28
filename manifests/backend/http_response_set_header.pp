# http-response set-header <name> <fmt> [<condition>]
define haproxy::backend::http_response_set_header (
                                                    $frontend_name,
                                                    $header_value,
                                                    $condition   = undef,
                                                    $header_name = $name,
                                                    $unless      = false,
                                                    $order       = '00',
                                                    $description = undef,
                                                  ) {
  include ::haproxy

  concat::fragment{ "backend - http_response_set_header: ${name} ${header_name} ${header_value} ${frontend_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "97-backend-${frontend_name}-2-http_response_set_header-${order}",
    content => template("${module_name}/backend/http_response_set_header.erb"),
  }
}
