# TODO:
# http-request add-header <name> <fmt> [<condition>]
# http-request deny if METH_GET HTTP_CONTENT
define haproxy::backend::http_request_deny(
                                            $backend_name,
                                            $description = $name,
                                            $condition   = undef,
                                            $unless      = false,
                                            $order       = '00',
                                          ) {
  include ::haproxy

  concat::fragment{ "backend-request-deny: ${backend_name} ${condition} ${unless}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "98-backend-${backend_name}-8-request-deny-${order}",
    content => template("${module_name}/backend/http_request_deny.erb"),
  }
}
