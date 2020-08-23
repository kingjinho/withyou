import 'package:flutter/material.dart';
import 'package:withyou/screen/calendar.dart';
import 'package:withyou/screen/settings.dart';
import 'package:withyou/screen/home.dart';

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEBF3),
      body: PageView(
        controller: PageController(initialPage: 1),
        children: [Calendar(), Home(), Settings()],
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) => {_onPageChanged(value)},
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(200, 255, 133, 133),
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text("Calendar")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          /* BottomNavigationBarItem(icon: Icon(Icons.games), title: Text("Game")), */
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")),
        ],
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
