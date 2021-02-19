# How to enable keyboard swipe on a no Google Apps phone

Based on [this Reddit thread](https://www.reddit.com/r/LineageOS/comments/9mgpbk/is_swipe_texting_possible_on_a_nongapps_install/)

## Requirements

* Have [root](https://magisk.me/) access
* Download [Open GApps](https://opengapps.org/) pico zip to your computer
* Have [adb](https://developer.android.com/studio/command-line/adb) on your computer

## Steps

1. Extract the open_gapps\*.zip
2. Head to Optional and extract swypelibs-lib-arm.tar.lz
3. Head to swypelibs-lib-arm/common/lib/
4. Push "libjni_latinimegoogle.so" to "/system/lib" on your phone by running:
```
adb devices
adb root # if received 'adbd cannot run as root in production builds', turn off MagiskHide, reboot, then Settings > Developer options > Root access > ADB only
adb remount
adb push libjni_latinimegoogle.so /system/lib/
adb unroot
adb kill-server
```
5. Reboot phone
6. On the phone head to Settings > Languages & Input > Virtual keyboard > Android keyboard (AOSP) > Gesture typing > enable it

## Tips

If `adb root` fails with a message "adbd cannot run as root in production builds", open Magisk Manager > Setings > uncheck Magisk Hide and reboot phone, an option to enable root access will show in Settings > System > Developer options > Root access.
