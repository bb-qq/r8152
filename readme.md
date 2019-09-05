# realtek RTL8152/RTL8153/RTL8156 driver for Synology

This is a RTL8152/RTL8153/RTL8156 driver package for Synology NASes.

## How to install

1. Go to "Package Center"
2. Press "Manual Install"
3. Chose a driver package downloaded from the [release page](https://github.com/bb-qq/r8152/releases).

https://www.synology.com/en-us/knowledgebase/SRM/help/SRM/PkgManApp/install_buy

## How to configure

1. [Enable SSH](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General_Setup/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) and login your NAS
2. Configure IP address for eth2 interface with "synonet" command, which was created by this driver

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

Currently I only confirmed that a Japanese product "USB-LAN2500R" works. If you got other products and they do not work, please create a issue with its vendor id.

* [Plannex USB-LAN2500R](https://amzn.to/2ZISyAb) (Type-A, confirmed working, Japan only)
* [CLUB 3D CAC-1420](https://amzn.to/2ZPmzKD) (Type-A)
* [TUC-ET2G](https://amzn.to/2PLmR5v) (Type-C)
* [ASUSTOR AS-U2.5G](https://amzn.to/2ZRx1pi) (Type-C)
