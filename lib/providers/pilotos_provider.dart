
import 'package:f1_app_final/models/piloto_model.dart';
import 'package:f1_app_final/services/piloto_service.dart';
import 'package:flutter/material.dart';

class PilotosProvider with ChangeNotifier{
  List<Piloto> pilotos = [];
  PilotoService pilotoService = PilotoService();

  PilotosProvider(){

  }

  getAllPilotos(String api_key) async{
    pilotos =  await pilotoService.getAllPilotos(api_key);
    notifyListeners();
  }
}