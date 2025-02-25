
import 'package:f1_app_final/models/equipo_model.dart';
import 'package:f1_app_final/models/piloto_model.dart';
import 'package:f1_app_final/services/piloto_service.dart';
import 'package:http/http.dart' as http;

class EquipoService {
  final String _url = 'https://backendf1-lsvk.onrender.com/api/v1/equipos';
  PilotoService pilotoService = PilotoService();

  Future<List<Equipo>> getAllPilotos(String api_key) async {
    Uri uri = Uri.parse(_url+"/all?authToken="+api_key);
    print("Soy el servicio y esta es mi url " + uri.toString());
    final response = await http.get(uri);
    EquipoResponse equipoResponse = equipoResponseFromJson(response.body);
    List<Equipo> equipos = equipoResponse.equipos;
    print("Soy la lista de equipos del servicio" + equipos.toString());
    for (var equipo in equipos) {
      Piloto piloto1 = await pilotoService.getPilotoByName(api_key, equipo.piloto1);
      Piloto piloto2 = await pilotoService.getPilotoByName(api_key, equipo.piloto2);
      equipo.pilotoCompleto1 = piloto1;
      equipo.pilotoCompleto2 = piloto2;
    }

    return equipos ;
  }
}