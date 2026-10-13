import 'dart:async';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(home: TemporizadorScreen()));
}


class TemporizadorScreen extends StatefulWidget {
  const TemporizadorScreen({super.key});

  @override
  State<TemporizadorScreen> createState() => _TemporizadorScreenState();
}

class _TemporizadorScreenState extends State<TemporizadorScreen> {
  int segundos = 60;

  Timer? temporizador;

  void iniciar() {
    temporizador = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        segundos = segundos - 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VistaNumero(segundos: segundos),
            const SizedBox(height: 40),
            BotonesCOntrol(alIniciar: iniciar)
          ]
        )
      )
    );
  }
}

class VistaNumero extends StatelessWidget {

  final int segundos;

  const VistaNumero({super.key, required this.segundos});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$segundos',
      style: const TextStyle(fontSize: 48),
    );
  }

}


class BotonesCOntrol extends StatelessWidget {
  final VoidCallback alIniciar;

  const BotonesCOntrol({super.key, required this.alIniciar});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: alIniciar,
          child: const Text('Iniciar'),
        )
      ]
    );
  }

}