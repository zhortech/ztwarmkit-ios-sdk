# ZTWarmKit

[![Platforms](https://img.shields.io/cocoapods/p/ZTWarmKit.svg)](https://cocoapods.org/pods/ZTWarmKit)
[![License](https://img.shields.io/cocoapods/l/ZTWarmKit)](https://raw.githubusercontent.com/zhortech/ztwarmkit-ios-sdk/main/LICENSE)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/ZTWarmKit.svg)](https://cocoapods.org/pods/ZTWarmKit)

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 13.0+
- Xcode 11.0+

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate ZTWarmKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

pod 'ZTWarmKit', :git => "https://github.com/zhortech/ztwarmkit-ios-sdk.git"
```
Please add post install script at the end of `Podfile` if there is problem to use  library:

```ruby
post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use ZTWarmKit as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZTWarmKit",
    dependencies: [
        .package(url: "https://github.com/zhortech/ztwarmkit-ios-sdk.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(name: "ZTWarmKit", dependencies: ["ZTCoreKit"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate ZTWarmKit into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add ZTWarmKit as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/zhortech/ztwarmkit-ios-sdk.git
$ git submodule update --init --recursive
```

- Open the new `ZTWarmKit` folder, and drag the `ZTWarmKit.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `ZTWarmKit.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `ZTWarmKit.xcodeproj` folders each with two different versions of the `ZTWarmKit.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `ZTWarmKit.framework`.

- And that's it!

> The `ZTWarmKit.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/zhortech/ztwarmkit-ios-sdk/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `ZTWarmKit.framework`.
- And that's it!

</p></details>

## Usage

### Start/Stop heating

 Call `startHeat(temperature:completion:)` to set temperature (in celcius) and start heating:
```swift

ZTWarm.shared.startHeat(temperature: 30) { error in
    debugPrint("Heating started, error: \(error?.localizedDescription ?? "")")
}

```
There is a way to set timer on insoles by calling `setTimer(seconds:enable:)`. Temperature should be set before calling this method.
When timer ends - heating will be stopped. If timer value `enable` is false - timer won't work.
```swift

ZTWarm.shared.setTimer(seconds: 60, enable: true) { error in
    debugPrint("Heating \(enable ? "started" : "stopped"), error: \(error?.localizedDescription ?? "")")
}
```

If you need to check temperature which was set use `ZTWarm.shared.getTargetTemperature`:
```swift

ZTWarm.shared.getTargetTemperature { temperature, error in
    debugPrint("Temperature set value = \(temperature ?? 0), error: \(error?.localizedDescription ?? "")")
}
```

If you need to check remaining timer value ( in seconds) use `ZTWarm.shared.getTimer`.
```swift

ZTWarm.shared.getRemainingTimer { seconds, error in
    debugPrint("Timer will stop in \(seconds ?? 0), error: \(error?.localizedDescription ?? "")")
}
```

## Author

ZhorTech [@zhortech](https://twitter.com/zhortech)

## License

ZTWarmKit is released under the MIT license. See [LICENSE](https://github.com/zhortech/ztwarmkit-ios-sdk.git/blob/master/LICENSE) for details.
