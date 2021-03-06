<img src="https://cdn.rawgit.com/dennisweissmann/DeviceKit/master/DeviceKit.svg" height="128">

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/dennisweissmann/DeviceKit/master/LICENSE)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DeviceKit.svg)](https://cocoapods.org/pods/DeviceKit)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![codecov](https://codecov.io/gh/dennisweissmann/DeviceKit/branch/master/graph/badge.svg)](https://codecov.io/gh/dennisweissmann/DeviceKit)
[![Maintainability](https://api.codeclimate.com/v1/badges/844e23a17bde71ff6be1/maintainability)](https://codeclimate.com/github/dennisweissmann/DeviceKit/maintainability)
[![Platform](https://img.shields.io/cocoapods/p/DeviceKit.svg?style=flat)](http://cocoadocs.org/docsets/DeviceKit)


| Branch | Build Status | Versions |
|:---------|:--------------:|:----------:|
| **master** |[![Build Status](https://travis-ci.org/dennisweissmann/DeviceKit.svg?branch=master)](https://travis-ci.org/dennisweissmann/DeviceKit)| - |
| **Swift 4** |[![Build Status](https://travis-ci.org/dennisweissmann/DeviceKit.svg?branch=swift-4)](https://travis-ci.org/dennisweissmann/DeviceKit)| ≥ 1.3.0 |
| **Swift 3** |[![Build Status](https://travis-ci.org/dennisweissmann/DeviceKit.svg?branch=swift-3)](https://travis-ci.org/dennisweissmann/DeviceKit)| ≥ 1.0 ≤ 1.2.3 |
| **Swift 2.3** |[![Build Status](https://travis-ci.org/dennisweissmann/DeviceKit.svg?branch=swift-2.3-unsupported)](https://travis-ci.org/dennisweissmann/DeviceKit)| < 1.0 |

`DeviceKit` is a value-type replacement of [`UIDevice`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/).

## Features

- [x] Device identification
- [x] Device family detection
- [x] Device group detection
- [x] Simulator detection
- [x] Battery state
- [x] Battery level
- [x] Equatable

## Requirements

- iOS 8.0+ / tvOS 9.0+ (linking against iOS 9.3 and tvOS 9.2 required)
- Xcode 8.0+

## Installation
DeviceKit can be installed in various ways.

### CocoaPods

#### Swift 4
```ruby
pod 'DeviceKit', '~> 1.3'
```
#### Swift 3
```ruby
pod 'DeviceKit', '~> 1.2.3'
```
#### Swift 2.3 (Unsupported)
```ruby
pod 'DeviceKit', :git => 'https://github.com/dennisweissmann/DeviceKit.git', :branch => 'swift-2.3-unsupported'
```

### Carthage

#### Swift 4
```ogdl
github "dennisweissmann/DeviceKit" ~> 1.3
```
#### Swift 3
```ogdl
github "dennisweissmann/DeviceKit" ~> 1.2.3
```
#### Swift 2.3 (Unsupported)
```ogdl
github "dennisweissmann/DeviceKit" "swift-2.3-unsupported"
```

### Manually
To install it manually drag the DeviceKit project into your app project in Xcode or add it as a git submodule.
In your project folder enter:
```bash
$ git submodule add https://github.com/dennisweissmann/DeviceKit.git
```

## Usage
First make sure to import the framework:
```swift
import DeviceKit
```

Here are some usage examples. All devices are also available as simulators:
```swift
.iPhone6 => .simulator(.iPhone6)
.iPhone6s => .simulator(.iPhone6s)
```

### Get the Device You're Running On
```swift
let device = Device()

print(device)     // prints, for example, "iPhone 6 Plus"

if device == .iPhone6Plus {
  // Do something
} else {
  // Do something else
}
```

### Get the Device Family
```swift
let device = Device()
if device.isPod {
  // iPods (real or simulator)
} else if device.isPhone {
  // iPhone (real or simulator)
} else if device.isPad {
  // iPad (real or simulator)
}
```

### Check If Running on Simulator
```swift
let device = Device()
if device.isSimulator {
  // Running on one of the simulators(iPod/iPhone/iPad) 
  // Skip doing something irrelevant for Simulator
} 
```

### Get the Simulator Device
```swift
let device = Device()
switch device {
case .simulator(.iPhone6s): break // You're running on the iPhone 6s simulator
case .simulator(.iPadAir2): break // You're running on the iPad Air 2 simulator
default: break
}
```
 
### Make Sure the Device Is Contained in a Preconfigured Group
```swift
let groupOfAllowedDevices: [Device] = [.iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .simulator(.iPhone6), .simulator(.iPhone6Plus), .simulator(.iPhone6s), .simulator(.iPhone6sPlus)]
let device = Device()
 
if device.isOneOf(groupOfAllowedDevices) {
  // Do you action
}
```

### Get the Current Battery State
**Note:**

> To get the current battery state we need to set `UIDevice.current.isBatteryMonitoringEnabled` to `true`. To avoid any issues with your code we read the current setting and reset it when we're done to what it was before..

```swift
if device.batteryState == .full || device.batteryState >= .charging(75) {
  print("Your battery is happy! 😊")
}
```

### Get the Current Battery Level
```swift
if device.batteryLevel >= 50 {
  install_iOS()
} else {
  showError()
}
```

### Get Low Power mode status
```swift
if device.batteryState.lowPowerMode {
  print("Low Power mode is enabled! 🔋")
} else {
  print("Low Power mode is disabled! 😊")
}
```

### Check if a Guided Access session is currently active
```swift
if device.isGuidedAccessSessionActive {
  print("Guided Access session is currently active")
} else {
  print("No Guided Access session is currently active")
}
```

### Get Screen Brightness
```swift
if device.screenBrightness < 50 {
  print("Take care of your eyes!")
}
```

## Source of Information
All model identifiers are taken from the following website: https://www.theiphonewiki.com/wiki/Models or extracted from the simulator app bundled with Xcode.

## Contributing
If you have the need for a specific feature that you want implemented or if you experienced a bug, please open an issue.
If you extended the functionality of DeviceKit yourself and want others to use it too, please submit a pull request.

## Contributors
The complete list of people who contributed to this project is available [here](https://github.com/dennisweissmann/DeviceKit/graphs/contributors). DeviceKit wouldn't be what it is without you! Thank you very much! 🙏

