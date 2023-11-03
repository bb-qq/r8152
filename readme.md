# DSM driver for realtek RTL8152/RTL8153/RTL8156 based USB Ethernet adapters

This is an RTL8152/RTL8153/RTL8156(2.5Gbps or 1.0Gbps) driver package for Synology NASes.

You may also be interested in my other projects:
* [AQC111U(5Gbps ethernet) driver package for Synology NASes](https://github.com/bb-qq/aqc111)
* [UASP(USB Attached SCSI Protocol for external storage devices) driver package for Synology NASes](https://github.com/bb-qq/uas)

## Supported NAS platform

* DSM 7.x
* apollolake based products
    * DS918+ (confirmed working)
    * DS620slim
    * DS1019+
    * DS718+
    * DS418play
    * DS218+

You can download drivers including other platforms from the [release page](https://github.com/bb-qq/r8152/releases) and determine a proper driver for your model from [knowledge base of Synology](https://www.synology.com/en-global/knowledgebase/DSM/tutorial/Compatibility_Peripherals/What_kind_of_CPU_does_my_NAS_have), but you might encounter some issues with unconfirmed platforms. If you are using such unconfirmed models, the [Compatibility page](https://github.com/bb-qq/r8152/wiki/Compatibility) may be helpful.

I very much appreciate it if you could report whether it works. If you have any problems, the [Troubleshooting](https://github.com/bb-qq/r8152/wiki/Troubleshooting) page may help.

***NOTE***: I recommend using front ports to connect devices because some users reported stability issues when they use rear ports.

## Supported RTL8156(2.5Gbps) based devices

**INFO**: Products using **RTL8156BG** have dramatically lower power consumption(up to 64% decrease) and heat generation than those using RTL8156.

* [ASUSTOR AS-U2.5G](https://amzn.to/2ZRx1pi) (RTL8156/Type-C to A)
  * NOTE: The included Type A-C conversion adapter is directional. There's a mark on one side of the USB-C connector that must be on the same side as the USB logo on the adapter.
* [ASUSTOR AS-U2.5G2](https://amzn.to/3u5wUH4) (RTL8156B/Type-C to A)
  * NOTE: Same above.
* [CLUB 3D CAC-1420](https://amzn.to/2ZPmzKD) (RTL8156/Type-A)
* [TRENDnet TUC-ET2G](https://amzn.to/2PLmR5v) (RTL8156(V1.0)/RTL8156BG(V2.0)/Type-C)
  * NOTE: Customer support states that RTL8156BG was adopted in V2.0. However, there is no way to distinguish V1.0 from V2.0. Can we expect the new ones to be v2.0? 
* [ASUS USB-C2500](https://amzn.to/45TS6Nv) (RTL8156B/Type-A)
* [CableCreation 2.5G Ethernet to USB Adapter](https://amzn.to/39yfZyj) (RTL8156/Type-A)
* [UGREEN USB C to 2.5G Ethernet Adapter (2019)](https://amzn.to/3fzXmfE) (RTL8156/Type-C)
* [UGREEN USB C to Ethernet Adapter 2.5G (2023)](https://amzn.to/3QHSElc) (RTL8156BG/Type-C)
* [Anker USB C to 2.5 Gbps Ethernet Adapter](https://amzn.to/3QK7qrZ) (RTL8156/Type-C)
* [StarTech.com US2GC30](https://amzn.to/46XTsYX) (RTL8156BG/Type-C)
* [Plannex USB-LAN2500R](https://amzn.to/2ZISyAb) (RTL8156/Type-A, only in Japan.)
* [Plannex USB-LAN2500R2](https://amzn.to/47c14GU) (RTL8156BG/Type-A, only in Japan.)
* [Buffalo LUA-U3-A2G](https://amzn.to/36kGQf9) (RTL8156/Type-A, only in Japan.)
* [biaze KZ13](https://alexnld.com/product/biaze-kz13-usb-external-2-5g-network-adapter-usb-to-rj45-converter-rj45-network-port-hub-usb-gigabit-wired-network-card-for-macbook-surface-lenovo-asus-computers/) (Type-A, only in China)

See the [Compatibility page](https://github.com/bb-qq/r8152/wiki/Compatibility) for the latest information.
* If you have other products not listed and they do not work, please create an issue with the output of lsusb.
* If you are using a product with a Type-C connector, you will need a connector or cable to convert it to Type-A.
  * For stable device operation, I recommend using a USB 3.2gen2 10Gbps compatible cable.
  * A 5Gbps cable is sufficient for this driver to work, but a 10Gbps capable cable can be expected to have higher transmission quality.

## How to install

### Preparation

[Enable SSH](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General_Setup/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) and login your NAS.

### Installation

1. Go to "Package Center"
2. Press "Manual Install"
3. Choose a driver package downloaded from the [release page](https://github.com/bb-qq/r8152/releases).
4. [DSM7] The installation will fail the first time. After that, run the following command from the SSH terminal:
   * `sudo install -m 4755 -o root -D /var/packages/r8152/target/r8152/spk_su /opt/sbin/spk_su`
5. [DSM7] Retry installation. 
   * You don't need the above DSM7-specific steps at the next time.
6. Reboot your NAS.
   * This procedure is not usually necessary, but many have reported that a reboot was necessary, so please reboot just in case.

https://www.synology.com/en-us/knowledgebase/SRM/help/SRM/PkgManApp/install_buy

*Warning*: Do not use Safari for this operation.

## How to configure

You can configure the IP addresses and MTU of the added NICs from the DSM UI in the same way as the built-in NICs.

Option: I recommend setting MTU to 9000 and SMB protocol version to v3 for better performance.

## Performance test

### Environment
* DS918+ (USB-LAN2500R)
* DSM 6.2
* direct connection with PC (AQN-107: discontinued, but almost equivalent to [ASUS XG-C100C](https://amzn.to/3fPJUX3))
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
