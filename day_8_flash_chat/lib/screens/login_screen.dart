import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:day_8_flash_chat/constants.dart';
import 'package:day_8_flash_chat/components/rounded_button.dart';
import 'package:day_8_flash_chat/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  bool _spin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 20, 36),
      body: ModalProgressHUD(
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
                //Same as in the registration screen
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: kTextFieldInputStyle,
                onChanged: (value) {
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
                obscureText: true,
                obscuringCharacter: '#',
                textAlign: TextAlign.center,
                style: kTextFieldInputStyle,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password.',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Color.fromARGB(255, 77, 141, 255),
                    onPressed: () async {
                      // This was left as a challenge so let's just do it like the registration screen
                      setState() => _spin = true;

                      try{
                        // Since we simply perform the authentication, we don't really need to return anything
                        await _auth.signInWithEmailAndPassword(email: email, password: password);
                        // We have to check if the page has been mounted (is in a tree) before passing its context
                        if (!mounted) return;
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      on FirebaseAuthException catch (e){
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.message ?? "Login Failed"))
                        );
                      } finally {
                        if (mounted) setState () => _spin = false;
                      }
                    },
                    title: 'Log In',
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
