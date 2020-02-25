import 'package:flutter/material.dart';
import 'package:noorania/domain/SoundDirectoryController.dart';

class LettersScreen extends StatefulWidget {
  @override
  _LettersScreenState createState() => _LettersScreenState();
}

class _LettersScreenState extends State<LettersScreen> {
  SoundDirectoryController controller = new SoundDirectoryController();

  var letters = [
    {'letter': 'ا', 'sound': 'Alef'},
    {'letter': 'ب', 'sound': 'Ba2'},
    {'letter': 'ت', 'sound': 'Ta2'},
    {'letter': 'ث', 'sound': 'Tha2'},
    {'letter': 'ج', 'sound': 'Geem'},
    {'letter': 'ح', 'sound': '7a2'},
    {'letter': 'خ', 'sound': 'Kha2'},
    {'letter': 'د', 'sound': 'Dal'},
    {'letter': 'ذ', 'sound': 'Thal'},
    {'letter': 'ر', 'sound': 'Rah'},
    {'letter': 'ز', 'sound': 'Zah'},
    {'letter': 'س', 'sound': 'Seen'},
    {'letter': 'ش', 'sound': 'Sheen'},
    {'letter': 'ص', 'sound': 'Sad'},
    {'letter': 'ض', 'sound': 'Daad'},
    {'letter': 'ط', 'sound': 'Tah'},
    {'letter': 'ظ', 'sound': 'Thah'},
    {'letter': 'ع', 'sound': '3een'},
    {'letter': 'غ', 'sound': 'Gheen'},
    {'letter': 'ف', 'sound': 'Fah'},
    {'letter': 'ق', 'sound': 'Kaf'},
    {'letter': 'ك', 'sound': 'Kaaf'},
    {'letter': 'ل', 'sound': 'Lam'},
    {'letter': 'م', 'sound': 'Meem'},
    {'letter': 'ن', 'sound': 'Noon'},
    {'letter': 'و', 'sound': 'Waw'},
    {'letter': 'ه', 'sound': 'Hah'},
    {'letter': 'ء', 'sound': 'Hamzeh'},
    {'letter': 'ى', 'sound': 'Yah'},
    {'letter': 'ي', 'sound': 'Yah'}
  ];
  var harakat = ['َ ', 'ُ ', 'ِ '];

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
        title: Text('القاعدة النورانية'),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: GridView.count(
        crossAxisCount: 2,
        children: letters.map((index) => addArabicLetterCards(index)).toList(),
      )),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  InkWell addArabicLetterCards(Map letter) {
    return InkWell(
      onTap: () => controller.lettersSound(letter),
      child: Card(
        color: Colors.amber[50],
        margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: Center(
          child: Text(
            letter['letter'],
            style: TextStyle(fontSize: 48),
          ),
        ),
      ),
    );
  }
}
