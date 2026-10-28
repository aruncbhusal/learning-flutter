import 'package:flutter/material.dart';
import 'package:day_8_flash_chat/screens/welcome_screen.dart';
import 'package:day_8_flash_chat/screens/login_screen.dart';
import 'package:day_8_flash_chat/screens/registration_screen.dart';
import 'package:day_8_flash_chat/screens/chat_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // We ensure Flutter is initialized before Firebase uses platform services (Thanks GPT)
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: WelcomeScreen(),
      // Since string literals are prone to typo and the IDE can't help us,
      // We can instead set names as properties for each class, and use the static string variable here:
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
