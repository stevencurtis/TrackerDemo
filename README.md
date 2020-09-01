## TrackerDemo


# Installation

## 1. Download
Download the Zip archive from your web client / browser as appropriate, and save to a suitable location on your machine.

## 2. Refresh Third Party Frameworks
This application uses cocoapods for dependencies, and these have been included in the zip file but it is good practice to `pod install` from the command line to refresh the Pods. 
The frameworks used are `GoogleMaps`, `RxSwift`, `RxCocoa`, `RxTest` and `RxBlocking`.
Full details on how to install `CocoalPods` is avaliable [at cocoapods.org](https://cocoapods.org)

## 3. API Key
The API key is **not** included in this repo. To use a Google Maps API Key one may be obtained from [The Google Developer site](https://developers.google.com/maps/documentation/embed/get-api-key), or has been sent to you by the author.

This should be placed into a file called `APIKey.Swift` with the following format
```swift
let key = "YourKey"
```



# Usage
Traverse to the folder the files have been saved in. Open `TrackerDemo.scworkspace`, using Xcode.

`⌘-U` runs the Unit tests from within Xcode

`⌘-R` runs the project

**Simulated locations**
The simulator can be set to provide location information, Features>Location>City Bicycle Ride simulates the simulator being taken on a City Bicycle ride.

# Restrictions
- Runs in Xcode11
- Git used for source control
- GoogleMaps used
- Third Party frameworks listed

## Further restructions
- Portrait only
- iOS support only (no iPad OS)
- iOS Depolyment Target 13.0