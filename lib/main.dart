import 'package:flutter/material.dart';
import 'package:number_line_app/ui/screens/number_line_home.dart';
import 'package:number_line_app/providers/game_state_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NumberLineApp());
}

class NumberLineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameStateProvider(),
      child: MaterialApp(
        title: 'Interactive Number Line',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NumberLineHome(),
      ),
    );
  }
}
