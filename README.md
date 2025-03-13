# firetv-remapper
Remap Fire TV remote keys to launch specific applications using ADB

![grafik](https://github.com/user-attachments/assets/5c4ae020-83d3-47f1-bced-6724732fa814)


## 1. How to Install and Use with ADB

### Step 1: Enable ADB on Fire TV
1. Go to **Settings** > **My Fire TV** > **Developer Options**.
2. Enable **ADB Debugging**.
3. Find the Fire TV IP address under **Settings** > **Network**.

### Step 2: Connect to Fire TV via ADB
Run the following command from your computer:
```sh
adb connect <FIRE_TV_IP>
```

### Step 3: Push and Run the Script
```sh
adb push firetv-remapper.sh /sdcard/
adb shell "sh /sdcard/firetv-remapper.sh"
```

![grafik](https://github.com/user-attachments/assets/c4fb7f25-76eb-4aeb-a2f5-fba88bcfbd69)


## 2. How to Get Other Apps

To launch a different app, find its package name using:
```sh
adb shell pm list packages | grep <app_name>
```

To get the full launcher activity, run:
```sh
adb shell dumpsys package <package_name> | grep -A 10 MAIN
```

For example, to launch VLC:
```sh
adb shell am start -n org.videolan.vlc/.gui.MainActivity
```

## 3. How to Get Other Key Codes

To find key events for Fire TV remote buttons, use:
```sh
adb shell getevent -l
```
Press the desired button on your Fire TV remote and look for a key code like:
```
KEY_746
```
Alternatively, check system logs:
```sh
adb shell logcat -v brief | grep "KEYCODE"
```

## 4. Examples

### Example 1: Remap a Key to Open VLC
```sh
adb shell sh /sdcard/firetv-remapper.sh KEYCODE_MEDIA_PLAY org.videolan.vlc/.gui.MainActivity
```

### Example 2: Remap a Key to Open YouTube
```sh
adb shell sh /sdcard/firetv-remapper.sh KEYCODE_HOME com.google.android.youtube.tv/com.google.android.apps.youtube.tv.activity.ShellActivity
```

### Example 3: Remap a Custom Key to Open Netflix
```sh
adb shell sh /sdcard/firetv-remapper.sh KEYCODE_PROG_RED com.netflix.ninja/.MainActivity
```
