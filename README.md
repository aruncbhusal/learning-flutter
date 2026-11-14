# Learning Flutter

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black)
![Android](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)

## Introduction

This repository documents my journey learning Flutter and Dart through app-based exercises and mini-projects. The primary reference for this journey is Angela Yu's [The Complete Flutter Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/) on Udemy.

I initialized this repository on **November 12, 2025**, and began learning Flutter the following day. The initial enthusiasm carried me through several projects, from basic UI layouts to APIs and networking, before life, classes, and a rather hike-heavy couple of weeks got in the way. I left the course somewhere around the Crypto Ticker project and didn't return for nearly eleven months.

On **October 24, 2026**, I finally picked it back up. What followed was a bit of rediscovery, a fair amount of wrestling with outdated course code and newer Flutter/Dart versions, and eventually the completion of the remaining projects. I finished the final project, WhaTodo, on **November 3, 2026**.

So, this wasn't exactly a year of consistent Flutter development. It was more of a start, a long pause, and a deliberate attempt to pick things back up and see them through. Fittingly, my first and last commits ended up being exactly one year apart!

Some projects follow the original course structure, while others involve adapting implementations to newer APIs, finding alternative packages, or building things from scratch.

The repository also serves as a learning journal. The [`notes.md`](./notes.md) file contains my notes, explanations, discoveries, and useful documentation links. Each project has its own README with implementation details, screenshots, and things I learnt along the way.

## 🧰 Development Environment

- **IDE:** Android Studio
- **Host OS:** Windows
- **Language:** Dart
- **Framework:** Flutter
- **Package Manager:** pub
- **Primary Target:** Android (physical device / emulator)

I currently develop and test on Android. Although some projects include iOS-specific UI components, I cannot build or test them on an actual iOS device without access to macOS and Xcode.

## 📊 Progress Tracker

