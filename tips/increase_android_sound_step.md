# 1. Make sure your phone is rooted

[Rooting](https://en.wikipedia.org/wiki/Rooting_(Android))

# 2. Edit /system/build.prop

Use a root file explorer like [Root Browser](https://play.google.com/store/apps/details?id=com.jrummy.root.browserfree) or [vi](https://en.m.wikipedia.org/wiki/Vi) or via [adb](https://developer.android.com/studio/command-line/adb)

# 3. Write a config line

Append the following line to the file:

```
ro.config.media_vol_steps=X
```

Where `X` is the number of steps you would like to have in your phone

# 4. Reboot

Reboot the phone in order to apply the changes to your system
