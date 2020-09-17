import 'package:flutter/material.dart';
import 'package:withyou/component/database/WYdatabase.dart';
import 'package:withyou/screen/Calendar.dart';
import 'package:withyou/screen/Settings.dart';
import 'package:withyou/screen/Home.dart';

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<Main> {
  /*  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } */

  @override
  void initState() {
    super.initState();
    openDatabase();
  }

  void openDatabase() async {
    WYDatabase.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEBF3),
      body: PageView(
        controller: PageController(initialPage: 1),
        children: [Calendar(), Home(), Settings()],
        scrollDirection: Axis.horizontal,
      ),
      /* bottomNavigationBar: BottomNavigationBar(
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
      ), */
    );
  }
}
