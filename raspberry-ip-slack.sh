#!/bin/bash

dir=$(cd $(dirname $0); pwd)

slack_post () {
curl -m 10 -X POST --data-urlencode \
  "payload={\"channel\": \"#raspberry-ip\",
            \"username\": \"$2\",
            \"text\": \"$3\",
            \"icon_emoji\": \":raspberry:\"}" $1
}

#固定
slack_URL='https://hooks.slack.com/services/XXXXXXXXXXXXXXXXXXXXXXXX'
#認識しやすいラズパイの名前をつける
name="raspberry1"

text=$(ip a show wlan0 | grep "inet " | cut -f6 -d ' ')
if [ -n "$text" ]; then
  text="wlan0="$text
  echo $text
  slack_post $slack_URL $name $text || $dir/local_network/socket_send.py $name $text
fi

text=$(ip a show eth0 | grep "inet " | cut -f6 -d ' ')
if [ -n "$text" ]; then
  text="eth0="$text
  echo $text
  slack_post $slack_URL $name $text || $dir/local_network/socket_send.py $name $text
fi

text=$(curl -m 10 inet-ip.info)
if [ -n "$text" ]; then
  text="global_IP_address="$text
  echo $text
  slack_post $slack_URL $name $text || $dir/local_network/socket_send.py $name $text
fi
