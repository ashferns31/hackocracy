import 'package:hackocracy/login_screen.dart';
import 'package:hackocracy/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:hackocracy/roundedbutton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_string';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF353F45),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset('images/nature.png'),
                  height: 150.0,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Text(
              'Green Eye',
              style: TextStyle(
                fontFamily: 'SyneMono',
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            RoundedButton(
              title: 'Login',
              colur: Color(0xFF1CE3B1),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            ),
            RoundedButton(
              title: 'Register',
              colur: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegistrationScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
