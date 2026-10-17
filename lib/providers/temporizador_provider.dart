import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemporizadorProvider extends ChangeNotifier {

    static const int segundosIniciales = 1500;
    int completados = 0;

    int segundos = segundosIniciales;
    Timer? _temporizador;

    void iniciar() {
        debugPrint("start:: iniciar");
        if(_temporizador != null) return;

        _temporizador = Timer.periodic(const Duration(seconds: 1), (t) {
            if (segundos == 0) {
                completados = completados + 1;
                _guardarCompletados();
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

    Future<void> cargarCompletados()async {
        final prefs = await SharedPreferences.getInstance();
        completados = prefs.getInt('completados') ?? 0;
        notifyListeners();
    }

    Future<void> _guardarCompletados() async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('completados', completados);
    }

    @override
    void dispose(){
        _temporizador?.cancel();
        super.dispose();
    }
}