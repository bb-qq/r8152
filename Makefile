#
#
#

TARGET := r8152.ko
CONFIG_CTAP_SHORT = ON

obj-m	 := r8152.o
#	EXTRA_CFLAGS += -DRTL8152_S5_WOL
#	EXTRA_CFLAGS += -DRTL8152_DEBUG
ifneq (,$(filter OFF off, $(CONFIG_CTAP_SHORT)))
	EXTRA_CFLAGS += -DCONFIG_CTAP_SHORT_OFF
endif

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

