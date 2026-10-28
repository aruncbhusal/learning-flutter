import 'package:day_8_flash_chat/components/rounded_button.dart';
import 'package:day_8_flash_chat/constants.dart';
import 'package:day_8_flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
// In order to add the authentication feature, we need to import the authentication library
import 'package:firebase_auth/firebase_auth.dart';
// For the loading spinner
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // We might want to store the email and password into variables to update them with user input
  String email='';
  String password='';
  // Let's also instantiate the Firebase Authentication class
  final _auth = FirebaseAuth.instance;
  // For the spinner, we need a variable to track its state
  bool _spin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 20, 36),
      // We wrap the Padding in a ModalProgressHUD to show the spinner
      body: ModalProgressHUD(
        // We need to add a parameter to define which variable tracks the state
        inAsyncCall: _spin,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                // Rather than using the default keyboard here, we can use email specific one
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: kTextFieldInputStyle,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                // To make it look like a password, we want to not show what a use typed
                obscureText: true,
                obscuringCharacter: '#', // Just adding some flair
                textAlign: TextAlign.center,
                style: kTextFieldInputStyle,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password.'
                )
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Color.fromARGB(255, 77, 141, 255),
                    onPressed: () async {
                      // To show the spinner, we need to set the variable to true
                      setState() => _spin = true;

                      // Since authentication is an asynchronous process that can also fail,
                      // We need to make this callback async, and also wrap it in a try-catch block
                      try{
                        // There is a straightforward method to create a new user
                        await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        // Now we don't need to check if the user has been successfully created since if not, there's exception
                        if (!mounted) return;
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      // If failed, we catch the specific auth failed exception and show a snackbar message
                      // https://api.flutter.dev/flutter/material/SnackBar-class.html
                      on FirebaseAuthException catch (e){
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.message ?? "Registration Failed"))
                        );
                      } finally {
                        // Either signed in or failed, we must hide the spinner
                        // But we have to check if mounted before
                        if (mounted) setState () => _spin = false;
                      }
                    },
                    title: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
