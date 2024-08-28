// number_line_home.dart
import 'package:flutter/material.dart';
import 'package:number_line_app/ui/widgets/draggable_number.dart';
import 'package:number_line_app/ui/widgets/number_line_painter.dart';
import 'package:number_line_app/ui/widgets/number_line_target.dart';
import 'package:number_line_app/providers/game_state_provider.dart';
import 'package:provider/provider.dart';

class NumberLineHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameStateProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Interactive Number Line')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: gameState.currentLevelProgress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 100),
              painter: NumberLinePainter(start: 0, end: gameState.numberRange),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: gameState.currentNumbers
                  .map((number) => DraggableNumber(number: number))
                  .toList(),
            ),
            SizedBox(height: 20),
            NumberLineTarget(
              expectedNumber: gameState.expectedNumber,
              onAccepted: gameState.checkPlacement,
            ),
          ],
        ),
      ),
    );
  }
}
