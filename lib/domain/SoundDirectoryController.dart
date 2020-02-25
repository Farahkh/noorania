import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundDirectoryController{

  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  static AudioCache letterPlayer = AudioCache(prefix: 'letters/');
  static AudioCache fat7ahPlayer = AudioCache(prefix: 'harakat/fat7a/');
  static AudioCache dammaPlayer = AudioCache(prefix: 'harakat/damma/');
  static AudioCache kasrahPlayer = AudioCache(prefix: 'harakat/kasrah/');
  static AudioCache alefmadPlayer = AudioCache(prefix: 'mdood/alef/');
  static AudioCache wawmadPlayer = AudioCache(prefix: 'mdood/waw/');
  static AudioCache yamadPlayer = AudioCache(prefix: 'mdood/ya/');



  void lettersSound(Map letter){
   var letterName = letter['letter'];
   var letterSound = letter['sound'];
   letterPlayer.play('$letterSound.mp3');
  }

  void harakatSound(Map letter, String harakah){
    var letterName = letter['letter'];
    var letterSound = letter['sound'];
switch (harakah){
  case 'fat7ah':
    fat7ahPlayer.play('fat7ah.mp3');
    break;
  case 'damma':
    dammaPlayer.play('damma.mp3');
    break;
  case 'kasrah':
    kasrahPlayer.play('kasrah.mp3');
    break;
}
  }

  void  mdoodSound(){

  }

}