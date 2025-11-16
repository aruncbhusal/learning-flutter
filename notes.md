This document contains the things I learnt each day as I progressed through the Flutter journey.

## Day 0: **Set Up** : _14/11/2025_

#### What is Flutter?

It is a UI toolkit to design platform independent apps with prebuilt customizable widgets and actions on them.

#### Why Flutter?

-   Single codebase for every platform with a single language (Dart). It is en route to expand to WebDev via Hummingbird and even Desktop.
-   It draws responsive features from WebDev and hence suitable for all display sizes and aspect ratios.
-   Hot Reload lets us see our changes in real time rather than having to recompile, reinstall every time.
-   Open Source code lets us see and customize implementations unlike iOS's proprietary implementations.

#### Basic Flutter App

A Flutter app is made by nesting widgets inside each other. We may start at the top level with a scaffolding, then an Appbar and a Caontainer.
The container may have widgets like rows and columns, images, text, icons, etc. It may also have functionality other than UI and form the widget tree.

#### Prerequisites to Start Development

We can use any OS, and a code editor, preferably Android Studio (which I will use for this course). If using other IDEs like VSCode or IntelliJ, might need to come back to Android Studio for certain features anyway.
For Android app testing, we can emulate it or use physical android device. For iOS, a Mac is mandatory because we can't emulate iOS outside a Mac and Apple's Code Signing doesn't let external apps be sideloaded on an iOS unless we use Mac to add certificate.

## Day 1: **Set Up Continued** : **15/11/2025**

#### Installing Flutter and Running First App

We can install Flutter by following the [official dev docs](https://docs.flutter.dev/get-started). We need to install the SDK and an IDE (Android Studio in my case). Then we need to install Flutter inside Android Studio, and we can create a new flutter project with Flutter as generator. It gets us a generic counter app, which we can run by creating a new virtual device. It takes time but after everything, the app loads.

#### My Limitation

Since I don't own a Mac, I can't use XCode and I don't have an iOS device either so it is not possible to emulate an Apple device on my Windows. Thus I will take in from the course and employ it in android but not on iOS.

## Day 2: **I am Rich App**

Each project specific note with contextual details will be inside the project file itself since it would be a hassle to reference back and forth. So for this on

### Deploying the app on a physical device

#### 1. Deploying on Android

I will be using the android device I have to deploy the app. The steps are:

1. Enable Developer Options and USB Debugging
2. Connect to the pc, accept debug mode
3. Run the app with the device selected

#### 2. Deploying on iOS

I will not be deploying on an iOS device since I don't have a Mac, but I'll learn for later when I do. The steps are:

1. Have an iPhone/iPad with Apple ID, XCode with compatible version of iOS and MacOS i.e. updated
2. Follow `https://docs.flutter.dev/platform-integration/ios/setup` to install prerequisite packages
3. Add Apple ID to XCode by opening the iOS module from the project in XCode and adding to "Team"
4. Connect device with USB, trust the device and certificates from device management settings
5. Add a unique bundle ID in XCode for the project then run the project from Android studio by selecting the device.
