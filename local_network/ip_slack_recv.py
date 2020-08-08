from __future__ import print_function
import socket
from contextlib import closing

import json
import requests
import os

def get_ip_address():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    return s.getsockname()[0]

def main():
  SLACK_WEBHOOK = os.environ['SLACK_TOKEN']

  local_address   = get_ip_address() # 受信側のPCのIPアドレス
  multicast_group = '239.255.0.1' # マルチキャストアドレス
  port = 4000
  bufsize = 409

  print("please wait")

  with closing(socket.socket(socket.AF_INET, socket.SOCK_DGRAM)) as sock:
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    sock.bind(('', port))
    sock.setsockopt(socket.IPPROTO_IP,
                    socket.IP_ADD_MEMBERSHIP,
                    socket.inet_aton(multicast_group) + socket.inet_aton(local_address))

    while True:
      msg=sock.recv(bufsize).decode()
      payload_dic = {
        "text": msg,
        "username": msg.split(':',1)[0],
        "channel": "#raspberry-ip",
        "icon_emoji": ":raspberry:",
      }
      requests.post(SLACK_WEBHOOK, data=json.dumps(payload_dic))
      print(payload_dic)

  return

if __name__ == '__main__':
  main()
