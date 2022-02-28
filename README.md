# haproxy

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What haproxy affects](#what-haproxy-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with haproxy](#beginning-with-haproxy)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [TODO](#todo)
    * [Contributing](#contributing)

## Overview

HAproxy configutation management

## Module Description

HAproxy setup and configuration management. SELinux support via **eyp-selinux**

## Setup

### What haproxy affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements

This module requires pluginsync enabled

### Beginning with haproxy

Basic setup with stats listening to :2222 and a balancer listening to :3333:

```
class { 'haproxy': }

haproxy::stats { ':2222':
}

haproxy::balancer { 'demo':
  listen => ':3333'
}

haproxy::balancer::server { 'demo1':
  balancer_name  => 'demo',
  server_address => '127.0.0.1:2222',
}

haproxy::balancer::server { 'demo2':
  balancer_name  => 'demo',
  server_address => '127.0.0.1:2222',
}
```

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### TODO

TODO list

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
