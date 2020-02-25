import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';



class MdoodScreen extends StatefulWidget {

  @override
  _MdoodScreenState createState() => _MdoodScreenState();
}

class _MdoodScreenState extends State<MdoodScreen> {
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  static AudioCache player = AudioCache();
  var letters = [
    {'letter': 'ا', 'sound': 'Alef'},
    {'letter': 'ب', 'sound': 'Ba'},
    {'letter': 'ت', 'sound': 'Tah'},
    {'letter': 'ث', 'sound': 'tha'},
    {'letter': 'ج', 'sound': 'Jem'},
    {'letter': 'ح', 'sound': '7ah'},
    {'letter': 'خ', 'sound': 'Khah'},
    {'letter': 'د', 'sound': 'Dal'},
    {'letter': 'ذ', 'sound': 'Thal'},
    {'letter': 'ر', 'sound': 'Rah'},
    {'letter': 'ز', 'sound': 'Zay'},
    {'letter': 'س', 'sound': 'Sen'},
    {'letter': 'ش', 'sound': 'Shen'},
    {'letter': 'ص', 'sound': 'Sad'},
    {'letter': 'ض', 'sound': 'Dad'},
    {'letter': 'ط', 'sound': 'Ta'},
    {'letter': 'ظ', 'sound': 'Thah'},
    {'letter': 'ع', 'sound': '3en'},
    {'letter': 'غ', 'sound': 'Ghaen'},
    {'letter': 'ف', 'sound': 'Fah'},
    {'letter': 'ق', 'sound': 'Kaf'},
    {'letter': 'ك', 'sound': 'Khaf'},
    {'letter': 'ل', 'sound': 'Lam'},
    {'letter': 'م', 'sound': 'Meem'},
    {'letter': 'ن', 'sound': 'Noon'},
    {'letter': 'و', 'sound': 'Waw'},
    {'letter': 'ه', 'sound': 'Haa'},
    {'letter': 'ء', 'sound': 'Hamzah'},
    {'letter': 'ى', 'sound': 'Ya'},
    {'letter': 'ي', 'sound': 'Ya'}
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
        title: Text(''),
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
      onTap: () => playLetter(letter),
      child: Card(
        color: Colors.amber[50],
        margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.amberAccent,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                        tooltip:'ألف',
                        enableFeedback: true,
                        padding: EdgeInsets.all(4.0),
                        icon: Icon(
                          IconData(65165),
                          size: 26,
                        ),
                        onPressed: () {}),
                  ),
                ),
                Expanded(
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.indigoAccent,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                        tooltip:'واو',
                        enableFeedback: true,
                        padding: EdgeInsets.all(4.0),
                        icon: Icon(
                          IconData(1608),
                          size: 26,
                        ),
                        onPressed: () {}),
                  ),
                ),
              ],
            ),
            Text(
              letter['letter'],
              style: TextStyle(fontSize: 46),
            ),
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.deepPurple,
                shape: CircleBorder(),
              ),
              child: IconButton(
                  tooltip:'ياء',
                  enableFeedback: true,
                  padding: EdgeInsets.all(4.0),
                  icon: Icon(
                    IconData(1609),
                    size: 26,
                  ),
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }

  playLetter(Map letter) {
    var letterName = letter['letter'];
    var letterSound = letter['sound'];
    player.play('$letterSound.mp3');
    print('letter $letterName is clicked');
//    player.clear('$letterSound.mp3');
  }
}
