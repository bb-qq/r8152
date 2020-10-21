#!/bin/bash
# Copyright (c) 2000-2017 Synology Inc. All rights reserved.

source /pkgscripts-ng/include/pkg_util.sh

package="r8152"
version="2.14.0-1"
displayname="RTL8152/8153/8156 driver"
maintainer="bb-qq"
arch="$(pkg_get_platform)"
description="Realtek RTL8152/RTL8153/RTL8156 Based USB Ethernet Adapters driver."
[ "$(caller)" != "0 NULL" ] && return 0
pkg_dump_info
