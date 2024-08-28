import 'package:flutter/material.dart';
import 'package:number_line_game/providers/game_state_provider.dart';
import 'package:provider/provider.dart';

class DropTarget extends StatelessWidget {
  final int position;

  const DropTarget({required this.position});

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameStateProvider>(context, listen: false);

    return DragTarget<int>(
      onAccept: (receivedNumber) {
        if (gameState.checkPlacement(receivedNumber, position)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Correct!')),
          );

          if (gameState.isLevelComplete()) {
            gameState.nextLevel();
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Try Again!')),
          );
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: candidateData.isEmpty ? Colors.white : Colors.greenAccent,
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: Text(
              gameState.placedNumbers.contains(position) ? position.toString() : '?',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    );
  }
}
