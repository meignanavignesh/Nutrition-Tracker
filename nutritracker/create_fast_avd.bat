@echo off
echo Creating fast AVD for NutriTracker...

REM Create AVD with optimal settings for speed
avdmanager create avd ^
  -n NutriTracker_Fast ^
  -k "system-images;android-30;google_apis;x86_64" ^
  -d "pixel_3a" ^
  -c 2048M

echo AVD created successfully!
echo.
echo To start the emulator, run:
echo emulator -avd NutriTracker_Fast -gpu host -memory 1536 -cores 4
pause