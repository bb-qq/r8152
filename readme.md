# DSM driver for realtek RTL8152/8153/8156/8157/8159 based USB Ethernet adapters

This is a Realtek USB ethernet driver package for Synology NAS devices.

* RTL8152/RTL8153: 1.0Gbps
* RTL8156: 2.5Gbps
* RTL8157: 5Gbps
* RTL8159: 10Gbps
  * NOTE: No Synology device supports USB 3.2 Gen2, so you won't be able to get the most out of it.
  
You might also be interested in my other projects:
* [AQC111U(5Gbps ethernet) driver package for Synology NASes](https://github.com/bb-qq/aqc111)
* [UASP(USB Attached SCSI Protocol for external storage devices) driver package for Synology NASes](https://github.com/bb-qq/uas)

## ⚠️**WARNING**

It has been confirmed that this driver has been modified and repackaged on other websites.

Since this driver works with root privileges, **DO NOT USE IT OBTAINED FROM OTHER WEBSITES**.

Even if there are no problems now, there is a possibility that malicious code will be added through automatic updates.

If you have installed it, I strongly recommend resetting your Synology system partition.

## Supported NAS platform

* DSM 7.x and 6.2
* Almost all models released after 2017.
  * Older models may also work, but you might not experience optimal performance.
  * [Compatibility reports](https://github.com/bb-qq/r8152/wiki/Compatibility) by the community will help you.

You can download the drivers from the [release page](https://github.com/bb-qq/r8152/releases) and determine the appropriate driver for your model from [Synology knowledge base](https://www.synology.com/en-global/knowledgebase/DSM/tutorial/Compatibility_Peripherals/What_kind_of_CPU_does_my_NAS_have), 

I would appreciate it if you could let me know whether it works. If you have any problems, the [Troubleshooting](https://github.com/bb-qq/r8152/wiki/Troubleshooting) page may help.

***NOTE***: I recommend connecting devices using front ports because some users have reported stability issues when using rear ports.

### Author's environment

The author uses the following environment daily and it has confirmed that these devices work stably.

*Disclaimer*: The following product links are affiliate links. If you purchase through them, I might earn a small commission at no extra cost to you.

* NAS
  * DS918+ (apollolake) with 16GB RAM
  * DSM 7.2-64570 Update 3
  * Ethernet dongle
    * USB-LAN2500R2 (RTL8156BG, only in Japan.)
* PC
  * Ethernet card
    * [AQN-107](https://amzn.to/3RNLg7u) (discontinued, but almost equivalent to [ASUS XG-C100C](https://amzn.to/3fPJUX3))
  * Windows10 SMB3
* Network switches
  * main: [QNAP QSW-2104-2T](https://amzn.to/3Sam3W0) (Broadcom `BCM53161`: x3 2.5Gbe / x2 10Gbe)
  * sub: [keepLINK 5 Port 2.5G Switch](https://amzn.to/41PHpv6) (Realtek `RTL8372`: x5 2.5Gbe / x1 10G SFP+)
    * If you are looking for an affordable 2.5Gbe switch, I recommend products using the RTL837x family, which is a newer generation of chips and consumes less power. Many other products are available from many vendors.
  * cable: [Ubiquiti Networks UC-PATCH Cat6 Cable](https://amzn.to/3Xyybla)

## Supported devices

See the [Compatibility page](https://github.com/bb-qq/r8152/wiki/Compatibility) for the latest information.

* If you have other products not listed and that do not work, please create an issue with the output of `lsusb`.
* If you use a product with a Type-C connector, you will need a connector or cable to convert it to Type-A.
  * For stable device operation, I recommend using a USB 3.2 Gen2 10Gbps compatible cable.
  * While a 5Gbps cable is sufficient for this driver to work, a 10Gbps capable cable is expected to offer higher transmission quality.

### RTL8156(2.5Gbps) based devices

**INFO**: Products using RTL8156**BG** have dramatically lower power consumption (up to a 64% decrease) and generate less heat compared to those using RTL8156.

* [ASUSTOR AS-U2.5G](https://amzn.to/2ZRx1pi) (RTL8156/Type-C to A)
  * NOTE: The included Type A to C conversion adapter is directional. There is a mark on one side of the USB-C connector that must face the same side as the USB logo on the adapter.
* [ASUSTOR AS-U2.5G2](https://amzn.to/3u5wUH4) (RTL8156B/Type-C to A)
  * NOTE: Same as above.
* [CLUB 3D CAC-1420](https://amzn.to/2ZPmzKD) (RTL8156/Type-A)
* [TRENDnet TUC-ET2G](https://amzn.to/2PLmR5v) (RTL8156(V1.0)/RTL8156BG(V2.0)/Type-C)
  * NOTE: Customer support states that RTL8156BG was adopted in V2.0. However, there is no way to distinguish V1.0 from V2.0. Can we assume the new ones to be v2.0? 
* [ASUS USB-C2500](https://amzn.to/45TS6Nv) (RTL8156B/Type-A)
* [CableCreation 2.5G Ethernet to USB Adapter](https://amzn.to/39yfZyj) (RTL8156/Type-A)
* [UGREEN USB C to 2.5G Ethernet Adapter (2019)](https://amzn.to/3fzXmfE) (RTL8156/Type-C)
* [UGREEN USB C to Ethernet Adapter 2.5G (2023)](https://amzn.to/3QHSElc) (RTL8156BG/Type-C)
* [Anker USB C to 2.5 Gbps Ethernet Adapter](https://amzn.to/3QK7qrZ) (RTL8156/Type-C)
* [StarTech.com US2GC30](https://amzn.to/46XTsYX) (RTL8156BG/Type-C)
* [Plannex USB-LAN2500R](https://amzn.to/2ZISyAb) (RTL8156/Type-A, only in Japan.)
* [Plannex USB-LAN2500R2](https://amzn.to/47c14GU) (RTL8156BG/Type-A, only in Japan.)
* [Buffalo LUA-U3-A2G](https://amzn.to/36kGQf9) (RTL8156/Type-A, only in Japan.)
* biaze KZ13 \[ [link1](https://alexnld.com/product/biaze-kz13-usb-external-2-5g-network-adapter-usb-to-rj45-converter-rj45-network-port-hub-usb-gigabit-wired-network-card-for-macbook-surface-lenovo-asus-computers/) [link2](https://digitalzakka.com/product/biaze-kz13-2-5g-usb-external-network-adapter-rj45-converter-hub-gigabit-wired-network-card/) \] (Type-A, only in China)
* [ULT-WIIQ USB 2.5G Ethernet Adapter](https://amzn.to/3HfEW3G) (RTL8156B/Type-A, only in Europe?)

### RTL8157(5Gbps) based devices

If you find other products, please let me know.

* WisdPi WP-UT5 \[ [Amazon](https://amzn.to/3TA3RWh) [AliExpress](https://s.click.aliexpress.com/e/_DDQpNWZ) \] (RTL8157/Type-A and C)
* [WAVLINK/WiNSTARS WS-NWU340G](https://amzn.to/3MVG5QF) (RTL8157/Type-C)

**KNOWN ISSUES**:
* Link speeds are not reported correctly.
* Using [the beta release driver](https://github.com/bb-qq/r8152/releases/tag/2.18.1-2) is required to enable Jumbo Frame.

## How to install

### Preparation

[Enable SSH](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General_Setup/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) and log in to your NAS.

### Installation

1. Go to "Package Center"
2. Press "Manual Install"
3. Choose a driver package downloaded from the [release page](https://github.com/bb-qq/r8152/releases).
4. [DSM7] The installation will fail the first time. After that, run the following commands from the SSH terminal:
   * `sudo install -m 4755 -o root -D /var/packages/r8152/target/r8152/spk_su /opt/sbin/spk_su`
   * `sudo chmod a+rx /opt /opt/sbin`
5. [DSM7] Retry the installation. 
   * You don't need the above DSM7-specific steps at the next time.
6. Reboot your NAS.
   * This procedure is not usually necessary, but many users have reported that a reboot was necessary, so please reboot just in case.
7. Open the driver package from the Package Center and start the driver manually. 
   * Or run the following comannd from the SSH terminal:
     * `synosystemctl enable pkgctl-r8152` (DSM 7.x) 

https://www.synology.com/en-us/knowledgebase/SRM/help/SRM/PkgManApp/install_buy

*Warning*: Do not use Safari for this operation.

## How to configure

You can configure the IP addresses and MTU of the added NICs from the DSM UI in the same way as the built-in NICs.

Option: I recommend setting the MTU to 9000 and the SMB protocol version to v3 for better performance.

## Performance test

### Environment
* DS918+ (USB-LAN2500R)
* DSM 6.2
* direct connection to PC (AQN-107: discontinued, but almost equivalent to [ASUS XG-C100C](https://amzn.to/3fPJUX3))
* [native iperf3](http://www.jadahl.com/iperf-arp-scan/DSM_6.2/)
    * using Docker causes a high CPU load

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
