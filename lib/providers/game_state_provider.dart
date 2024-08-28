import 'package:flutter/material.dart';
import 'package:number_line_game/models/level_data.dart';

class GameStateProvider with ChangeNotifier {
  int currentLevel = 1;
  int rangeStart = 0;
  int rangeEnd = 10;
  List<int> numbers = [];
  List<int> placedNumbers = [];

  GameStateProvider() {
    loadLevel(currentLevel);
  }

  void loadLevel(int level) {
    final levelData = levels[level - 1];
    rangeStart = levelData['rangeStart'];
    rangeEnd = levelData['rangeEnd'];
    numbers = List<int>.from(levelData['numbers']);
    placedNumbers = List<int>.filled(numbers.length, -1);
    notifyListeners();
  }

  bool checkPlacement(int number, int position) {
    if (number == position) {
      placedNumbers[numbers.indexOf(number)] = number;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool isLevelComplete() {
    return placedNumbers.every((num) => num != -1);
  }

  void nextLevel() {
    if (currentLevel < levels.length) {
      currentLevel++;
      loadLevel(currentLevel);
    } else {
      currentLevel = 1;
      loadLevel(currentLevel);
    }
    notifyListeners();
  }
}
