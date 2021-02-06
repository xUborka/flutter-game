import 'package:flutter/material.dart';

class MyNavBar extends StatefulWidget {
  final Function(int) onPressed;
  final int activeIndex;
  const MyNavBar({this.onPressed, this.activeIndex});
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.yellow,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => widget.onPressed(0),
            child: NewWidgett('navbar_left', Icons.shopping_bag_outlined),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => widget.onPressed(1),
              child: NewWidget('navbar_mid', Icons.play_arrow_rounded),
            ),
          ),
          GestureDetector(
            onTap: () => widget.onPressed(2),
            child: NewWidgett('navbar_right', Icons.handyman_outlined),
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String bgName;
  final IconData icon;
  NewWidget(this.bgName, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/$bgName.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:10),
        child: Icon(icon, color: Colors.black,size: 50,),
      ),
    );
  }
}

class NewWidgett extends StatelessWidget {
  final String bgName;
  final IconData icon;
  NewWidgett(this.bgName, this.icon);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 100,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$bgName.png'),
            fit: BoxFit.fill,
          ),
        ),
      child: Icon(icon, color: Colors.black,size: 50,),
      ),
    );
  }
}
