# internship-homework
Homework assignment for Mobile Application Engineer internship at Bigbank

## Stock Watch Application

### Technologies Used
- VSCode
- Flutter Framework
- Dart
- Finnhub API

### Description
A simple mobile application that lets the user search for a stock symbol and see its current price and info as well as add the stock to their watch list that displays the lowest and highest price of the day.

The Finnhub API is integrated through `finnhub_service.dart` that gets the stock quote.
- `GET /quote?symbol={SYMBOL}`
- the response looks something like this:

```
{
  "c": 261.74,
  "h": 263.31,
  "l": 260.68,
  "o": 261.07,
  "pc": 259.45,
  "t": 1582641000 
}
```
where "c" is the key for current price, "h" for highest price today and "l" lowest price today.

> **Note:** The file containing the API key was sent to you via email. See the steps on how to run the app down below.
> In case the API key does not work contact me or generate one yourself at [https://finnhub.io]

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
- In VSCode, make sure Flutter by Dart Code plugin is installed.

#### Verify Setup
Run the following in the project terminal in VSCode to check everything is installed:
```
flutter doctor
```
> `[✗] Android toolchain` can be ignored since Android is not supported.

#### Run the App
1. Copy the .env file sent to you via email into internship-homework/flutter_project/ (replacing .env.example, or renaming it to .env)
2. In VS Code, change the device in the bottom right corner to your iOS simulator (Start iOS Simulator)
3. Navigate to the project folder if you are not there already:
```
   cd flutter_project
```
4. Run the app:
```
   flutter run
```
> If any framework files are missing:
>```
>  flutter create .
>```
>and flutter run again

5. Search up a stock symbol (e.g. 'AAPL', 'GOOGL', 'MSFT'). The search is case-insensitive.
If you wish to save the stock in your watchlist, press the star icon. This action can be undone in both the search and in the watchlist itself.
