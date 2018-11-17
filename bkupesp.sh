#!/bin/bash

#PORT=/dev/tty.wchusbserial141140
#PORT=/dev/tty.wchusbserial14140
PORT=/dev/tty.SLAB_USBtoUART

esptool.py --port ${PORT} --baud 921600 chip_id > bkupesp.tmp
CHIP_ID=$(cat bkupesp.tmp | grep "Chip ID: 0x" | cut -d "x" -f2-)

BKUP_NAME=backup_orig_${CHIP_ID}.bin

esptool.py --port ${PORT} --baud 921600 read_flash 0x0 0x400000 ${BKUP_NAME}
echo Backup in ${BKUP_NAME}
