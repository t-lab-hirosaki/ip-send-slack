#!/usr/bin/python3
# -*- coding:utf-8 -*-

from __future__ import print_function
import socket
import time
from contextlib import closing
import sys
import os

def main():
  #ip指定
  host = os.environ['SLACK_SEND_IP'] #送信先のIPアドレス
  port = 4000
  count = 0
  sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  with closing(sock):
    name = sys.argv[1]
    mss = sys.argv[2]
    message = '{0} : {1}'.format(name,mss).encode('utf-8')
    print(message)
    sock.sendto(message, (host, port))
    time.sleep(0.5)
  return

if __name__ == '__main__':
  main()
