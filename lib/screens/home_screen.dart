import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/screens/preferences_screen.dart';
import 'package:flutter_game/screens/shop_screen.dart';
import 'package:flutter_game/screens/title_screen.dart';
import 'package:flutter_game/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  PageController _pageController;
  final List<Widget> viewContainer = [
    ShopScreen(),
    TitleScreen(),
    PreferencesScreen()
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;

        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      });
    }

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: viewContainer,
        ),
      ),
      bottomNavigationBar: MyNavBar(
        onPressed: (i) => onTabTapped(i),
        activeIndex: 1,
      ),
    );
  }
}
