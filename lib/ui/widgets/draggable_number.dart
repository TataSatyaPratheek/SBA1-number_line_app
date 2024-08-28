// draggable_number.dart
import 'package:flutter/material.dart';

class DraggableNumber extends StatelessWidget {
  final int number;
  const DraggableNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: number,
      feedback: Material(
        color: Colors.transparent,
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 32, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 32, color: Colors.grey),
        ),
      ),
      child: Text(
        number.toString(),
        style: TextStyle(fontSize: 32, color: Colors.black),
      ),
    );
  }
}
