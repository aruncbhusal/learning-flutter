# Mi Card

A digital business card built as an exercise in Flutter UI development. The idea is fairly straightforward: display a profile, a short professional title, and contact details in a single screen.

This project was also where I started getting more comfortable with Flutter's layout system, custom fonts, and Material widgets.

## 🖼️ Preview

<p align="center">
  <img src="../docs/media/day_3_mi_card/app.png" height="450" alt="Mi Card app preview">
</p>

## 🧱 Building the Layout

The app is built around a `StatelessWidget`, with a `Scaffold` and `SafeArea` containing a vertically aligned `Column`.

The layout consists of:

- A `CircleAvatar` displaying a local profile image.
- Text widgets for the name and professional title, styled with custom fonts.
- Two contact cards displaying phone and email details, each with a Material icon.

I initially built the contact sections manually using `Container`, `Row`, `Icon` and `Text` widgets. Later, I switched to `Card` and `ListTile`, which provided a cleaner way to achieve the same layout without manually arranging every element.

The project also includes a `Divider` to separate the profile section from the contact details.

## 🧪 Things I Explored

This wasn't just about putting a few widgets on the screen. Some of the exercises and concepts covered along the way:

- **Container:** Experimenting with dimensions, margins, padding and positioning.
- **Row and Column:** Understanding main-axis and cross-axis alignment, spacing and widget composition. There's also a separate layout challenge preserved as commented code in `main.dart`.
- **CircleAvatar:** Displaying a local image using `foregroundImage`.
- **Text and TextStyle:** Customizing fonts, sizes, colors and weights. Also discovered that `toUpperCase()` saves us from manually typing uppercase text.
- **Custom Fonts:** Registering and using `Quantico` and `Source Sans 3` through `pubspec.yaml`.
- **Material Widgets:** Using `Card`, `ListTile`, `Padding`, `Divider` and Material icons instead of building everything from scratch.

I also got introduced to hot reload and hot restart, and started getting into the habit of referring to Flutter's widget documentation rather than guessing available properties.

> The phone number and email displayed in the app are placeholder values.

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
flutter create --project-name mi_card ../mi_card
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

## 📚 References & Acknowledgements

- [Container](https://api.flutter.dev/flutter/widgets/Container-class.html)
- [Row and Column](https://api.flutter.dev/flutter/widgets/Column-class.html)
- [CircleAvatar](https://api.flutter.dev/flutter/material/CircleAvatar-class.html)
- [Flutter's Custom Fonts guide](https://docs.flutter.dev/cookbook/design/fonts)

The project was initially cloned from [App Brewery's](https://www.appbrewery.co/) starter repository to obtain the starting structure and assets. The implementation was then modified while following Angela Yu's [The Complete Flutter Development Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/).

More detailed learning notes are available in [`notes.md`](../notes.md#day-3).
