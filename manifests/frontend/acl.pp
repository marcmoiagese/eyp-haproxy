# acl is_foo hdr_dom(host) -i foo
# acl <aclname> <criterion>[,<converter>] [flags] [operator] [<pattern>] ...
define haproxy::frontend::acl (
                                $condition,
                                $frontend_name,
                                $acl_name = $name,
                                $order    = '00',
                              ) {
  include ::haproxy

  concat::fragment{ "frontend-acl: ${acl_name} ${frontend_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "97-frontend-${frontend_name}-2-acl-${order}",
    content => template("${module_name}/frontend/acl.erb"),
  }
}
