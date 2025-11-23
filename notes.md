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
