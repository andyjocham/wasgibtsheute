import 'package:flutter/material.dart';
import 'package:was_gibts_heute/pages/home_screen.dart';
import 'package:was_gibts_heute/pages/database.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Was gibts heute?",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigatorPage(),
    );
  }
}

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        children: [
          Homescreen(),
          Database(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: "Datenbank"),
        ],
        onTap: (newIndex) {
          pageController.animateToPage(newIndex,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}
