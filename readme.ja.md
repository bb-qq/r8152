# RTL8152/RTL8153/RTL8156 搭載アダプタ向け DSM ドライバ

これは Synology 製 NAS 向けの RTL8152/RTL8153/RTL8156 ドライバパッケージです。 

## インストール方法

1. 「パッケージセンター」を開く
2. 「手動インストール」を選択する
3. [release page](https://github.com/bb-qq/aqc111/releases) からダウンロードしたパッケージを指定する。

https://www.synology.com/ja-jp/knowledgebase/SRM/help/SRM/PkgManApp/install_buy

## 設定方法

1. [SSH を有効にする](https://www.synology.com/ja-jp/knowledgebase/DSM/tutorial/General_Setup/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) and login your NAS
2. eth2 の IP アドレスを synonet コマンドで設定する
3. Web GUI からもう一度設定を行う

注: IP アドレス設定は再起動すると失われてしまいます。何か良い解決方法がありましたら Issue 経由で教えて下さい。

## サポートするプラットフォーム

* DSM 6.2
* apollolake ベースの製品
    * DS918+ (confirmed working)
    * DS620slim
    * DS1019+
    * DS718+
    * DS418play
    * DS218+

もし他の製品で使いたい場合は、Issue を作って教えて下さい。

## サポートされている RTL8156(2.5Gbps) ベースの製品

今は「動作確認済」と書かれた製品のみ動作確認ができています。もし他の製品を使用していて動作しない場合は VID/PID とともに Issue でお知らせ下さい。

* [Plannex USB-LAN2500R](https://amzn.to/2ZISyAb) (Type-A, 動作確認済)
* [Buffalo LUA-U3-A2G](https://amzn.to/36kGQf9) (Type-A, 動作確認済)
* [ASUSTOR AS-U2.5G](https://amzn.to/2ZRx1pi) (Type-C, 動作確認済)
* [CLUB 3D CAC-1420](https://amzn.to/2ACCceh) (Type-A)
* [TUC-ET2G](https://amzn.to/2V6LWXP) (Type-C)

## 性能計測結果

### 環境
* DS918+ (USB-LAN2500R)
* PC との直接接続 (AQN-107)
* [ネイティブの iperf3](http://www.jadahl.com/iperf-arp-scan/DSM_6.2/)
    * docker を使用すると CPU 負荷が高くなります

### 結果
````
Connecting to host 192.168.0.xxx, port 5201
[  4] local 192.168.0.xxx port 50366 connected to 192.168.0.xxx port 5201
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-1.00   sec   266 MBytes  2.23 Gbits/sec
[  4]   1.00-2.00   sec   274 MBytes  2.30 Gbits/sec
[  4]   2.00-3.00   sec   278 MBytes  2.33 Gbits/sec
[  4]   3.00-4.00   sec   278 MBytes  2.33 Gbits/sec
[  4]   4.00-5.00   sec   278 MBytes  2.33 Gbits/sec
[  4]   5.00-6.00   sec   278 MBytes  2.34 Gbits/sec
[  4]   6.00-7.00   sec   274 MBytes  2.30 Gbits/sec
[  4]   7.00-8.00   sec   267 MBytes  2.24 Gbits/sec
[  4]   8.00-9.00   sec   269 MBytes  2.26 Gbits/sec
[  4]   9.00-10.00  sec   271 MBytes  2.27 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-10.00  sec  2.67 GBytes  2.29 Gbits/sec                  sender
[  4]   0.00-10.00  sec  2.67 GBytes  2.29 Gbits/sec                  receiver

iperf Done.
````
