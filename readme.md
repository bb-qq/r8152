# DSM driver for realtek RTL8152/RTL8153/RTL8156 based USB Ethernet adapters

This is a RTL8152/RTL8153/RTL8156 driver package for Synology NASes.

## Supported NAS platform

* DSM 6.2
* apollolake based products
    * DS918+ (confirmed working)
    * DS620slim
    * DS1019+
    * DS718+
    * DS418play
    * DS218+

You can download drivers including other platforms from the [Release page](https://github.com/bb-qq/r8152/releases) and determine a proper driver for your model from [this page](https://www.synology.com/en-global/knowledgebase/DSM/tutorial/Compatibility_Peripherals/What_kind_of_CPU_does_my_NAS_have), but you might encounter some issues with unconfirmed platforms.

I very much appreciate if you report whether it works.

NOTE: I recommend using front ports to connect devices because some users reported stability issues when they use rear ports.

## Supported RTL8156(2.5Gbps) based devices

Currently I only confirmed products marked "confirmed working". If you got other products and they do not work, please create a issue with its vendor id.

* [ASUSTOR AS-U2.5G](https://amzn.to/2ZRx1pi) (Type-C, confirmed working)
  * NOTE: The included Type A-C conversion adapter is directional. There's a mark on one side of the USB-C connector that must be on the same side as the USB logo on the adapter.
* [Plannex USB-LAN2500R](https://amzn.to/2ZISyAb) (Type-A, confirmed working, Japan only)
* [Buffalo LUA-U3-A2G](https://amzn.to/36kGQf9) (Type-A, confirmed working, Japan only)
* [CLUB 3D CAC-1420](https://amzn.to/2ZPmzKD) (Type-A, confirmed working)
* [TUC-ET2G](https://amzn.to/2PLmR5v) (Type-C, confirmed working)
* [CableCreation B07VNFLTLD](https://amzn.to/39yfZyj) (Type-A, confirmed working)
* [UGREEN USB C to 2.5G Ethernet Adapter](https://amzn.to/3fzXmfE) (Type-C, confirmed working)
* biaze KZ13 (Type-A, confirmed working)

## How to install

### Preparation

[Enable SSH](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General_Setup/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) and login your NAS.

### Installation

1. Go to "Package Center"
2. Press "Manual Install"
3. Chose a driver package downloaded from the [release page](https://github.com/bb-qq/aqc111/releases).
4. [DSM7] The installation will fail the first time. After that, run the following command from the SSH terminal:
   `sudo install -m 4755 -o root -D /var/packages/r8152/target/r8152/spk_su /opt/sbin/spk_su`
5. [DSM7] Retry installation. (You don't need above DSM7 specific steps at the next time.)

https://www.synology.com/en-us/knowledgebase/SRM/help/SRM/PkgManApp/install_buy

## How to configure

You can configure the IP addresses and MTU of the added NICs from the DSM UI in the same way as the built-in NICs.

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
