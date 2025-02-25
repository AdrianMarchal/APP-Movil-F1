
import 'package:f1_app_final/models/equipo_model.dart';
import 'package:f1_app_final/services/equipo_service.dart';
import 'package:flutter/material.dart';

class EquipoProvider with ChangeNotifier {
  List<Equipo> equipos = [];
  EquipoService equipoService = EquipoService();

  PilotosProvider(){

  }

  getAllEquipos(String api_key) async{
    equipos =  await equipoService.getAllPilotos(api_key);
    print(equipos);
    notifyListeners();
  }
}