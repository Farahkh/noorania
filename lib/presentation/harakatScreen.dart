import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:noorania/domain/SoundDirectoryController.dart';

class HarakatScreen extends StatefulWidget {
  @override
  _HarakatScreenState createState() => _HarakatScreenState();
}

class _HarakatScreenState extends State<HarakatScreen> {
  SoundDirectoryController controller = new SoundDirectoryController();

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

  List<bool> isSelected = List.generate(3, (_) => false);
  String animationName;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    CardController controller;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(''),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          ToggleButtons(
            constraints: BoxConstraints.expand(width: 120, height: 150),
            renderBorder: false,
            disabledColor: Colors.black12,
            selectedColor: Colors.deepOrange,
            children: <Widget>[
              FlareActor(
                'assets/Fat7a.flr',
                fit: BoxFit.cover,
                alignment: Alignment.center,
                animation: animationName,
              ),
              FlareActor(
                'assets/Damma.flr',
                fit: BoxFit.cover,
                alignment: Alignment.center,
                animation: animationName,
              ),
              FlareActor(
                'assets/Kasrah.flr',
                fit: BoxFit.cover,
                alignment: Alignment.center,
                animation: animationName,
              ),
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = !isSelected[buttonIndex];
                    if (animationName == null) {
                      animationName = 'jumping';
                    } else {
                      animationName = null;
                    }
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: isSelected,
          ),
          Expanded(
              child: new TinderSwapCard(
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: letters.length,
                  stackNum: letters.length,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width * 0.9,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) => addArabicLetterCards(index),
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                    } else if (align.x > 0) {
                      //Card is RIGHT swiping
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                  })),
        ],
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  InkWell addArabicLetterCards(int index) {
    return InkWell(
        onTap: () => playLetter(letters[index]),
        child: Container(
          height: 300,
          width: 300,
          child: Card(
            semanticContainer: true,
            color: Colors.amber,
            child: Center(
              child: isSelected.any((e) => e == true)
                  ? displayLetter(
                      letters[index]['letter'], isSelected.indexOf(true))
                  : Text(
                      letters[index]['letter'],
                      style: TextStyle(fontSize: 96),
                    ),
            ),
          ),
        ));
  }

  Widget displayLetter(String letter, int harakah) {
    switch (harakah) {
      case 0:
        return Text(
          '$letter\u064E',
          style: TextStyle(fontSize: 96),
        );
        break;

      case 1:
        return Text(
          '$letter\u064F',
          style: TextStyle(fontSize: 96),
        );
        break;

      case 2:
        return Text(
          '$letter\u0650',
          style: TextStyle(fontSize: 96),
        );
        break;
    }
  }

  playLetter(Map letter) {
    int index = isSelected.indexOf(true);
    switch (index) {
      case 0:
        controller.harakatSound(letter, 'fat7ah');

        break;

      case 1:
        controller.harakatSound(letter, 'damma');
        break;

      case 2:
        controller.harakatSound(letter, 'kasrah');
        break;
    }
    var letterName = letter['letter'];
    var letterSound = letter['sound'];
//    player.play('$letterSound.mp3');
    print('letter $letterName is clicked');
//    player.clear('$letterSound.mp3');
  }
}
