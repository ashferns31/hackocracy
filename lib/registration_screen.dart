//import 'package:chat_app_two/screens/chat_screen.dart';
import 'package:hackocracy/main.dart';
import 'package:flutter/material.dart';
import 'package:hackocracy/constants.dart';
import 'package:hackocracy/roundedbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'chat_screen.dart';*/
import 'package:modal_progress_hud/modal_progress_hud.dart';
//import 'package:http/http.dart' as http;
import 'package:hackocracy/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;
  String email;
  String password;

  //final _formKey=GlobalKey<FormState>();

/* 

  void addData() {
    var url = "http://ip/CleanGoa/addData.php";
    http.post(url, body: {
      "email": email,
      "password": password,
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF353F45),
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /* Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 100.0,
                    child: Image.asset('images/whitelogo.png'),
                  ),
                ),
              ), */
              Text(
                'REGISTRATION',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 39.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: ktextfield.copyWith(hintText: 'ENTER YOUR EMAIL'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration:
                      ktextfield.copyWith(hintText: 'ENTER YOUR PASSWORD')),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'REGISTER',
                colur: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    showspinner = true;
                  });
                  /* 
                  addData();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BottomNavBar(
                      email: email,
                     // pass: password,
                    );
                  })); */
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newuser != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    }
                    setState(() {
                      showspinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
