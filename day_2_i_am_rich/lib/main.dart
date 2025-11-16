// When opening the project first, it is a counter app premade for us to test
// But I've removed everything and now I just have an import for the material theme
// And the main function which can either be an arrow function or a normal
// In the course version, an arrow version was first shown, which she later replaced with {}

import 'package:flutter/material.dart';

// The main function calls a function called runApp which passes the app as parameter
// But since we've removed the app that was given, we can instead use the base class MaterialApp
// void main() {
//   runApp(const MyApp());
// }

// void main() {
//   runApp(MaterialApp(home: Text("Hello")));
// }

// This runs the app with the text "Hello" on a black screen with red text
// We may want to center this, for that we need to nest it inside a Center widget
// So we'll have the MaterialApp widget inside which there'll be a Center widget
// The center widget will then have the Text widget
// We can use the dartfmtr formatter to format the code to make it readable
// For that we can separate the different levels with a comma and format it in context menu

// void main() {
//   runApp(MaterialApp(home: Center(child: Text('Hello'))));
// }
// I wasted like 20 mins of my time because it didn't center the text on hot reload
// Then I realized there was a note about the fact that it wouldn't work in this case
// We'll get to it later. But in the meanwhile, let's just reassemble every time.

// This is fine but we want it to look more like an app, so we will use the Scaffold widget
// Which acn have multiple components, like an appbar and other widgets
// Inside the home of the MaterialApp we will have a Scaffold, whose documentation:
// https://api.flutter.dev/flutter/material/Scaffold-class.html

// The first thing we'll add to the scaffold is an AppBar, whose documentation:
// This AppBar itself can have many options and widgets, we can use the backgroundColor property
// To add a material color, we can find them here: https://api.flutter.dev/flutter/material/Colors-class.html
// I'll use the color of royalty, deepPurple[900]
// And we can use a title widget, for which a text with "I am Rich" can be used

// Mine looks a bit different from the course as I'm using an Android Emulator
// Also a challenge was given to change the background color of the body of the scaffold
// So I look at the docs and saw it was really easy to do so using backgroundColor

// I also took the liberty to make it similar to iOS by making the foregroundColor of AppBar to white
// and centering the text inside the title.
// Now the next job was to add an image into the scaffold as a part of the body property
// Documentation for image (widget class): https://api.flutter.dev/flutter/widgets/Image-class.html
// We can add a NetworkImage class inside its image property to get image from the internet
// The text content like url are used inside single quotes in Dart by convention
// Here a challenge given was to center this image in the scaffold, which was pretty easy
// We can also select the top level widget to be centered and open context window with Alt+Enter
// That gives us an option to center it automatically

// Now we want to add an image from our own project folder rather than from the internet
// For that we'll need to specify our assets in the pubspec.yaml file
// A YAML(YAML ain't Markup Language) file is used as a human and machine understandable file
// Indentation (2 spaces) matters much in a yaml file to specify the level of depth
// The top level items are not indented at all. There are comments to guide in initial pubspec.yaml
// We can remove the comments and add the assets by uncommenting, file by file or entire folder
// Then we can use the asset we mentioned there in place of our NetworkImage as AssetImage

// Final thing now is to add an app icon to our app, for that we'll need to visit the folders ios and android
// There we can find android/app/src/main/res which has folders called mipmap-***
// We also have ios/Runner/Assets.xcassets which has appicon and launchimage folders
// We can use the image given in the course in site like appicon.co to create these folders
// Then replace them with the received files. This creates a square icon inside a circular frame
// We may not like this style and want it to take the entire circular frame
// For that we can create the icons from existing images within Android Studio
// but I haven't found a way to replicate the steps in the course yet so I'll create online

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          // backgroundColor: Colors.deepPurple[900],
          // In fact I don't like this color so I'll instead use the one used in the course
          backgroundColor: Colors.blueGrey[900],
          foregroundColor: Colors.white,
          title: Center(child: Text('I am Rich')),
        ),
        body: Center(
          child: Image(
            // image: NetworkImage(
            //   'https://www.color-meanings.com/wp-content/uploads/2022/09/rainbow-colored-diamond.png',
            // ),
            image: AssetImage('images/diamond.png')
          ),
        ),
      ),
    ),
  );
}
