// game_state_provider.dart
import 'package:flutter/material.dart';

class GameStateProvider with ChangeNotifier {
  int currentLevel = 1;
  int expectedNumber = 3;
  List<int> currentNumbers = [3, 7, 1];
  int numberRange = 10;

  double get currentLevelProgress => currentLevel / 10;

  void checkPlacement(int number) {
    if (number == expectedNumber) {
      // Correct placement logic
      // Example: Increase level or give feedback
      notifyListeners();
    } else {
      // Incorrect placement logic
      notifyListeners();
    }
  }

  void levelUp() {
    currentLevel++;
    // Logic to update currentNumbers, expectedNumber, and numberRange
    notifyListeners();
  }
}
