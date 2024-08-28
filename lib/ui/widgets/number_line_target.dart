// number_line_target.dart
import 'package:flutter/material.dart';

class NumberLineTarget extends StatelessWidget {
  final int expectedNumber;
  final Function(int) onAccepted;

  const NumberLineTarget({required this.expectedNumber, required this.onAccepted});

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onAccept: onAccepted,
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: candidateData.isEmpty ? Colors.white : Colors.blueAccent,
            border: Border.all(color: Colors.black),
          ),
          child: Center(child: Text('?', style: TextStyle(fontSize: 24))),
        );
      },
    );
  }
}
