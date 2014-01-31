example for automation browser acceptance test

## How to use

### Firefox

`rake`

Require
 - ruby 2.0 later

### iPhone Simulator

`rake device=iphonesimulator`

Require
 - node.js v0.10 later
 - xcode 4.6.3
  - command line tools
 - appium 0.14.2
  - download GUI app from http://appium.io/

### Android

`rake device=android`

Require
 - android sdk
  - adb
 - anroid-webserver
  - download apk from https://code.google.com/p/selenium/downloads/list
  - try `adb install android-server-2.21.0.apk`
