import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/screens/preferences_screen.dart';
import 'package:flutter_game/screens/shop_screen.dart';
import 'package:flutter_game/screens/title_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;

  final List<Widget> viewContainer = [ShopScreen(), TitleScreen(), PreferencesScreen()];

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      body: viewContainer[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: currentIndex,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_sharp),
              label: 'SHOP TODO',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'MAIN TODO',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.brush_sharp),
              label: 'PREF TODO',
            )
          ]),
    );
    // TODO: implement build
  }
}
