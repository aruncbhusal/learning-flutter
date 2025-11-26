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

```dart
void greet(String name){
    print('Hello, $name');
}

void add(int n1, int n2){
    return n1 + n2;
}
```

are the same as simply writing:

```dart
void greet(String name) => print('Hello, $name');

void add(int n1, int n2) => n1 + n2;
```

## Day 5

### **Quizzler App**

> Starting code: [Quizzler stub](https://github.com/londonappbrewery/quizzler-flutter)

The starting code has deprecated code so we'll need to make changes to the main.dart by replacing FlatButton with TextButton and all its relevant changes.

#### Lists in Dart

> Documentation: [List<E> class](https://api.flutter.dev/flutter/dart-core/List-class.html)

Similar to arrays in other programming languages, we can create Lists in Dart by using the `List` keyword. It is similar to `var` for normal variables. When we need to specify a data type we instead use eg.`List<int>` for integer list.

We can use the `.add()` method to add something to the List. We can also use the index notation similar to arrays to add/remove/change. We can use `remove(content)` to remove the content from the list. There's other ways to add/remove in the documentation.

Multi children widgets in Flutter like Row, Column take List values.

> In Dartpad we can use the hex of the gist as the route to open the GitHub gist code in the editor.

#### Escape Characters

Just like in other languages, Dart has escape characters with `\` so we can write single quotes as `\'` and not have it terminate a string.

#### Conditionals in Dart (if...else)

Conditionals in Dart are just like any other language, with:

```dart
if (condition1){
    statement1;
} else if(condition2 && condition3){
    statement2;
} else {
    statement3;
}
```

> ### Object Oriented Programming in Dart

#### Classes and Objects in Dart

We can create a new class, whose name by convention starts with a capital letter, using the `class` keyword. The content is enclosed by curly brackets and it contains properties that need to be initialized through a constructor which is defined as a normal function just with the same name as the class.

This function can be a named or a positional argument function which receives the values for initialization as parameters. The methods can also be defined similarly.

Accessing the properties or methods of a class is done using the dot (.) operator.
The four pillars of OOP:

1. #### Abstraction:
    To reduce the complexity of code, we can create different components that have near-exclusive functionality and properties.
2. #### Encapsulation

    When we separate classes according to their roles, they should be bound to their own functionalities. This means we need a way to prevent other classes from altering a class' properties.

    We can make a property/method private to a class so only objects of that class can use it by adding an underscore before the name of the property/method. When we do so, we need a public method (getter) to get the private property/call the private method, and similarly setter method to set property value.

3. #### Inheritance

    While abstracting code, there might be overlap or redundancy between different classes. We can make a class that inherits from its parent class, so that we can add new properties/functionalities while not having to repeat ones the parent class already has.

    In Dart, we can inherit as:

    ```dart
    class ChildClass extends ParentClass{}
    ```

4. #### Polymorphism
    While inheriting, we might have some differences that are inherited as well. In order to change them to fit the current class, we can morph them. In Dart we do so by using `@override` before the modified method. If we want to retain parent class functionality while adding to it, we can simply call the parent's method inside an overridden method using `super.methodName()`. eg.
    ```dart
    class Human{
        void greet() => print('Hi!');
    }
    class Teen extends Human{
        @override
        void greet(){
            super.greet();
            print('Let\'s be friends.');
        }
    }
    ```

#### Constructors in Dart

Each class in Dart has its own constructor, even if we don't create it, there is one by default. They are used to initialize the properties of a class. We can either use setting method or syntactic sugar. eg.

```dart
class Example{
    int a;
    Example(int b) => a=b
}
```

is the same as

```dart
class Example{
    int a;
    Example(this.a){};
}
```

---

### Destini: A CYOA Game

> Starting Code: [Destini stub](https://github.com/londonappbrewery/destini-challenge-starting.git)

This project is given as a challenge where we need to create this game where we can choose our dialogue options/actions and continue the story.

For this project I won't be going headfirst and just following the steps outlined, without relying too much on them. There's TODOs all around so that should guide me.

The TODOs were sufficient to complete this challenge.

---

### BMI Calculator

> Starting code: [BMI Calculator stub](https://github.com/londonappbrewery/bmi-calculator-flutter)

In this project, we're focusing on design since that is one of the selling points of Dart. We can find design inspirations on [Dribble](https://dribbble.com/) and for this project, the inspiration was [Ruben Vaalt's BMI Calculator](https://dribbble.com/shots/4585382-Simple-BMI-Calculator).

#### Flutter Themes

> Documentation: [Using themes](https://docs.flutter.dev/cookbook/design/themes)

Themes are a way to define a custom design pattern/palette/fonts etc to be used throughout the app. They help to make the app more look more consistent and polished. We can look at [the official learning resources](https://docs.flutter.dev/reference/learning-resources) to learn about different intermediate and advanced concepts like this.

In order to create an app theme, we need to give a `ThemeData` widget to the theme property of a `MaterialApp`. There are presets for light and dark themes.

#### ThemeData Widget

> Documentation: [ThemeData class](https://api.flutter.dev/flutter/material/ThemeData-class.html)

It has various properties we can set in order to get a fully customized look of the app. Some notable properties include `scaffoldBackgroundColor`, `primaryColor`(for major parts of the app like toolbars, tabbars, etc), `filledButtonTheme`, `floatingActionButtonTheme`, `focusColor`, `textButtonTheme`, etc.

#### Using custom colors

> Documentation: [Color class](https://api.flutter.dev/flutter/dart-ui/Color-class.html)

The material color palette is limited and we might want to use custom colors, for that we can use `Color(value)` where value is a hexadecimal number that looks like `0xAARRGGBB`. So we must specify the alpha, red, green and blue intensity.

> We can use the [ColorZilla extension](http://www.colorzilla.com/) to find the hex of a color from a webpage.

#### Theme Widget

> Documentation: [Theme class](https://api.flutter.dev/flutter/material/Theme-class.html)

The Theme widget can be used to wrap another widget, it additionally has a `data` property which takes a `ThemeData` value to modify that widget only.

#### Refactoring a Widget

Flutter gives us a simple option to refactor a repetitive widget by right clicking on the widget and selecting extract widget. It then creates a new stateless widget which we can then use instead of the entire code when we need to use the same widget.

#### Key class

> Documentation: [Key class](https://api.flutter.dev/flutter/foundation/Key-class.html)

Keys are used to identify widgets and are mostly useful when the widgets have movement,animations, etc. The documentation has a video explaining when to use keys.

#### final vs const

An instance variable/field is the same as a class' property. Immutabile means unchangeable, stateless widgets are immutable. To change something in such widgets, old widget is destroyed before new one replaces it.

`final` and `const` are both immutable once assigned a value. The difference is given in [official docs](https://dart.dev/language/variables). a final variable can only be set once (at runtime), but a const is a compile-time constant.
e.g.

```dart
final time1 = DateTime.now(); // Valid
const time2 = DateTime.now(); // Invalid
```

> [!Note]
> This project extends to Day 6 but it is still included in Day 5.

#### GestureDetector

> Documentation: [GestureDetector class](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html)

A button defined in MaterialUI has its own properties regarding colors, layouts, etc. In order to add ability to detect gestures like press, long press, drag, etc., we can wrap the widget inside a GestureDetector class which lets us add `onTap`, `onDoubleTap`, `onLongPress`, `onHorizontalDragStart` and other useful properties.

#### Enums in Dart

> Documentation: [Enum class](https://api.flutter.dev/flutter/dart-core/Enum-class.html)

In order to assign abstract concepts to numbers, we can use enums to define them intuitively using enums then use the intuitive names to refer to the concepts.

We can't create enums inside classes so they must be globally defined. The definition follows:

```dart
enum EnumName {typeA, typeB, typeC, ...}
```

#### Ternary Operators in Dart

It is an easier way to enforce an if..else logic. The following statements are equivalent:

```dart
if (condition){
    statementIfTrue;
} else {
    statementIfFalse;
}
// is equivalent to
condition? statementIfTrue: statementIfFalse;
```

When working with booleans, we don't need to use `x == true` since this expression is true only when x is true itself. Similarly, we can use `!x` instead of `x == false`. A common use of ternary operator is when we want to add conditions to the right hand side of an assignment, which isn't possible with if..else.

#### Functions as First Order Objects

> Documentation: [Function class](https://api.flutter.dev/flutter/dart-core/Function-class.html)

We can use the `Function` data type to declare a function just like a variable, which stores the actual function implementation. Similarly, we can also pass these functions by simply mentioning their name. eg.

```dart
final Function calculator = (int a, int b, Function operation){
    return operation(a, b);
}
int add(int a, int b) => a+b;
// Then call calculator to add as
result = calculator(2, 3, add);
```

#### Flutter Slider

> Documentation: [Slider class](https://api.flutter.dev/flutter/material/Slider-class.html)

A slider is used to select from a range of values by simply sliding a point. We can customize various properties, like `activeColor`, `inactiveColor` (by default to the left and right of slider), `min`, `max` for the values, `value` that is to be represented by the slider, `onChanged` that takes a callback with a `double` type argument that gives new value received by sliding.

In order to have a greater control over the look of the slider, we can wrap the slider with a [SliderTheme widget](https://api.flutter.dev/flutter/material/SliderTheme-class.html) which takes a property called `data` with data type [SliderThemeData](https://api.flutter.dev/flutter/material/SliderThemeData-class.html). If we try to set it this way, we need to give value for every property in SliderThemeData, but we can instead use `SliderTheme.of(context).copyWith(...)` to change only some properties while inheriting others from the nearest context, which is generally context passed to the build function.

#### Composition vs Inheritance

In most languages, we use inheritance primarily to build from scratch. But Flutter prefers composition over inheritance, meaning we don't modify existing large components to fit our use case but instead combine smaller components to create our larger component.

#### Creating Custom Buttons

We can take a look at source code of any existing button, eg. a [Floating Action Button (FAB)](https://api.flutter.dev/flutter/material/FloatingActionButton-class.html), to see that it is built from a `RawMaterialButton`. We can go further until we find that components are built using the `Material` class at the basic level.

> RawMaterialButton Documentation: [RawMaterialButton class](https://api.flutter.dev/flutter/material/RawMaterialButton-class.html)

_This class is to be deprecated in later versions so there might be some changes in the future._

#### Routes and Navigation in Flutter

In order to build a multiscreen app, we need to have a routing/navigation ability to go from one screen to another.
[Flutter Cookbook on Navigating Multiple Screens](https://docs.flutter.dev/cookbook/navigation/navigation-basics) has a guide on how to enable routing. We need to first have two routes, and use `Navigator.push()` to go to another route from home route, then `Navigator.pop()` to return back since routes are stored in a stack. When doing the push, we need to give the `context` as the first argument and a `MaterialPageRoute`([Documentation](https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html)) object as the second argument. While popping, we only need to give the context.

The `MaterialPageRoute` takes a `build` argument which takes a callback that triggers the next route's constructor. Apart from this simple single push, we can also have a named push for which we need to specify a routes property in the `MaterialApp`. This takes a map that links each route name which is a string that begins with `/` to identify each part of the routes. Then we can use `initialRoute` property instead of `home` to set the home route. _We can only use one of the two properties._

In order to navigate through named routes, we can use `Navigator.pushNamed(context, routeName)` where the routeName is the key of the route we want to access. The value in the map is the same as what we'd have in the `build` property of a `MaterialPageRoute`.

### Dart Maps

> Documentation: [Map<K,V> class](https://api.flutter.dev/flutter/dart-core/Map-class.html)

A map is simply a collection of key-value pairs, similar to a dictionary in Python, and map implementations in other languages. We can specify our static types when defining key/value pairs using eg. `Map<String, int>` or we can let Dart dynamically do that for us. We can define and use a map as follows:

```dart
Map<String, int> mapName= {
    'key1': num1,
    'key2' : num2,
}
// To retrieve a value from the map we can use
mapName['key1']; // This gives us the value associated with key1 i.e. num1
```

We can also add new entries to the map with the same notation as used to retrieve/modify existing entries like `mapName['key3'] = num3`.

## Day 6

### Clima: Weather App

> Starting code: [Clima](https://github.com/londonappbrewery/Clima-Flutter)

This is an app that is intended to show us how to pull GPS data from Android/iOS and also how to make API calls over the network to retrieve data from the internet.

The starting app had older deprecated components like `FlatButton`, `RaisedButton` which I replaced with `TextButton` and `ElevatedButton`, and changed `withOpacity(double)` to `withAlpha(int)`.

#### Location Services

To get location information from an Android, we must request permission by first editing the `AndroidManifest.xml` file, then we can call the request method from `geolocator` library. For iOS, the permission needs `NSLocationWhenInUsageDescription` key inside `Info.plist`.

#### Asynchronous programming in Dart

When something takes a long time to complete but our system becomes idle at that time, we might not want to wait for it to finish before starting the next statement. We can avoid this synchronous behavior by returning a [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html), which is similar to `Promise` in JavaScript in that it ensures a result after execution, so we can simply perform other tasks and come back to it when result is available.

But sometimes we might need to use the result of the async operation. In such cases, the function with `async` modifier is called with an `await` modifier so that the execution of the next expression will not occur until this one is completed.
