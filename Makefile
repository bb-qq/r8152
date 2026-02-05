#
#
#

TARGET := r8152.ko
CONFIG_CTAP_SHORT = ON
ccflags-y += -std=gnu99

#ifneq ($(KERNELRELEASE),)
	obj-m	 := r8152.o
#	ccflags-y += -DRTL8152_S5_WOL
#	ccflags-y += -DRTL8152_DEBUG

	ifneq (,$(filter OFF off, $(CONFIG_CTAP_SHORT)))
		ccflags-y += -DCONFIG_CTAP_SHORT_OFF
	endif

#	ifeq (TRUE, $(shell test $(VERSION) -lt 5 && echo "TRUE" || \
#		test $(VERSION) -eq 5 && test $(PATCHLEVEL) -lt 12 && echo "TRUE"))
		ccflags-y += -DLINUX_VERSION_MAJOR=$(VERSION)
		ccflags-y += -DLINUX_VERSION_PATCHLEVEL=$(PATCHLEVEL)
		ccflags-y += -DLINUX_VERSION_SUBLEVEL=$(SUBLEVEL)
#	endif
#else
#	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
#	PWD :=$(shell pwd)
#	TARGET_PATH := kernel/drivers/net/usb
#	INBOXDRIVER := $(shell find $(subst build,$(TARGET_PATH),$(KERNELDIR)) -name r8152.ko.* -type f)
#	RULEFILE = 50-usb-realtek-net.rules
#	RULEDIR = /etc/udev/rules.d/

.PHONY: all
all: modules spk_su

.PHONY: modules
modules: $(TARGET)

$(TARGET):
	$(MAKE) -C $(KSRC) M=$(PWD) modules

spk_su: spk_su.c
	$(CROSS_COMPILE)cc -std=c99 -o $(@) $(<)

.PHONY: clean
clean:
	rm -rf *.o $(TARGET)

.PHONY: install
install: $(TARGET) spk_su
	mkdir -p $(DESTDIR)/r8152/
	install $(^) $(DESTDIR)/r8152/
