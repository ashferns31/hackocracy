//import 'package:chat_app_two/screens/chat_screen.dart';
import 'dart:convert';
import 'package:hackocracy/main.dart';
import 'package:flutter/material.dart';
import 'package:hackocracy/constants.dart';
import 'package:hackocracy/roundedbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
//import 'package:http/http.dart' as http;
import 'main.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showspinner = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

//  var url = "http://ip/CleanGoa/getUser.php";
/* 
  Future<List> getdata() async {
    final responce = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    var datauser = jsonDecode(responce.body);
    setState(() {
      email = datauser[0]['email'];
    });

    return datauser;
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
              Text(
                'LOGIN',
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
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      ktextfield.copyWith(hintText: 'ENTER YOUR EMAIL')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration:
                      ktextfield.copyWith(hintText: 'ENTER YOUR PASSWORD')),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'LOGIN',
                colur: Color(0xFF1CE3B1),
                onPressed: () async {
                  setState(() {
                    showspinner = true;
                  });
                  /* 
                  getdata();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BottomNavBar(
                      email: email,
                    );
                  }));
                  print(email); */
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BottomNavBar();
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
