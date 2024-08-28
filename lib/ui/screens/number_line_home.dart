import 'package:flutter/material.dart';
import 'package:number_line_game/ui/widgets/draggable_tile.dart';
import 'package:number_line_game/ui/widgets/number_line.dart';
import 'package:number_line_game/ui/widgets/drop_target.dart';
import 'package:number_line_game/providers/game_state_provider.dart';
import 'package:provider/provider.dart';

class NumberLineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameStateProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Number Line Game')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: gameState.currentLevel / levels.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            NumberLine(start: gameState.rangeStart, end: gameState.rangeEnd),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: gameState.numbers.map((number) {
                return DraggableTile(number: number);
              }).toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                gameState.rangeEnd - gameState.rangeStart + 1,
                    (index) => DropTarget(position: gameState.rangeStart + index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
