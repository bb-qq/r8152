[日本語版はこちら](readme.ja.md)

# realtek RTL8152/RTL8153/RTL8156 driver for Synology

This is a RTL8152/RTL8153/RTL8156 driver package for Synology NASes.

## How to install

1. Go to "Package Center"
2. Press "Manual Install"
3. Chose a driver package downloaded from the [release page](https://github.com/bb-qq/r8152/releases).

https://www.synology.com/en-us/knowledgebase/SRM/help/SRM/PkgManApp/install_buy

## How to configure

1. [Enable SSH](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General_Setup/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) and login your NAS
2. Up the interface added by the driver (eg. eth2) by ``ifconfig eth2 up``
3. Configure IP address by Web GUI

Note: IP address configuration will be lost after the device is rebooted. If you find a solution for this issue, please share it.

## Supported NAS platform

* DSM 6.2
* apollolake based products
    * DS918+ (confirmed working)
    * DS620slim
    * DS1019+
    * DS718+
    * DS418play
    * DS218+

If you want to use the driver on other products, please create a issue.

## Supported RTL8156(2.5Gbps) based devices

Currently I only confirmed products marked "confirmed working". If you got other products and they do not work, please create a issue with its vendor id.

* [ASUSTOR AS-U2.5G](https://amzn.to/2ZRx1pi) (Type-C, confirmed working)
* [Plannex USB-LAN2500R](https://amzn.to/2ZISyAb) (Type-A, confirmed working, Japan only)
* [CLUB 3D CAC-1420](https://amzn.to/2ZPmzKD) (Type-A)
* [TUC-ET2G](https://amzn.to/2PLmR5v) (Type-C)

## Performance test

### Environment
* DS918+ (USB-LAN2500R)
* direct connection with PC (AQN-107)
* [native iperf3](http://www.jadahl.com/iperf-arp-scan/DSM_6.2/)
    * using docker causes high CPU load

### Result
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
