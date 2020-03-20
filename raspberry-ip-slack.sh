#!/bin/bash

slack_post () {
curl -X POST --data-urlencode \
  "payload={\"channel\": \"$2\",
            \"username\": \"$3\",
            \"text\": \"$4\",
            \"icon_emoji\": \":raspberry:\"}" $1
}

#固定
slack_URL='https://hooks.slack.com/services/XXXXXXXXXXXXXXXXXXXXX'
channel='#raspberry-ip'

#認識しやすいラズパイの名前をつける
name="raspberry1"


#無線
text=$(ip a show wlan0 | grep "inet " | cut -f6 -d ' ')
if [ -n "$text" ]; then
  text="wlan0="$text
  echo $text
  slack_post $slack_URL $channel $name $text
fi


#有線
text=$(ip a show eth0 | grep "inet " | cut -f6 -d ' ')
if [ -n "$text" ]; then
  text="eth0="$text
  echo $text
  slack_post $slack_URL $channel $name $text
fi


#グローバルIP
<<COMENTOUT
text=$(curl inet-ip.info)
if [ -n "$text" ]; then
  text="global_IP_address="$text
  echo $text
  slack_post $slack_URL $chennel $name $text

fi
COMENTOUT
