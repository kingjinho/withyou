import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:withyou/component/database/WYdatabase.dart';
import 'package:withyou/screen/main.dart';
import 'package:withyou/shared/Colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'With You',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        primaryColor: colorNeuGrey,
        fontFamily: "DoHyeon",
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'With You'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Main(),
        ));
  }

  @override
  void initState() {
    super.initState();
    WYDatabase.open();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Color(0xFFEAEBF3),
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                  child: Text("Welcome!\n안녕하세요!\n你好!",
                      style:
                          TextStyle(color: Color(0xff545454), fontSize: 70.0))),
              Container(
                  child: SliderButton(
                action: () {
                  _openPage();
                },
                vibrationFlag: false,
                label: Text(
                  "Against COVID-19 💪",
                  style: TextStyle(
                      color: Color.fromARGB(255, 89, 89, 89), fontSize: 26),
                ),
                icon: Text(
                  "",
                  style: TextStyle(fontSize: 70.0),
                ),
                buttonColor: Color(0xff545454),
                width: 350,
                height: 70,
                radius: 70,
                buttonSize: 70,
                shimmer: false,
                dismissible: false,
              ))
            ],
          ),
        )));
  }
}
