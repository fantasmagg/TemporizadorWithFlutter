import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Temporizador()));
}


class Temporizador extends StatefulWidget {
  const Temporizador({super.key});

  @override
  State<Temporizador>createState() => _TemporizadorState();
}

class _TemporizadorState extends State<Temporizador>{

  int segundos = 60;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$segundos'),
            ElevatedButton(
              onPressed: restar,
              child: Text('Restar')
            )
          ]
        ),
      ),
    );
  }


  void restar() {
  setState(() {
    segundos = segundos - 1;
  });
}

}

