import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/temporizador_provider.dart';
import '../widgets/vista_numero.dart';
import '../widgets/botones_control.dart';
import 'historial_screent.dart';

class TemporizadorScreen extends StatefulWidget{

    const TemporizadorScreen({super.key});

    @override
    State<TemporizadorScreen> createState() => _TemporizadorScreenState();

}

class _TemporizadorScreenState extends State<TemporizadorScreen> {
  late Future<void> _cargaFuture;

  @override
  void initState() {
    super.initState();
    _cargaFuture = context.read<TemporizadorProvider>().cargarCompletados();
  }


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TemporizadorProvider>();

    return Scaffold(
      body: FutureBuilder(
        future: _cargaFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
        
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Completados: ${provider.completados}'),
                VistaNumero(segundos: provider.segundos),
                const SizedBox(height: 40),
                BotonesControl(
                  alIniciar: provider.iniciar,
                  alDetener: provider.detener,
                  alReiniciar: provider.reiniciar,
                ),
                TextButton(
                  onPressed: () async {
                    final resultado = await
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HistorialScreen(completados: provider.completados)),
                    );
                    if(resultado != null){
                      debugPrint('volvi con: $resultado');
                    }
                  },
                  child: const Text('ver historial'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}