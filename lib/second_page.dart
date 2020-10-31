import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  final String email;
  MainScreen(this.email);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String emaile;

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
        backgroundColor: Color(0xFF111328), 
        body: ListView(
          children: <Widget>[
            SizedBox(height: 50.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Text('CLEAN',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  SizedBox(width: 10.0),
                  Text('Goa',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 25.0))
                ],
              ),
            ),
            SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Logged In As: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        widget.email ?? 'Current User',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                height: 30.0),
            Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 185.0,
                decoration: BoxDecoration(
                  color: Color(0xFFBBDEFB),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(75.0)),
                ),
                child: ListView(children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 220.0,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(75.0),
                                    bottomLeft: Radius.circular(75.0)),
                              ),
                              margin: EdgeInsets.all(9.0),
                              color: Colors.blueAccent,
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Text("Your User Points",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 25.0)),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text("0",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0)),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text("Your Rating",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 25.0)),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text("3.5",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0)),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text("About Us",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF111328),
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "We are a group of Final Year Computer Engineering Students of Padre Conceicao College of Engineering",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SyneMono',
                                  color: Color(0xFF111328),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                        ),
                        SizedBox(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 9.0,
                            color: Colors.white,
                            margin: EdgeInsets.all(9.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                  size: 80.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text("Errol Costabir",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'SyneMono',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 9.0,
                            color: Colors.white,
                            margin: EdgeInsets.all(9.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                  size: 80.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text("Ashier Fernandes",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'SyneMono',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 9.0,
                            color: Colors.white,
                            margin: EdgeInsets.all(9.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                  size: 80.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text("Maverick Cardozo",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'SyneMono',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 9.0,
                            color: Colors.white,
                            margin: EdgeInsets.all(9.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                  size: 80.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text("Ralph Furtado",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'SyneMono',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}

