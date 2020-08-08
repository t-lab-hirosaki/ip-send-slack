SEND IP_address slack or Local!
====

IPアドレスをSlackに投げます。インターネットに接続していない場合はsocket(UDP)通信を使います。
ラズパイでの動作を想定しています。

## Usage
$ git clone https://github.com/t-lab-hirosaki/ip-send-slack.git
適宜slackの"URL",チャンネル,個別管理の名前は編集してください。

$ export RPI_NAME=''
$ export SLACK_TOKEN=''
$ export SLACK_CHANNEL=''

再起動する可能性がある場合上記のexportコマンドはbash_profileやbashrcに記述しておくことをオススメします。

raspberry-ip-slack.shに権限を付与してください。
$ chmod +x raspberry-ip-slack.sh

/etc/rc.local内に
sleep 60
/home/pi/ip-send-slack/raspberry-ip-slack.sh &

を記入することにより、電源が入ったときにIPアドレスを教えてくれます。
sleepコマンドはネットワークを拾うまでに時間がかかるので必ず入れてください。

-------------------------------------------------

socket(UDP)通信を用いる場合はsend先のipを記述してください。

$ export SLACK_SEND_IP=''

また、受け側のPCのセットアップも必要です。

受け側のサーバとなるPCで以下の記述をしてip_slack_recv.py実行してください。
$ export SLACK_TOKEN=''

## Author

sosa
 
t-lab menber
 

