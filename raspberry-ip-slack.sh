#!/bin/bash

dir=$(cd $(dirname $0); pwd)

slack_post () {
curl -m 10 -X POST --data-urlencode \
  "payload={ \"channel\": \"$4\",
             \"username\": \"$2\",
             \"text\": \"$3\",
             \"icon_emoji\": \":raspberry:\"}" $1
}

#固定
#slack_URL='https://hooks.slack.com/services/XXXXXXXXXXXXXXXXXXXXXXXX'
slack_URL=${SLACK_TOKEN}
#認識しやすいラズパイの名前をつける
name=${RPI_NAME}

flag=true
wlan_ip=$(ip a show wlan0 | grep "inet " | cut -f6 -d ' ')
if "${flag}" ; then
  text="wlan0="$wlan_ip
  echo $text
  slack_post $slack_URL $name $text ${SLACK_CHANNEL} && flag=false
fi

eth_ip=$(ip a show eth0 | grep "inet " | cut -f6 -d ' ')
if "${flag}" ; then
  text="eth0="$eth_ip
  echo $text
  slack_post $slack_URL $name $text ${SLACK_CHANNEL} && flag=false
fi

g_ip=$(curl -m 10 inet-ip.info)
if "${flag}" ; then
  text="global_IP_address="$g_ip
  echo $text
  slack_post $slack_URL $name $text ${SLACK_CHANNEL} && flag=false

fi

if "${flag}" ; then
  text="w:"$wlan_ip"e:"$eth_ip"g:"$g_ip
  python3 $dir/local_network/socket_send.py $name $text
fi
