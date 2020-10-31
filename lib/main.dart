//import 'package:hackocracy/login_screen.dart';
//import 'package:hackocracy/welcome_screen.dart';
import 'package:flutter/material.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:http/http.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  final String email;
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
              canvasColor: const Color(0xFF111328),
            ),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.amber,
                    ),
                    title: Text(
                      "HOME",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.amber,
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.description,
                      color: Colors.amber,
                    ),
                    title: Text(
                      "EVENTS",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.amber,
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.camera,
                      color: Colors.amber,
                    ),
                    title: Text(
                      "CAMERA",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.amber,
                      ),
                    ))
              ],
              onTap: navigationTapped,
              currentIndex: _page,
            )));
  }
}
