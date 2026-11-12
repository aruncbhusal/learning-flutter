# Clima ☁️

A weather application built with Flutter that displays current weather conditions based on the device's location or a city selected by the user.

This was my first project involving external APIs and device location services. Until now, most of the applications had been fairly self-contained. Clima introduces the fun of dealing with asynchronous operations, network requests and data that doesn't always arrive when we expect it to.

## 🖼️ Preview

<p align="center" style="display: flex; flex-direction: row; justify-content: space-around;">
  <img src="../docs/media/day_6_clima/screen.png" height="420" alt="Clima weather screen">
  <img src="../docs/media/day_6_clima/demo.gif" height="420" alt="Clima app demonstration">
</p>

## 🌤️ Features

- **Current Location:** Fetches the device's coordinates and retrieves weather information for that location.
- **City Search:** Search for a city and retrieve its current weather conditions.
- **Weather Conditions:** Displays the temperature, a corresponding weather emoji and a contextual message.
- **Dynamic Backgrounds:** Different background images are used for the weather screen and city search screen.
- **Loading Indicator:** Displays a loading animation while the initial location and weather information are being retrieved.

The temperature is displayed in Celsius, and the accompanying message changes depending on the temperature. So you get the occasional reminder to bring a jacket, or perhaps to find an ice cream shop.

## 🌍 How It Works

