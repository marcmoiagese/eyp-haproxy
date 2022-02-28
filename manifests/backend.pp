# backend bk_app1
#   balance source
#   mode tcp
#   option ssl-hello-chk
#   server main 127.0.0.1:3000
define haproxy::backend(
                          $backend_name  = $name,
                          $description   = undef,
                          $mode          = 'tcp',
                          $balance_mode  = 'source',
                          $ssl_hello_chk = false,
                        ) {
  include ::haproxy

  concat::fragment{ "backend: ${backend_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "98-backend-${backend_name}-0",
    content => template("${module_name}/backend.erb"),
  }
}
