import 'package:flutter/material.dart';

class DraggableTile extends StatelessWidget {
  final int number;
  const DraggableTile({required this.number});

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: number,
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.blueAccent,
          child: Text(
            number.toString(),
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.grey,
          child: Text(
            number.toString(),
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.blue,
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
