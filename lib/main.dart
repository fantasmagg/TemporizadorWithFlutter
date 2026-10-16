import 'package:provider/provider.dart';
import 'providers/temporizador_provider.dart';
import 'screens/temporizador_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TemporizadorProvider(),
      child: const MaterialApp(home: TemporizadorScreen()),
    ),
  );
}