# Learning Flutter

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black)
![Android](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)

## Introduction

This repository documents my journey learning Flutter and Dart through app-based exercises and mini-projects. The primary reference for this journey is Angela Yu's [The Complete Flutter Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/) on Udemy.

I started setting up Flutter on **November 14, 2025**, and have been working through the course one project at a time. Some projects follow the provided course structure, while others involve adapting the implementation to newer APIs, finding alternative packages, or building things from scratch.

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

- ![Progress](https://img.shields.io/badge/Course%20Progress-Day%209-blue)
- ![Projects](https://img.shields.io/badge/Projects-13-brightgreen)
- **Last Updated:** November 11, 2026
- **Current Status:** In Progress

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

Each project is maintained as an independent Flutter application with its own `pubspec.yaml`, source code, assets, and README.

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

## 🏃‍➡️ How To Run

Each project is a separate Flutter application. You can run any of them independently.

### Step 1: Clone the repository

```bash
git clone https://github.com/aruncbhusal/learning-flutter.git
```

### Step 2: Navigate to the project

For example, to run WhaTodo:

```bash
cd learning-flutter/day_9_whatodo
```

### Step 3: Install dependencies

```bash
flutter pub get
```

### Step 4: Run the application

```bash
flutter run
```

Make sure a physical device or emulator is connected and selected.

To run another project, simply replace `day_9_whatodo` with the corresponding project directory. Each project has its own dependencies and setup requirements, so check its README before running it.

## 🗓️ Timeline

| Date | Event | Remarks |
| --- | --- | --- |
| 26 Kartik, 2082 (12/11/2025) | **Repository Created** | Initial commit. |
| 28 Kartik, 2082 (14/11/2025) | **Started** | Day 0: began setting up Flutter and the development environment. |
| 30 Kartik, 2082 (16/11/2025) | **First Batch** | Added the initial project files through Day 3. |
| 13 Mangsir, 2082 (29/11/2025) | **Checkpoint** | Added Clima (Day 6). Last project update before the long break. |
| 7 Kartik, 2083 (24/10/2026) | **Resumed** | Returned to the course with Crypto Ticker (Day 7). |
| 11 Kartik, 2083 (28/10/2026) | **Checkpoint** | Added Flash Chat (Day 8). |
| 17 Kartik, 2083 (3/11/2026) | **Checkpoint** | Added WhaTodo (Day 9). |
| 25 Kartik, 2083 (11/11/2026) | **Updated** | README revisions and code fixes across the projects. |

## 📝 License

This project is licensed under the [MIT License](./LICENSE).