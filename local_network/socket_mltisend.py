#!/usr/bin/python3
# -*- coding:utf-8 -*-
from __future__ import print_function
import socket
import time
from contextlib import closing
import sys

def main():
  local_address   = '10.0.0.XXX' # 送信側のPCのIPアドレス
  multicast_group = '239.255.0.1' # マルチキャストアドレス
  port = 4000

  with closing(socket.socket(socket.AF_INET, socket.SOCK_DGRAM)) as sock:

    # sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_LOOP, 0)
    sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_IF, socket.inet_aton(local_address))

    name = sys.argv[1]
    mss = sys.argv[2]
    message = '{0} : {1}'.format(name,mss).encode('utf-8')
    print(message)
    sock.sendto(message, (multicast_group, port))
    time.sleep(0.5)

  return

if __name__ == '__main__':
  main()
