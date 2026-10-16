import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/temporizador_provider.dart';
import '../widgets/vista_numero.dart';
import '../widgets/botones_control.dart';

class TemporizadorScreen extends StatelessWidget{

    const TemporizadorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TemporizadorProvider>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VistaNumero(segundos: provider.segundos),
            const SizedBox(height: 40),
            BotonesControl(
              alIniciar: provider.iniciar,
              alDetener: provider.detener,
              alReiniciar: provider.reiniciar,
            ),
          ],
        ),
      ),
    );
  }
}