The app uses the [OpenWeatherMap API](https://openweathermap.org/api) for weather information and geocoding, alongside the Geolocator package for retrieving the device's location.

There are two ways to retrieve weather information:

**1. Current Location**

When the application starts, `LoadingScreen` retrieves the device's current location using Geolocator. The resulting latitude and longitude are then used to make a request to OpenWeatherMap's current weather endpoint.

**2. City Search**

The user can navigate to `CityScreen`, enter a city name and submit it. The app first uses OpenWeatherMap's Geocoding API to resolve the city into latitude and longitude coordinates. Those coordinates are then used to retrieve the weather information through the same current-weather endpoint.

This means both methods eventually use the same weather retrieval logic, rather than maintaining two separate implementations.

The API response is in JSON format. After decoding it, the app extracts the temperature, city name and weather condition ID. The condition ID is mapped to an emoji, while the temperature is used to generate a contextual message.

## 🧱 Project Structure

The code is divided into screens, services and utilities:

```text
lib/
├── screens/
│   ├── city_screen.dart
│   ├── loading_screen.dart
│   └── location_screen.dart
├── services/
│   ├── location.dart
│   ├── networking.dart
│   └── weather.dart
├── utilities/
│   └── constants.dart
└── main.dart
```

| File                   | Responsibility                                                           |
| ---------------------- | ------------------------------------------------------------------------ |
| `main.dart`            | Application entry point and theme                                        |
| `loading_screen.dart`  | Initial loading state and location-based weather retrieval               |
| `location_screen.dart` | Displays weather information and handles city/current-location selection |
| `city_screen.dart`     | Accepts city name input                                                  |
| `location.dart`        | Retrieves the device's geographic coordinates                            |
| `networking.dart`      | Handles HTTP requests and JSON decoding                                  |
| `weather.dart`         | Coordinates weather retrieval, geocoding, weather icons and messages     |
| `constants.dart`       | Shared text styles, input decoration and API key                         |

## ⚙️ Implementation Details

### Asynchronous Programming

Both location retrieval and API requests are asynchronous operations. Instead of blocking the UI while waiting for these operations, the app uses Dart's `Future`, `async` and `await` to handle their results.

The initial screen performs its retrieval operation inside `initState()`. Since `initState()` itself cannot be declared `async`, the asynchronous work is delegated to a separate method.

A `SpinKitCubeGrid` loading animation from `flutter_spinkit` is displayed until the weather data is retrieved and the app navigates to the main screen.

### Networking and JSON

The `NetworkHelper` class uses the `http` package to perform GET requests. It checks the HTTP response status and uses `jsonDecode()` from `dart:convert` to convert the JSON response into Dart objects.

The `WeatherModel` class handles the actual weather-related logic, including:

- Retrieving location-based weather.
- Resolving city names into geographic coordinates.
- Mapping weather condition IDs to emojis.
- Generating messages based on temperature.

### Passing Data Between Screens

The city search screen returns the entered city name using `Navigator.pop()`. The location screen awaits the result from `Navigator.push()` and then retrieves weather information for that city.

The weather response is also passed into `LocationScreen` when the application first loads, where it is processed and displayed.

## 🧠 What I Took Away

This project covered quite a few concepts that weren't part of the earlier applications:

- **Asynchronous Programming:** Understanding `Future`, `async` and `await`.
- **HTTP Requests:** Using the `http` package to communicate with external APIs.
- **JSON Parsing:** Decoding API responses and accessing their properties.
- **Geolocation:** Retrieving device coordinates using Geolocator and configuring location permissions.
- **Exception Handling:** Using `try`, `catch` and handling unsuccessful HTTP responses.
- **Widget Lifecycle:** Working with `initState()` when performing initialization tasks.
- **Navigation:** Passing information between screens using `Navigator.push()` and `Navigator.pop()`.
- **TextField:** Accepting user input through a customized text field.
- **Null Safety:** Handling potentially unavailable results from asynchronous operations.

I also had to adapt the original course code to newer versions of the packages and Flutter widgets, replacing deprecated button implementations and updating some styling APIs.

## ♻️ Reusing This Project

This directory contains the application's Dart source code and required assets. The platform-specific project scaffolding has intentionally been omitted to keep this repository focused on the application itself.

To use this project, create a fresh Flutter application and copy the relevant source files and resources into it.

### 1. Clone the repository

```bash
git clone https://github.com/aruncbhusal/learning-flutter.git
```

### 2. Create a new Flutter project

Navigate to the cloned repository and create a new Flutter application outside it:

```bash
cd learning-flutter
flutter create --project-name clima ../clima
```

Use the package name specified by the `name` field in this project's `pubspec.yaml`. This keeps the existing `package:` imports valid without having to rename them manually.

### 3. Copy the source code and assets

Copy the contents of this project's `lib/` directory into the newly created application's `lib/` directory.

Also copy any project-specific resource directories present in this folder, such as:

- `images/`
- `assets/`
- `fonts/`

Keep their directory names and relative paths unchanged, since the application may refer to them through its asset declarations.

The new project's generated `lib/main.dart` will be replaced by this project's entry point. Its platform-specific folders and configuration should otherwise remain intact.

### 4. Merge dependencies and asset declarations

Open this project's `pubspec.yaml` and add the required entries to the corresponding sections of the new application's `pubspec.yaml`.

In particular:

- Add the required packages from `dependencies`.
- Add any required development packages from `dev_dependencies`, if needed.
- Merge the asset and font declarations under `flutter`.

Do not replace the newly generated `pubspec.yaml` wholesale. Retain its project name, Dart SDK constraints, Flutter SDK dependency and other generated configuration.

Do not copy this project's `pubspec.lock`. The new application should resolve its own dependencies.

### 5. API Configuration

This project uses OpenWeatherMap. You'll need an API key from [OpenWeatherMap](https://openweathermap.org/api).

Open `lib/utilities/constants.dart` and replace the placeholder:

```dart
const OWA_API_KEY = '<API_KEY>';
```

with your own API key.

### Permissions

The platform-specific project files are not included in this repository. Add the required permissions to the corresponding files in your newly created Flutter project.

**Android:** Add the following permissions to `android/app/src/main/AndroidManifest.xml`, outside the `<application>` element:

```xml
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

**iOS**: Add the following entry to the dict in ios/Runner/Info.plist:
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location when open.</string>

Location services must also be enabled on the device.

### 7. Configure and run

Complete any additional setup described in this README, such as API keys, platform permissions or Firebase configuration.

Then navigate to the newly created application and run:

```bash
flutter pub get
flutter run
```

A connected device or configured emulator is required.

**Note:** These project directories are source templates, not standalone Flutter applications. They are intended to be used as a starting point for a new project rather than run directly from this repository.

## ⚠️ Notes & Limitations

- The application retrieves current weather conditions, not forecasts.
- City search depends on the OpenWeatherMap Geocoding API, followed by a separate weather request.
- Network and location failures are not yet handled comprehensively in the UI. Some errors are printed to the console, and unsuccessful API responses may not always produce a meaningful error screen.
- API availability and request limits depend on the OpenWeatherMap account and service.

## 📚 References & Acknowledgements

- [OpenWeatherMap API](https://openweathermap.org/api)
- [OpenWeatherMap Geocoding API](https://openweathermap.org/api/geocoding-api)
- [Geolocator](https://pub.dev/packages/geolocator)
- [HTTP package](https://pub.dev/packages/http)
- [Flutter Spinkit](https://pub.dev/packages/flutter_spinkit)
- [Flutter Networking Cookbook](https://docs.flutter.dev/cookbook/networking/fetch-data)
- [Clima starter repository](https://github.com/londonappbrewery/Clima-Flutter)

Built while following Angela Yu's [The Complete Flutter Development Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/). The original implementation was adapted to accommodate newer package versions and Flutter APIs.
