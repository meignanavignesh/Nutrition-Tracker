# Android Emulator Setup Guide

## Prerequisites
1. Android Studio installed
2. Android SDK installed
3. Intel HAXM or Hyper-V enabled (for Windows)

## Steps to Create and Run Emulator

### 1. Open Android Studio
- Launch Android Studio
- Open your NutriTracker project

### 2. Open AVD Manager
- Click on "Tools" → "AVD Manager"
- Or click the AVD Manager icon in the toolbar

### 3. Create Virtual Device
- Click "Create Virtual Device"
- Choose a device (recommended: Pixel 4 or Pixel 6)
- Click "Next"

### 4. Select System Image
- Choose API Level 30 or higher (Android 11+)
- Download if not already available
- Click "Next"

### 5. Configure AVD
- Name: "NutriTracker_Emulator"
- Advanced Settings (optional):
  - RAM: 2048 MB or higher
  - Internal Storage: 2048 MB
  - SD Card: 512 MB
- Click "Finish"

### 6. Start Emulator
- Click the "Play" button next to your created AVD
- Wait for the emulator to boot up

### 7. Run Your App
- In Android Studio, click the "Run" button (green triangle)
- Select your emulator from the device list
- Click "OK"

## Alternative: Command Line Setup

```bash
# List available system images
sdkmanager --list | findstr "system-images"

# Create AVD via command line
avdmanager create avd -n NutriTracker_Emulator -k "system-images;android-30;google_apis;x86_64"

# Start emulator
emulator -avd NutriTracker_Emulator
```

## Troubleshooting
- If emulator is slow: Enable Hardware Acceleration in BIOS
- If app doesn't install: Check minimum SDK version compatibility
- If Firebase doesn't work: Ensure internet connection in emulator