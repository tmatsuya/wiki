ifneq ($(KERNELRELEASE),)
obj-m		:= pcietest.o
else
KDIR		:= /lib/modules/$(shell uname -r)/build/
PWD		:= $(shell pwd)

all: user
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) V=1 modules

user: user.c
	gcc -O -o user user.c

clean:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean 
	rm -f user.o user

install:
	install -m 644 $(PWD)/*.ko /lib/modules/`uname -r`/kernel/drivers/misc
	if [ -d /etc/udev/rules.d -a ! -f /etc/udev/rules.d/99-pcietest.rules ] ; then \
		install -m 644 99-pcietest.rules /etc/udev/rules.d ; \
	fi
	depmod -a
endif
