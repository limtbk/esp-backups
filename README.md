# esp-backups
Setup:
install esptool
generate nodemcu firmware
https://nodemcu.readthedocs.io/en/master/en/build/
http://nodemcu-build.com/

pySerial osx

Test:
./esptool.py --port /dev/tty.SLAB_USBtoUART --baud 921600 chip_id

./esptool.py --port /dev/tty.SLAB_USBtoUART --baud 921600 flash_id

Backup 4Mb chip
./esptool.py --port /dev/tty.SLAB_USBtoUART --baud 921600 read_flash 0x0 0x400000 backup_orig_000589fc.bin



Upload new firmware

./esptool.py --port /dev/tty.SLAB_USBtoUART --baud 921600 write_flash -fm dio 0x00000 firmware.bin
