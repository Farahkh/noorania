import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:noorania/presentation/TanweenScreen.dart';
import 'package:noorania/presentation/harakatScreen.dart';
import 'package:noorania/presentation/lettersScreen.dart';
import 'package:noorania/presentation/mdoodScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('ar')],
      title: 'القاعدة النورانية',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'القاعدة النوارنية'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: GridView.count(
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LettersScreen()),
            ),
            child: Card(
              color: Colors.amber[50],
              margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: Center(
                child: Text(
                  'الحروف الأبجدية',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HarakatScreen()),
            ),
            child: Card(
                color: Colors.amber[50],
                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                child: Center(
                    child: Text(
                  'الحركات',
                  style: TextStyle(fontSize: 32),
                ))),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MdoodScreen()),
            ),
            child: Card(
                color: Colors.amber[50],
                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                child: Center(
                    child: Text(
                  'المدود',
                  style: TextStyle(fontSize: 32),
                ))),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TanweenScreen()),
            ),
            child: Card(
                color: Colors.amber[50],
                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                child: Center(
                    child: Text(
                  'التنوين',
                  style: TextStyle(fontSize: 32),
                ))),
          ),
        ],
      )),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
