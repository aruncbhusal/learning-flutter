# Xylophone 🎹

A simple musical instrument app built with Flutter. It has seven coloured keys, each corresponding to a different xylophone note. Tap a key, hear a sound. Tap several keys in succession and, with enough optimism, you might produce something resembling music.

## 🔊 Preview

Since a GIF would be rather disappointing for an instrument that produces sound, here's an MP4 recording instead:

[▶ Watch and listen to the Xylophone demo](../docs/media/day_4_xylophone/demo.mp4)

## 🎼 Implementation

The interface consists of seven vertically stacked buttons, each taking up an equal share of the available screen height. Every button is assigned a colour and a corresponding audio file (`note1.wav` through `note7.wav`).

Rather than repeating the same widget structure seven times, I created a `buildKey()` function:

```dart
Expanded buildKey({
  required Color color,
  required int keyNum,
}) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        playSound(keyNum);
      },
      child: Container(color: color),
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsetsGeometry.all(0.0),
        ),
      ),
    ),
  );
}
```

The function takes named arguments for the key's colour and note number, and returns an `Expanded` widget containing a `TextButton`. This keeps the layout consistent while allowing each key to be configured independently.

The `playSound()` function handles audio playback through the `audioplayers` package. It creates an `AudioPlayer`, selects the low-latency player mode and plays the corresponding asset using `AssetSource`.

## 🔧 Working Around Package Changes

This project turned out to be a bit more involved than simply adding a dependency.

The course used `audioplayers` version `0.17`, but I went with version `6.5.1` instead. By that point, the package had gone through several major versions, and the implementation shown in the course was no longer directly applicable.

I had to refer to the package's documentation and Getting Started guide to adapt the implementation to the newer API.

A few things I encountered along the way:

- **Flutter packages:** Adding external packages through `pubspec.yaml`, importing them and using their APIs.
- **Audio playback:** Creating an `AudioPlayer` and playing local audio assets using `AssetSource`.
- **Player modes:** Trying `PlayerMode.lowLatency` to reduce the delay between a button press and the sound playing.
- **Functions with named arguments:** Using `required` parameters and explicit types (`Color`, `int`) to make the reusable `buildKey()` function.
- **Widget composition:** Using `Expanded` and `TextButton` to generate equally sized, interactive keys.

I did notice some playback latency even after selecting low-latency mode. I'm not entirely sure whether this comes down to the player configuration or the way I'm creating a new `AudioPlayer` for every key press. Something worth revisiting.

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
flutter create --project-name xylophone ../xylophone
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

### 5. Configure and run

Complete any additional setup described in this README, such as API keys, platform permissions or Firebase configuration.

Then navigate to the newly created application and run:

```bash
flutter pub get
flutter run
```

A connected device or configured emulator is required.

**Note:** These project directories are source templates, not standalone Flutter applications. They are intended to be used as a starting point for a new project rather than run directly from this repository.

The audio files are included in the project's `assets/` directory and registered in `pubspec.yaml`. An internet connection is not required for playback.

## 📚 References & Acknowledgements

- [audioplayers](https://pub.dev/packages/audioplayers)
- [audioplayers Getting Started guide](https://github.com/bluefireteam/audioplayers/blob/main/getting_started.md)
- [Flutter: Using packages](https://docs.flutter.dev/packages-and-plugins/using-packages)
- [Xylophone starter repository](https://github.com/londonappbrewery/xylophone-flutter)

Built while following Angela Yu's [The Complete Flutter Development Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/). The original course example and starter assets were adapted to work with a newer version of `audioplayers`.
