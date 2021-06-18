import 'package:flutter/material.dart';
import 'package:sound_kit/screens/home/settings.dart';
import 'package:sound_kit/screens/home/sound.dart';
import 'package:sound_kit/screens/home/userProfile.dart';
import 'package:sound_kit/utils/constants.dart';
import 'package:sound_kit/utils/helpers.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _currentIndex = 1;
  final List<Widget> _children = [
    UserProfile(),
    CurrentSound(),
    Settings(),
  ];

  void _onTabPressed(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sound Master'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        onTap: _onTabPressed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_twighlight),
              label: 'Sound Level'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
