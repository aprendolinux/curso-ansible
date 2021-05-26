#!/bin/bash

set -e
#firewall-cmd --zone=public --permanent --add-service=ssh
/set_root_pw.sh
exec /usr/sbin/sshd -D