- ![Progress](https://img.shields.io/badge/Course%20Progress-Day%209-brightgreen)
- ![Projects](https://img.shields.io/badge/Projects-13-blue)
- **Last Updated:** November 15, 2026
- **Current Status:** Course completed; repository archived for reference

## 🤯 Learning Progress

- **✅ Day 0–1:** Flutter and Dart introduction, environment setup, and running the first app.
- **✅ Day 2–3:** Basic Flutter widgets, Material Design, layouts, assets, fonts, and reusable UI components.
- **✅ Day 4:** Stateful and Stateless widgets, `setState`, user interactions, randomization, and audio playback.
- **✅ Day 5:** User input, custom widgets, object-oriented programming, navigation, conditional logic, and building complete app flows.
- **✅ Day 6:** Asynchronous programming, GPS and location services, HTTP requests, APIs, JSON, and screen navigation.
- **✅ Day 7:** REST APIs, exchange rates, dynamic UI generation, and platform-specific Material and Cupertino widgets.
- **✅ Day 8:** Firebase integration, authentication, Cloud Firestore, streams, real-time updates, and Flutter animations.
- **✅ Day 9:** State management with Provider and ChangeNotifier, callbacks, modal bottom sheets, and dynamic lists.

## 🖼️ Projects Included

### 1. Fundamentals and Layout

| Day | Project | What It Covers |
| --- | --- | --- |
| **2** | [I Am Rich](./day_2_i_am_rich/README.md) | Basic Material app structure, Scaffold, and displaying image assets. |
| **3** | [I Am Poor](./day_3_i_am_poor/README.md) | Layout composition, Columns, images, and text styling. |
| **3** | [Mi Card](./day_3_mi_card_flutter/README.md) | Building a personal card layout with custom fonts, icons, Cards, and ListTiles. |

### 2. Interaction and State

| Day | Project | What It Covers |
| --- | --- | --- |
| **4** | [Dicee](./day_4_dicee/README.md) | Stateful widgets, `setState`, buttons, and random number generation. |
| **4** | [Magic 8 Ball](./day_4_magic_8ball/README.md) | State management and displaying randomized responses. |
| **4** | [Xylophone](./day_4_xylophone/README.md) | Audio playback, package integration, and reusable widget functions. |

### 3. Inputs and App Logic

| Day | Project | What It Covers |
| --- | --- | --- |
| **5** | [Quizzler](./day_5_1_quizzler/README.md) | Classes, object-oriented programming, quiz state, and user feedback. |
| **5** | [Destini](./day_5_2_destini/README.md) | Branching narratives, conditional logic, and application flow. |
| **5** | [BMI Calculator](./day_5_3_bmi_calculator/README.md) | User inputs, sliders, custom components, calculations, and result screens. |

### 4. APIs and Networking

| Day | Project | What It Covers |
| --- | --- | --- |
| **6** | [Clima](./day_6_clima/README.md) | Geolocation, asynchronous programming, weather APIs, JSON, and city search. |
| **7** | [Crypto Ticker](./day_7_crypto_ticker/README.md) | Cryptocurrency exchange rates, REST APIs, and platform-specific currency selectors. |

### 5. Backend and State Management

| Day | Project | What It Covers |
| --- | --- | --- |
| **8** | [Flash Chat](./day_8_flash_chat/README.md) | Firebase Authentication, Cloud Firestore, real-time messaging, streams, and animations. |
| **9** | [WhaTodo](./day_9_whatodo/README.md) | Task management, Provider, ChangeNotifier, callbacks, and shared application state. |

## 📂 Repository Structure

Each project directory contains the application's source code, required resources, a dependency reference in `pubspec.yaml`, and its own README.

The platform-specific Flutter scaffolding has intentionally been excluded. These directories are source templates rather than independently runnable Flutter applications.

The repository is organized as follows:

```text
learning-flutter/
│
├── day_2_i_am_rich/
├── day_3_i_am_poor/
├── day_3_mi_card_flutter/
├── day_4_dicee/
├── day_4_magic_8ball/
├── day_4_xylophone/
├── day_5_1_quizzler/
├── day_5_2_destini/
├── day_5_3_bmi_calculator/
├── day_6_clima/
├── day_7_crypto_ticker/
├── day_8_flash_chat/
├── day_9_whatodo/
│
├── docs/
│   └── media/          # Screenshots, GIFs and demo media
│
├── notes.md            # Learning journal and references
├── LICENSE
└── README.md
```

## ♻️ Reusing a Project

The projects in this repository are intended to be used as starting points for new Flutter applications.

### 1. Clone the repository

```bash
git clone https://github.com/aruncbhusal/learning-flutter.git
```

### 2. Create a new Flutter project

Navigate to the cloned repository and create a new project outside it.

For example, to use WhaTodo:

```bash
cd learning-flutter
flutter create --project-name whatodo ../my_whatodo
```

Use the name value from the selected project's `pubspec.yaml` as the project name. This preserves the existing Dart package imports.

### 3. Copy the application source

Copy the selected project's `lib/` contents into the new project's `lib/` directory.

Also copy its resource directories, such as `images/`, `assets/`, and `fonts/`, if present.

### 4. Configure dependencies

Refer to the selected project's `pubspec.yaml` and merge the required dependencies, asset declarations and font declarations into the newly generated manifest.

Do not replace the new project's manifest.

### 5. Complete project-specific setup

Some applications require additional configuration, such as API keys, device permissions or Firebase setup. Refer to the individual project README for these instructions.

### 6. Run

```bash
flutter pub get
flutter run
```

The new application retains its own platform configuration while using the application code from this repository.

Make sure a physical device or emulator is connected and selected.

To run another project, simply replace `day_9_whatodo` with the corresponding project directory. Each project has its own dependencies and setup requirements, so check its README before running it.

## 🗓️ Timeline

| Date | Event | Remarks |
| --- | --- | --- |
| 12 November 2025 | **Repository Created** | Initial commit and project setup. |
| 13 November 2025 | **Started** | Began learning Flutter and setting up the development environment. |
| 16 November 2025 | **First Batch** | Added the initial project files through Day 3. |
| 29 November 2025 | **Checkpoint** | Completed Clima (Day 6). The course then went on an extended break, with Crypto Ticker left unfinished. |
| 10–12 October 2026 | **Rediscovered** | Revisited previous projects, recovered notes and refreshed concepts before resuming development. |
| 24 October 2026 | **Resumed** | Returned to the course, revisiting Crypto Ticker (Day 7). |
| 28 October 2026 | **Checkpoint** | Completed Flash Chat (Day 8). |
| 3 November 2026 | **Completed** | Finished WhaTodo (Day 9), bringing the course projects to an end. |
| 12 November 2026 | **Cleaned Up** | Final repository restructuring, code cleanup and documentation updates. |

## 📝 License

This project is licensed under the [MIT License](./LICENSE).
