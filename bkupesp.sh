#!/bin/bash

#PORT=/dev/tty.wchusbserial141140
#PORT=/dev/tty.wchusbserial14140
PORT=/dev/tty.SLAB_USBtoUART

esptool.py --port ${PORT} --baud 115200 chip_id > bkupesp.tmp
CHIP_ID=$(cat bkupesp.tmp | grep "Chip ID: 0x" | cut -d "x" -f2-)

echo CHIP_ID=$CHIP_ID

if test -z "$CHIP_ID"
then
    CHIP_ID=$(cat bkupesp.tmp | grep "MAC: " -m 1 | cut -d " " -f2 | cut -c 1,2,4,5,7,8,10,11,13,14,16,17)
    echo CHIP_ID=$CHIP_ID
    echo "using mac address"
else
    echo "using chipid"
fi

BKUP_NAME=backup_orig_${CHIP_ID}.bin

if test -z "$CHIP_ID"
then
    echo "Chip ID or MAC not found, backup aborted"
else
    esptool.py --port ${PORT} --baud 115200 read_flash 0x0 0x400000 ${BKUP_NAME}
    #esptool.py --port ${PORT} --baud 115200 read_flash 0x0 0x400000 ${BKUP_NAME}
    echo Backup in ${BKUP_NAME}
fi
