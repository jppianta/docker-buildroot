#!/bin/bash

alias emulate_qemu='qemu-system-i386 --kernel /buildroot/output/images/bzImage --hda /buildroot/output/images/rootfs.tar --nographic --append "console=ttyS0 root=/dev/sda"'
