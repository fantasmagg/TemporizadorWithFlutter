import 'package:flutter/material.dart';

class HistorialScreen extends StatelessWidget {
    
    const HistorialScreen({super.key, required this.completados});
    final int completados;
    





    @override
    Widget build(BuildContext context) {
        final sesiones = List.generate(50, (i) => 'Sesion numero ${i + 1}');

        return Scaffold(
            appBar: AppBar(title: const Text('Historial')),
            body: Column(
                children: [
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Buscar...',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                ),
                            )
                        ),


                    ),


                    Expanded(
                        child: ListView.builder(
                            itemCount: sesiones.length,
                            itemBuilder: (context, index) {
                                return ListTile(
                                    leading: const Icon(Icons.timer),
                                    title: Text(sesiones[index]),
                                    subtitle: Text('Indice: $index'),
                                );
                            }
                        )
                    )


                ]


            )


        );
    }



    // @override
    // Widget build (BuildContext context) {
    //     return Scaffold(
    //         appBar: AppBar(title: const Text('Historial')),
    //         body: Center(
    //             child: Column (
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                     Text('Has completado $completados temporizadores'),
    //                     ElevatedButton(
    //                         onPressed: () {
    //                             Navigator.pop(context, 'volvi desde historial');
    //                         },
    //                         child: const Text('Volver')
    //                     ),
    //                 ]
    //             ) 
                
    //         ),
            
    //     );
    // }

}