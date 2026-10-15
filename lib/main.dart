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
  int segundos = 1500;

  Timer? temporizador;

  void iniciar() {

    if (temporizador != null) return;

    temporizador = Timer.periodic(const Duration(seconds: 1), (t) {
      
      if (segundos == 0) {
        detener();
        return;
      }

      setState(() {
        segundos = segundos - 1;
      });
    });
  }

  void detener () {
    temporizador?.cancel();
    temporizador = null;
    setState(() {});
  }

  void reiniciar() {
    detener();
    setState(() {
      segundos = 1500;
    });
  }

  @override
  void dispose(){
    temporizador?.cancel();
    super.dispose();
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
            BotonesCOntrol(alIniciar: iniciar,alReiniciar: reiniciar,alDetener: detener)
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
      formatear(),
      style: const TextStyle(fontSize: 48),
    );
  }

  String formatear () {
    int minutos = segundos ~/60;
    int segs = segundos % 60;

    return '${minutos.toString().padLeft(2, '0')}:${segs.toString().padLeft(2, '0')}';
  }

}


class BotonesCOntrol extends StatelessWidget {
  final VoidCallback alIniciar;
  final VoidCallback alDetener;
  final VoidCallback alReiniciar;
  

  const BotonesCOntrol({super.key, required this.alIniciar,  required this.alDetener,  required this.alReiniciar});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: alIniciar,
          child: const Text('Iniciar'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: alReiniciar,
          child: const Text('Reiniciar')
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: alDetener,
          child: const Text('Detener')
        )
      ]
    );
  }

}