# CHANGELOG

## 0.2.14

* bugfix

## 0.2.13

* added description option to backend and frontend

## 0.2.12

* added default_backend for **haproxy::frontend**

## 0.2.11

* added haproxy config test before restarting service

## 0.2.10

* fixed bug on setting up admin socket
* added flag to set socket access level and socket timeout

## 0.2.9

* added support for backend ACLs

## 0.2.7

* improved http-request and http-response ACL support for **haproxy::backend**

## 0.2.6

* added **haproxy::backend::http_response_set_header**

## 0.2.5

* added **haproxy::frontend::tcp_request_connection**

## 0.2.3

* renamed resources for better ordering

## 0.2.2

* bugfix **haproxy::frontend::usebackend**

## 0.2.1

* added **haproxy::backend::addheader**

## 0.2.0

* Rework HAProxy rule definition

## 0.1.2

* Updated metadata for **eyp-systemd 0.2.0**

## 0.1.1

* improving compatibility

## 0.1.0

* initial release
