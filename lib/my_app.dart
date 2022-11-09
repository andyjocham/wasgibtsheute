// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:was_gibts_heute/config.dart';
import 'package:was_gibts_heute/models/list_item.dart';
import 'package:was_gibts_heute/pages/addItem_screen.dart';
import 'package:was_gibts_heute/pages/home_screen.dart';
import 'package:was_gibts_heute/pages/gerichte_liste.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Configuration(
      gerichtelisteList: [
        ListItem(name: "Spaghetti"),
        ListItem(name: "Schnitzel"),
        ListItem(name: "Wurstsalat"),
        ListItem(name: "Burger"),
        ListItem(name: "Maultaschensuppe"),
        ListItem(name: "Chinesische Nudeln"),
        ListItem(name: "Käßspätzle"),
        ListItem(name: "Gemüseauflauf"),
        ListItem(name: "Kartoffelauflauf"),
        ListItem(name: "Steak"),
        ListItem(name: "Sandwich"),
        ListItem(name: "Lauchsuppe"),
      ],
      child: MaterialApp(
          title: "Was gibts heute?",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => NavigatorPage(),
            '/add': (context) => AddItemScreen(),
            '/data': (context) => Gerichteliste(),
          }),
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
          Gerichteliste(),
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
