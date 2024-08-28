// sound_service.dart
import 'package:audioplayers/audioplayers.dart';

class SoundService {
  final AudioCache _audioCache = AudioCache();

  void playCorrectSound() => _audioCache.play('correct.wav');
  void playIncorrectSound() => _audioCache.play('incorrect.wav');
}
