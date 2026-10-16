import 'package:flutter/material.dart';

class BotonesControl extends StatelessWidget {
    final VoidCallback alIniciar;
    final VoidCallback alDetener;
    final VoidCallback alReiniciar;

    const BotonesControl({
        super.key,
        required this.alIniciar,
        required this.alDetener,
        required this.alReiniciar
    });

    @override
    Widget build(BuildContext context) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                FloatingActionButton(
                    heroTag: 'reiniciar',
                    onPressed: alReiniciar,
                    child: Icon(Icons.replay)
                ),
                const SizedBox(width:10),
                FloatingActionButton.large(
                    heroTag: 'iniciar',
                    onPressed: alIniciar,
                    child: Icon(Icons.play_arrow)
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                    heroTag: 'add'
                    ,onPressed : alDetener,
                    child: Icon(Icons.add)
                )
            ]
        );
    }
}