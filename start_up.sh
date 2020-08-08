#/bin/bash

echo "# First, edit the file ~/.bashrc "
echo "# add commands below the comment."
echo "export RPI_NAME='"${RPI_NAME}"'"
echo "export SLACK_TOKEN='"${SLACK_TOKEN}"'"
echo "export SLACK_CHANNEL='"${SLACK_CHANNEL}"'"
echo "export SLACK_SEND_IP='"${SLACK_SEND_IP}"'"

echo
echo "# Second, edit the file /etc/rc.local u must edit with [root]"
echo "# Add commands below the comment, but leave the line [exit 0] at the end"
echo "export RPI_NAME='"${RPI_NAME}"'"
echo "export SLACK_TOKEN='"${SLACK_TOKEN}"'"
echo "export SLACK_CHANNEL='"${SLACK_CHANNEL}"'"
echo "export SLACK_SEND_IP='"${SLACK_SEND_IP}"'"
echo
echo "sleep 60"
echo "/home/pi/ip-send-slack/ip_send_slack.sh &"

echo
echo "# test"
echo "sudo /etc/rc.local start"
echo "# check to this ip_address send slack or local"
