
import 'package:f1_app_final/models/circuitos_model.dart';
import 'package:f1_app_final/services/circuitos_service.dart';
import 'package:flutter/material.dart';

class CircuitoProvider with ChangeNotifier{
  List<Circuito> circuitos = [];
  CircuitosService circuitosService = CircuitosService();

  PilotosProvider(){

  }

  getAllEquipos(String api_key) async{
    circuitos =  await circuitosService.getAllCircuitos(api_key);
    circuitos[8].lugar = "España";
    circuitos[8].nombrePremio = "FORMULA 1 ARAMCO GRAN PREMIO DE ESPAÑA 2025";
    notifyListeners();
  }
}