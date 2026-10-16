import 'dart:async';
import 'package:flutter/material.dart';


class TemporizadorProvider extends ChangeNotifier {

    static const int segundosIniciales = 1500;

    int segundos = segundosIniciales;
    Timer? _temporizador;

    void iniciar() {
        debugPrint("start:: iniciar");
        if(_temporizador != null) return;

        _temporizador = Timer.periodic(const Duration(seconds: 1), (t) {
            if (segundos == 0) {
                detener();
                return;
            }
            segundos = segundos -1;
            notifyListeners();
        });

        debugPrint("final:: iniciar");
    }

    void detener(){
        debugPrint("start:: detener");
        _temporizador?.cancel();
        _temporizador = null;
        notifyListeners(); 
        debugPrint("final:: detener");
        
    }

    void reiniciar() {
        debugPrint("iniciar:: reniciar");
        detener();
        segundos = segundosIniciales;
        notifyListeners();
        debugPrint("final:: reiniciar");
    }

    @override
    void dispose(){
        _temporizador?.cancel();
        super.dispose();
    }
}