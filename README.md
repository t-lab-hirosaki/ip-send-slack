SEND IP_address slack!
====

IPアドレスをSlackに投げます。
ラズパイでの動作を想定しています。

## Usage
$ git clone https://github.com/t-lab-hirosaki/ip-send-slack.git


適宜slackの"URL",チャンネルは編集してください。
$ vim raspberry-ip-slack.sh
slack_URL=''
channel=''

raspberry-ip-slack.shに権限を付与してください。
$ chmod +x raspberry-ip-slack.sh

/etc/rc.local内に
./raspberry-ip-slack.sh

を記入することにより、電源が入ったときにIPアドレスを教えてくれます

## Author
sosa 
t-lab menber
 

