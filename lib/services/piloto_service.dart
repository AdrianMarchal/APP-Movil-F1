

import 'dart:convert';


import 'package:f1_app_final/models/piloto_model.dart';
import 'package:http/http.dart' as http;

class PilotoService {
  
  
  final String _url = 'https://backendf1-lsvk.onrender.com/api/v1/pilotos';

  Future<List<Piloto>> getAllPilotos(String apiKey) async {
    
    Uri uri = Uri.parse("$_url/all?authToken=$apiKey"); 
    final response = await http.get(uri);
    PilotosResponse pilotosResponse = pilotosResponseFromJson(response.body);
    
    return pilotosResponse.pilotos;
  
  }

Future<Piloto> getPilotoByName(String api_key, String nombreCompleto) async {
  Uri uri = Uri.parse("$_url/search/nombre/$nombreCompleto?authToken=$api_key");
 

  final response = await http.get(uri);


  return Piloto.fromJson(jsonDecode(response.body)["pilotos"][0]);
}
}