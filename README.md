# ansible_role_kubernetes_common

This is an Ansible role. This role executes Kubernetes common setting for master node or minion node.

## Processing
This role executes the following settings.

* network setting
  * set entries of hosts
  * set firewalld service disabled and stopped
* selinux setting
  * set state permissive
* yum repository setting
  * put yum repository of kubernetes
* Kubernetes setting
  * install necessary packages

## Caution!!
* This role assumpts a part of network settings (nics, default gateway and dns server) is completed.
* This role assumpts NetworkManager service is disabled and stopped.

## Support OS

| OS | version |
|----|---------|
|CentOS|7|

## Role variables
```
kubernetes_common:
  hosts:
    - name: k8s-master    # name of this hosts entry
      ip: 192.168.1.115   # ip of this hosts entry
    - name: k8s-minion    # name of this hosts entry
      ip: 192.168.1.116   # ip of this hosts entry
```

## Dependencies
None

## Build status
|branch|status|
|------|------|
|master|[![Build Status](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_kubernetes_common_master/badge/icon)](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_kubernetes_common_master/)|
|v.0.1 |[![Build Status](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_kubernetes_common_v.0.1/badge/icon)](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_kubernetes_common_v.0.1/)|

## Retest
This role is tested by serverspec, then its test codes are included in repository. Users can retest this role by using the test codes. To retest this role, follow the steps described below.

1. Prepare 1 target (Here, target ip is X.X.X.X)
2. Install serverspec in local machine
3. Modify spec/inventory.yml
```
---
- conn_name: target15  # never change!
  conn_host: X.X.X.X   # target ip
  conn_port: 22        # target's ssh port
  conn_user: vagrant   # user to connect
  conn_pass: vagrant   # password of user
  conn_idkey:          # path of identity key 
                       # (absolute path or relative path from the location of Rakefile)
  sudo_pass:           # sudo password of user
```

4. Modify targets ips in any files of `spec` dir
```
$ sed -i 's/192\.168\.1\.115/X.X.X.X/g' `find spec -type f`
```

5. Run `rake`

## License
MIT

## Author
Name: bbrfkr  
MAIL: bbrfkr@gmail.com

