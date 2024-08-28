import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/screens/number_line_screen.dart';
import 'providers/game_state_provider.dart';

void main() {
  runApp(NumberLineGameApp());
}

class NumberLineGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameStateProvider(),
      child: MaterialApp(
        title: 'Number Line Game',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: NumberLineScreen(),
      ),
    );
  }
}
