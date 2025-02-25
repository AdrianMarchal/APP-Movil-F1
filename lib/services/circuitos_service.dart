

import 'package:f1_app_final/models/circuitos_model.dart';
import 'package:http/http.dart' as http;

class CircuitosService {

   final String _url = 'https://backendf1-lsvk.onrender.com/api/v1/circuitos';

    Future<List<Circuito>> getAllCircuitos(String apiKey) async {
    
    Uri uri = Uri.parse("$_url/all?authToken=$apiKey"); 
    final response = await http.get(uri);
    CircuitosResponse circuitosResponse = circuitosResponseFromJson(response.body);
    
    return circuitosResponse.circuitos;
  
  }
}