# use_backend bk_app3 if { req.ssl_sni -m end app3.domain.com }
# use_backend <backend> [{if | unless} <condition>]
define haproxy::frontend::usebackend(
                                      $frontend_name,
                                      $condition,
                                      $backend_name  = $name,
                                      $order         = '00',
                                    ) {
  include ::haproxy

  concat::fragment{ "frontend-usebackend: ${name} ${backend_name} ${frontend_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "97-frontend-${frontend_name}-5-usebackend-${order}",
    content => template("${module_name}/frontend/usebackend.erb"),
  }
}
