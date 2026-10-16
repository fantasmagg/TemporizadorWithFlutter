import 'package:flutter/material.dart';

class VistaNumero extends StatelessWidget {
    final int segundos;

    const VistaNumero({super.key, required this.segundos});

    String formatear() {
        int minutos = segundos ~/ 60;
        int segs = segundos % 60;
        return '${minutos.toString().padLeft(2,'0')}:${segs.toString().padLeft(2,'0')}';
    }

    @override
    Widget build(BuildContext context) {
        return Text(
            formatear(),
            style: const TextStyle(fontSize: 48),
        );
    }
}