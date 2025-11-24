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

## Day 3:

> It's actually Day 9, but since I paused coding to go touch grass, I decided to skip these days.
> The purpose of this challenge is to use what we've learnt from the I am Rich App and create a custom app ourselves. I'll just go with the course and have it as `I am Poor` while not being completely bland and just rewriting the same code again.

### **I am Poor App Challenge**

The course has given us a widget tree we can follow which goes like this:

#### Material App

-   home: Scaffold
    -   appBar: AppBar
        -   backgroundColor: Color
        -   title: Text
    -   body: Center
        -   child: Image
            -   image: AssetImage

#### Some resources for icons and graphics:

-   [Icons8](https://icons8.com/)
-   [Vecteezy](https://www.vecteezy.com/)
-   [Canva](https://www.canva.com/)

---

### **MiCard Business Card App**

This project needs us to first clone a git repository as the skeleton project from which we'll build forward.

#### Hot Reload and Hot Restart

-   Hot Reload allows us to "reload" our app just like a website would, but without losing its state eg. a counter app retaining the count.
-   Hot Restart reloads the app and resets the state as well

We haven't been able to use Hot Reload yet because to use it, we need to have our app as a Stateful or Stateless Widget. We can create a Stateless Widget by simply typing `stless` and pressing Tab.

Then we can give the widget a name and in the main function, we run that widget which contains the app (in the case of this project, the MaterialApp). Every stateless widget has a build method. If we change something inside the method, only that parent method will be reloaded, making Hot Reload very fast. We can simply save the main.dart file to trigger Hot Reload.

Hot Restart has been possible in `I am Rich` and `I am Poor` projects, however, because it Restarts the app with the design changes.

#### Container Widget

> Documentation: [Container class](https://api.flutter.dev/flutter/widgets/Container-class.html)

A Flutter Layout works similarly to Web Development and Container Widget is analogous to a div. A Container is a single child widget that allows positioning, sizing, etc. Here's some notable properties:

-   If container has no child, it takes maximum area available, else it takes as much area as taken by the child. We can use height and width properties to change the size of the container
-   We can use margin to place the container inside its parent, and padding to place the child inside the container. We can surround the container inside a SafeArea widget to avoid notches and other such areas on the phone.
    > To wrap something with a widget, we can press on the widget and use Alt+Enter to open a context menu
-   For margin and padding, we use EdgeInsets object with all/fromLTRB/onlyLeft,onlyTop, etc.

#### Multichildren Widgets: Column and Row

> Documentation: [Column class](http://api.flutter.dev/flutter/widgets/Column-class.html) [Row class](https://api.flutter.dev/flutter/widgets/Row-class.html)

When we have multiple widgets in the layout, some simple widgets we can use are **Row** and **Column**. Some of their properties are:

-   They have children as a list of widgets written as `<Widget>[...]`. The children can be Containers, Text, or other Row/Column
-   Columns have vertical axis as main axis and horizontal as cross axis. Rows have it opposite. By default they take the maximum space available in main axis while only as the content requires in the cross axis.
-   We can set `mainAxisSize` to max(default) or min(content size), `mainAxisAlignment` to start(default), end, spaceBetween, etc., `verticalDirection` to up(default) or down(from below), `crossAxisAlignment` to baseline(default), end(by highest content width), stretch(cover full width), etc
-   To align items in a column to the right, we can use end cross axis alignment with an invisible container with width set as `double.infinity` to set it as wide as the display.
-   In order to space two items in a row/column, we can use a SizedBox between them with a given width/height

#### CircleAvatar Widget

> Documentation: [CircleAvatar class](https://api.flutter.dev/flutter/material/CircleAvatar-class.html)

This is another widget from the Flutter library that allows us to add a circle we can modify to add our own stuff inside.

For the purpose of this project, we use it to get an asset image to display. We can use the docs for the information on how to do so using the foregroundImage property to place an AssetImage. We can also simply have a colored circle as well. The course uses backgroundImage but it's meant as a fallback for foregroundImage as per docs.

#### Text Widget

> Documentation: [Text class](https://api.flutter.dev/flutter/widgets/Text-class.html)

This widget is one of the most used. And apart from simply the text content, we can style the text as well. For styling, we can use `style: TextStyle()` with different properties such as fontSize, color, fontWeight

> We can use `Ctrl+Q` to raise a context window while selecting a component to see available parameters

We can also add our own fonts instead of default system fonts by [following this documentation](https://docs.flutter.dev/cookbook/design/fonts) and using fontFamily property. After adding new assets we need to stop the app and do a rerun.

#### Icons

> Documentation: [Icons class](https://api.flutter.dev/flutter/material/Icons-class.html)

Using icons is better when possible instead of plain images because they are drawn instead of just rendered as is. This means we can make changes to the appearance of these icons, and they are vector assets, not scalar like images.

We can see the material icons on [official Material UI page](https://mui.com/material-ui/material-icons/) and we can also use [this website to browse palettes](https://www.materialpalette.com/)

#### Card

> Documentation: [Card class](https://api.flutter.dev/flutter/material/Card-class.html)

A card is an easy way to add a pre-styled container to hold some content. It has some shadow, rounded corners so that we don't have to tediously work with a container to achieve a nice material look.

It is similar to a container but does not have the padding property.

#### Padding

> Documentation: [Padding class](https://api.flutter.dev/flutter/widgets/Padding-class.html)

For widgets that don't have a padding property of their own, we can wrap their children inside the padding widget so that the children have padding around them. **We don't wrap the parent but the children.**

#### List Tile

> Documentation: [ListTile class](https://api.flutter.dev/flutter/material/ListTile-class.html)

When working with card, we can make use of List Tile instead of simply using rows when we need to have an icon and some text. This is done so that we don't have to write redundant code to implement the same feature again and again.

#### Divider

> Documentation: [Divider class](https://api.flutter.dev/flutter/material/Divider-class.html)

We can set this as a child of a SizedBox to get a 1px thick line that can be used to separate content visually.

## Day 4

### **Dicee: Dice Rolling App**

> Like with other projects I had to clone the starting repository, but since older versions of sdk and jdk are incompatible, I create a new project for each and simply copy the relevant files instead.

This project is meant to introduce us to adding functionality through Flutter rather than just design. It features two dice that we can roll.

#### Content Overflow

When we want to place a large content like an image into the screen, it can overflow out of the screen and cause red and black bars to appear to signify that. We need to be mindful of how large our content is when putting it onto the screen. We can change the height and width of images but that is a static way of managing content size.

#### Expanded Widget

> Documentation: [Expanded class](https://api.flutter.dev/flutter/widgets/Expanded-class.html)

This is a simple way to dynamically adjust the size of content by taking as much space as available. It can only be used inside widgets like Row, Column, Flex. Multiple Expanded widgets can share the available space in a default 1:1 ratio, but we can change the `flex` property to change the proportion of any individual widget.

#### Image Widget

> Documentation: [Image class](https://api.flutter.dev/flutter/widgets/Image-class.html)

The image class can be used to add an image from different sources. We can simply use the base `Image` constructor with an `ImageProvider` parameter, but we can also simply use methods like `Image.asset(..)` for asset images instead of `Image(image: AssetImage(..))`

#### Button Widget

> Documentation: [ButtonStyleButton class](https://api.flutter.dev/flutter/material/ButtonStyleButton-class.html)

Buttons are used to prompt user tap/click and perform some action based on the tap/click. A button has an onPressed parameter which takes a voidCallback function which is analogous to an anonymous function, with no arguments and no returns.

There are different types of buttons in Flutter, and the ones shown in the course have been deprecated and replaced since:

-   **[Text Button](https://api.flutter.dev/flutter/material/TextButton-class.html):** _(Replaces FlatButton used in this project.)_ It is the most basic of buttons, with some padding and not much other change in appearance apart from functionality.
-   **[Elevated Button](https://api.flutter.dev/flutter/material/ElevatedButton-class.html):** _(Replaces RaisedButton.)_ It has shadows and appears elevated with some change in other appearance.
-   **[Outlined Button](https://api.flutter.dev/flutter/material/OutlinedButton-class.html):** _(Replaces outlineButton.)_ It has outline border but no fill color.
-   **[Filled Button](https://api.flutter.dev/flutter/material/FilledButton-class.html):** It is filled with color but doesn't elevate when pressed.

> We can follow [this official Material 3 design overview](https://m3.material.io/components/buttons/overview) for using buttons in designs.

#### print function

The print function is similar to how it is in other languages, it accepts a string that it prints to the console when triggered.

#### Functions in Dart

The concept of functions stays the same as with any other language, we have arguments, return types, etc. In Dart we also have named functions that we need to call later, and anonymous functions like the void callback that we don't need to call ourselves.

#### Variables in Dart

We can define variables in Dart using the `var` keyword. We need to be mindful about where we define our variables since changes made to a variable outside a function that is rerun are not reflected inside the function.

For example, when Hot Reloading, the build function is re-executed but if the variable is defined/changed outside the function, the change isn't detected by the function during Hot Reload.

We can perform string interpolation in Dart by simply using `$variableName` inside a string.

> We can test dart code in the browser using [DartPad](https://dartpad.dev).

#### Data Types in Dart

Dart is a statically typed language. When we define a variable with a certain data type, it is locked to that data type. Some primitive data types are:

-   A `String` is written inside single code by convention
-   An `int` is the normal integer type
-   A `double` is a floating point type
-   A `bool` is the boolean type

Dart also has a `dynamic` data type that a variable is assigned when we don't initialize it at definition, enabling it to hold data of any type.

We can define a variable in Dart by using `var` as well as specific data types like `int a`, `String b` or even `dynamic c`. It is recommended to use specific data types instead of ambiguous `var`.

#### Stateful vs Stateless Widget

> We can create a skeleton Stateful widget by typing `stful` and pressing `Tab` similar to `stles` for Stateless widget

A stateless widget is meant for things that do not change and are supposed to be static with the same state throughout the use.

A stateful widget is used when something is expected to change, either by user interaction, network acativity, or automated. The dice in our project need to change and hence we migrate the content of our stateless widget to a state inside a stateful widget.

Inside a stateless widget, when we define a variable, it warns us saying the components of a stateless widget must be immutable.

#### Changing State in a Stateful widget

In our case we have an `onPressed` callback that executes some code which should trigger a change. So inside that function we need to have a `setState` function which takes a function parameter that should have the changes that need to be reflected onto the app.

When something changes inside the `setState` function, the components where it is used is marked as dirty and is redrawn the next time the screen is refreshed.

#### The math library and Random Number Generation

> Documentation: [dart:math library](https://api.dart.dev/dart-math/)

We can use `import 'dart:math'` to import the dart math library into our project. It has many useful functions, such as the random number generator. We can simply use `Random()` to generate a random number. We can pair it with a method such as `nextInt(a)` to get a random number from [0-a), or `nextDouble()` for [0.0, 1.0), or `nextBool()` for true or false.

The math library also has co-ordinate geometry functions, trigonometry functions, constants, logarithms, etc.

---

### **Magic 8Ball**

This is a challenge project, meaning I am on my own for this, I know what the app needs to be, but not how to make it. I cloned the [stub repository](https://github.com/londonappbrewery/magic-8-ball-flutter) and copied relevant files into my new project.

The projct requires an app that has an 8Ball which contains answers to questions we might have in our mind. The answers are either "Yes", "No", "Ask Again Later", "The Answer is Yes" or "I Don't Know". This is similar to the dice app in that we simply need to swap the images on user click so it should be simple enough.

There's step by step instructions but I will first finish the project then compare to specs, because I don't have to be bound by them, yet.

After the module was completed, I reviewed the intented solution, and it had suggested a stateful `Ball` widget inside a stateless `BallPage` widget, so I incorporated that and it was done in less than half an hour.

---

### **Xylophone Instrument App**

> Starting files: [Xylophone Stub](https://github.com/londonappbrewery/xylophone-flutter)

With this app, our goal is to create a xylophone using the given assets to play sounds when either key of the xylophone is pressed.

#### Flutter Packages

> Documentation: [Using packages](https://docs.flutter.dev/packages-and-plugins/using-packages)

Flutter Packages are open source libraries that implement a feature which we can simply add to our project so that we don't have to reinvent the wheel.

The official place where packages are downloaded as dependencies is [pub.dev](https://pub.dev/) where we can search for packages, which have their own details, install guides, and usage docs. Since the libraries are open source, we can also read their source code.

To use packages, we need to add them to the dependencies then import them. In this project, we use the [audioplayers](https://pub.dev/packages/audioplayers) package to play the sounds on whatever platform the app is run in.

#### Dart Functions

Just like other programming languages, Dart functions can take arguments. They can be in the form of positional arguments like `void fnName(int a, int b)`, which we can call with eg.`fnName(2,3)`.

They can also be in the form of named arguments by enclosing with curly brackets as `void fnName({int a, int b})` to call which we need to specify the name regardless of the order like `fnName(b:3, a:2)`.

Similarly, we can also define return types other than void and return something with that data type.

**Arrow Functions** in Dart are much the same as in JavaScript, in that they allow writing a single line function into an arrow function, omitting return keywords if any. For example, the following functions:

```
void greet(String name){
    print('Hello, $name');
}

void add(int n1, int n2){
    return n1 + n2;
}
```

are the same as simply writing:

```
void greet(String name) => print('Hello, $name');

void add(int n1, int n2) => n1 + n2;
```
