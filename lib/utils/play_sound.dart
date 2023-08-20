import 'package:audioplayers/audioplayers.dart';

class PlaySound {
  static AudioCache player = AudioCache();

  // Play the sound
  Future<void> playSound(String soundName) async {
    final player = AudioPlayer();
    await player.play(AssetSource('$soundName.wav'));
  }
}