SEND IP_address slack or Local!
====

IPアドレスをSlackに投げます。インターネットに接続していない場合はsocket(UDP)通信を使います。
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

を記入することにより、電源が入ったときにIPアドレスを教えてくれます。

-------------------------------------------------

ローカル環境では、local_network内のsocket_send.pyを編集してください。

$ vim local_network/socket_send.py

host=''

また、IPアドレス情報データを受け取るPCでrecv.pyを実行してください。

$ vim local_network/recv.py

$ scp local_network/recv.py メインPC

メインPC先で、

$ python3 recv.py


## Author

sosa
 
t-lab menber
 

