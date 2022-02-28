# acl is_foo hdr_dom(host) -i foo
# acl <aclname> <criterion>[,<converter>] [flags] [operator] [<pattern>] ...
define haproxy::backend::acl(
                              $condition,
                              $backend_name,
                              $acl_name = $name,
                              $order    = '00',
                            ) {
  include ::haproxy

  concat::fragment{ "frontend-acl: ${acl_name} ${backend_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "98-backend-${backend_name}-2-acl-${order}",
    content => template("${module_name}/backend/acl.erb"),
  }
}
