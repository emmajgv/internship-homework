# internship-homework
Homework assignment for Mobile Application Engineer internship at Bigbank

## Stock Watch Application

### Technologies Used
- VSCode
- Flutter Framework
- Dart
- Finnhub API

### Description
A simple mobile application that lets the user search for a stock symbol and see its current price and info. The Finnhub API is integrated through `finnhub_service.dart`.

> **Note:** The API key in `finnhub_service.dart` is currently a placeholder. You will need a valid Finnhub API key to run the app. You can get a free one at [finnhub.io](https://finnhub.io).

### How to Run

> Currently the project supports iOS only.

#### Prerequisites
- Xcode installed with an iPhone simulator set up (iPhone 16e simulator was used during development)
- If on a Mac with an M1/M2/M3 chip, install Rosetta:
```
  softwareupdate --install-rosetta
```
- Install CocoaPods via Homebrew:
```
  brew install cocoapods
```

#### Verify Setup
Run the following in the project terminal to check everything is installed:
```
flutter doctor
```
> `[✗] Android toolchain` can be ignored — Android is not supported.

#### Run the App
1. In VS Code, change the device in the bottom right corner to your iOS simulator (Start iOS Simulator)
2. Navigate to the project folder:
```
   cd flutter_project
```
3. Run the app:
```
   flutter run
```
