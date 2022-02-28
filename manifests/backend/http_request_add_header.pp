# TODO:
# http-request add-header <name> <fmt> [<condition>]
# http-request add-header X-Forwarded-Proto https if { ssl_fc }
define haproxy::backend::http_request_add_header(
                                                  $header_value,
                                                  $backend_name,
                                                  $header_name = $name,
                                                  $condition   = undef,
                                                  $order       = '00',
                                                ) {
  include ::haproxy

  concat::fragment{ "backend-addheader: ${backend_name} ${header_name} ${name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "98-backend-${backend_name}-8-addheader-${order}",
    content => template("${module_name}/backend/http_request_add_header.erb"),
  }
}
