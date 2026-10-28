import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:day_8_flash_chat/screens/login_screen.dart';
import 'package:day_8_flash_chat/screens/registration_screen.dart';
import 'package:day_8_flash_chat/components/rounded_button.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  // The ticker for the animation will be provided by the SingleTickerProviderStateMixin of this state class
  // If we have multiple animated elements, we can use TickerProviderStateMixin instead
  // The with keyword allows adding mixins since we can't have multiple inheritance in Dart

  // To use custom animation, we need to instantiate an AnimationController class object
  late AnimationController controller;
  // Under null-safe Dart, we can't leave a variable uninitialized, for this we can use late
  // This tells Flutter that it will be initialized later before accessing it
  late Animation animation;

  // We instantiate this inside the initState method since properties must be initialized at instantiation
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      // vsync is a required property that takes a ticker. We can turn the current class into a ticker
      duration: Duration(seconds: 1),
      // upperBound: 100,
      // Setting an upperBound means an animation moves from lowerBound (default 0) to upperBound (default 1)
    );

    // By default, the rate of change of value is linear, but we can set a curve using the CurvedAnimation class
    // To use it, we create an Animation object, which will sit on top of the controller, and use it instead
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // This constructor takes two mandatory properties: parent (the controller) and curve

    animation = ColorTween(begin: Colors.indigo, end: Color.fromARGB(255, 13, 20, 36)).animate(controller);

    // To use this animation, we can simply use the forward method
    controller.forward();
    // Similarly, there's also the reverse() method for which it is better to give the from property

    // We can loop the forward and backward animations back and forth by reversing once forward is done and so on
    // controller.addStatusListener((AnimationStatus status) {
    //   if (status == AnimationStatus.completed) {
    //     // The end of forward animation is indicated by AnimationStatus.completed
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     // Similarly, the end of reverse animation is indicated by AnimationStatus.dismissed
    //     controller.forward();
    //   }
    // });

    // In order to do something with the value of the animation, we can use addListener
    controller.addListener(() {
      // Inside this callback, the value changes, so we can use an empty setState to display whatever animation we want
      setState(() {});
      // Similarly, we can print the value of the controller to see it changing:
      // print(animation.value);
    });
  }

  // Since an animation controller persists even when the screen is not visible, we need to dispose it
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: 60.0 * controller.value,
                    // height: 60.0 * animation.value,
                    height: 60.0,
                  ),
                ),
                // After importing animated text kit library, we can replace the text widget with an animated one
                // Text('Flash Chat',
                //   style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900,),
                // ),
                DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat', speed: Duration(milliseconds: 100)),
                    ],
                  )
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color: Color.fromARGB(255, 24, 34, 56),
                onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                title: 'Log In'
            ),
            RoundedButton(
                color: Color.fromARGB(255, 77, 141, 255),
                onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
