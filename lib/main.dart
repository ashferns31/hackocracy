//import 'package:hackocracy/login_screen.dart';
//import 'package:hackocracy/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackocracy/welcome_screen.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:http/http.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';

/* void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: WelcomeScreen()));
 */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: BottomNavBar()));
}


class BottomNavBar extends StatefulWidget {
  final String email;
  static const id='navbar';
  BottomNavBar({this.email});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _pageController;
  int _page = 0;
  @override
  void initState() {
    super.initState();
    _page = 1;
    _pageController = PageController();
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int index) {
    setState(() {
      this._page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: [
            MainScreen(widget.email),
            FirstPage(),
            ThirdPage(email: widget.email),
          ],
          onPageChanged: onPageChanged,
          controller: _pageController,
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color(0xFF013220),
            ),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Color(0xFF99ddff),
                    ),
                    title: Text(
                      "HOME",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF99ddff),
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.description,
                      color: Color(0xFF99ddff),
                    ),
                    title: Text(
                      "EVENTS",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF99ddff),
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.camera,
                      color: Color(0xFF99ddff),
                    ),
                    title: Text(
                      "CAMERA",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF99ddff),
                      ),
                    ))
              ],
              onTap: navigationTapped,
              currentIndex: _page,
            )));
  }
}
