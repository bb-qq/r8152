#!/bin/bash
# Copyright (c) 2000-2017 Synology Inc. All rights reserved.

source /pkgscripts-ng/include/pkg_util.sh

package="r8152"
version="2.15.0-3"
displayname="RTL8152/RTL8153 driver"
maintainer="bb-qq"
arch="$(pkg_get_platform)"
install_type="package"
thirdparty="yes"

[ "$(caller)" != "0 NULL" ] && return 0

if [ "${PRODUCT_VERSION}" = "7.0" ]; then
    os_min_ver="7.0-40000"
    RUN_AS="package"
    INSTRUCTION=' [DSM7 note] If this is the first time you are installing this driver, special steps are required. See the readme for details.'
else
    RUN_AS="root"
fi

cat <<EOS > `dirname $0`/conf/privilege
{
    "defaults": {
        "run-as": "${RUN_AS}"
    }
}
EOS

cat <<EOS > `dirname $0`/SynoBuildConf/depends
[default]
all="${PRODUCT_VERSION}"
EOS

description="Realtek RTL8152/RTL8153 Based USB Ethernet Adapters driver.${INSTRUCTION}"

pkg_dump_info
